import requests

API_URL = "http://localhost:8000/api/check_monetization"

sample_data = {
    "title": "How to Build a Treehouse | Family Friendly DIY",
    "description": "A step-by-step guide to building a safe and fun treehouse for kids.",
    "transcript": "Welcome to our family-friendly DIY project! Today, we're building a treehouse..."
}

response = requests.post(API_URL, json=sample_data)
print("Status Code:", response.status_code)
print("Response:", response.json())