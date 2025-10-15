# Ecommerce Fullstack App

This repository contains a fullstack e-commerce sample with a Spring Boot backend and a Vite + React frontend.

Contents
- `docker-ecommerce-backend/` — Spring Boot backend (Java 21, Maven)
- `docker-ecommerce-frontend/` — Vite + React frontend
- `mysql-init/` — MySQL initialization SQL (demo data)
- `docker-compose.yml` — local development compose (db, backend, frontend)
- `docker-compose.prod.yml` — production compose (uses images from Docker Hub)
- `.github/workflows/docker-publish.yml` — CI workflow to build/push images and optionally deploy

Quick start (development)

1. Start with Docker Compose:

```powershell
cd "C:\path\to\repo"
docker-compose up -d --build
```

2. Backend API: `http://localhost:8085/api/products`
3. Frontend: `http://localhost:3000`

Build & push to Docker Hub (local)

Make sure you're logged in to Docker Hub:

```powershell
docker login
```

Then run the provided script (it will prompt for Docker Hub username):

```powershell
.\push-to-dockerhub.ps1
```

CI / CD

- The GitHub Actions workflow `docker-publish.yml` builds and pushes backend and frontend images to Docker Hub when you push to `main`.
- To enable deployment, add the following repository secrets in GitHub: `DOCKERHUB_USERNAME`, `DOCKERHUB_TOKEN`, `DEPLOY_HOST`, `DEPLOY_USER`, `DEPLOY_PATH`, `DEPLOY_SSH_KEY`, and `DEPLOY_PORT` (optional, default 22).

Cleaning up
- The repo is organized as a monorepo; backend and frontend histories are preserved via subtree import.

License
- MIT
