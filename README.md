# Clara IT Fest 2025

## Project Structure

```
clara-it-fest-2025/
├── backend/
└── frontend/
```

## Backend Setup
1. Create and activate a Python virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate
   ```
2. Install requirements:
   ```bash
   pip install -r requirements.txt
   ```
3. Set up PostgreSQL and create the database/user as described in the technical specification.

## Frontend Setup
1. Run `flutter doctor` to ensure your environment is ready.
2. Create the Flutter project inside `frontend/`:
   ```bash
   flutter create clara_app
   ```
3. Add dependencies to `pubspec.yaml` as specified.
4. Run `flutter pub get` inside `frontend/clara_app`.

---

See the technical specification for further details on microservices, models, and API contracts.