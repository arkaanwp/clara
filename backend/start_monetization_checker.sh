#!/bin/bash
cd "$(dirname "$0")"

if [ -z "$OPENAI_API_KEY" ]; then
  read -sp "Enter your OpenAI API key: " OPENAI_API_KEY
  echo
  export OPENAI_API_KEY
fi

source venv/bin/activate
uvicorn monetization_checker:app --host 0.0.0.0 --port 8000