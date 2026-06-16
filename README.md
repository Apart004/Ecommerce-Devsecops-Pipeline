# Ecommerce DevSecOps Pipeline 🛡️

An enterprise-grade DevSecOps pipeline for a Flask e-commerce application.

## Tech Stack
- **App:** Python Flask
- **Containerization:** Docker
- **CI/CD:** GitHub Actions
- **SAST:** Bandit
- **SCA:** Safety
- **Container Scan:** Trivy
- **IaC Scan:** Checkov + Terraform
- **DAST:** OWASP ZAP

## Pipeline Stages
| Stage | Tool | Status |
|-------|------|--------|
| SAST | Bandit | ✅ Active |
| SCA | Safety | 🔜 Upcoming |
| Container Scan | Trivy | 🔜 Upcoming |
| IaC Scan | Checkov | 🔜 Upcoming |
| DAST | OWASP ZAP | 🔜 Upcoming |

## Project Structure
```
├── app/
│   ├── __init__.py
│   └── routes.py
├── .github/workflows/
│   └── devsecops-pipeline.yml
├── Dockerfile
├── requirements.txt
└── run.py
```