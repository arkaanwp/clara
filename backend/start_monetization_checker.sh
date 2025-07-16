#!/bin/bash
cd "$(dirname "$0")"
source venv/bin/activate
uvicorn monetization_checker:app --host 0.0.0.0 --port 8000