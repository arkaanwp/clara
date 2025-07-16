from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import openai
import os

app = FastAPI()

# Load OpenAI API key from environment variable
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
openai.api_key = OPENAI_API_KEY

class VideoInput(BaseModel):
    title: str
    description: str
    transcript: str = ""

class MonetizationResult(BaseModel):
    status: str
    explanation: str

@app.post("/api/check_monetization", response_model=MonetizationResult)
def check_monetization(data: VideoInput):
    if not OPENAI_API_KEY:
        raise HTTPException(status_code=500, detail="OpenAI API key not set.")
    # Concatenate all text fields
    content = f"Title: {data.title}\nDescription: {data.description}\nTranscript: {data.transcript}"
    try:
        response = openai.Moderation.create(input=content)
        results = response["results"][0]
        flagged = results["flagged"]
        categories = results["categories"]
        explanation = []
        # Map OpenAI categories to YouTube monetization risk
        risky = [k for k, v in categories.items() if v]
        if flagged:
            status = "Likely Demonetized"
            explanation.append(f"Flagged categories: {', '.join(risky)}.")
        elif any(categories.values()):
            status = "At Risk"
            explanation.append(f"Potentially risky categories: {', '.join(risky)}.")
        else:
            status = "Likely Monetized"
            explanation.append("No risky content detected.")
        return MonetizationResult(status=status, explanation=" ".join(explanation))
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))