# 🛒 E-Commerce Enterprise DevSecOps Pipeline

> An enterprise-grade DevSecOps pipeline for a Flask-based E-Commerce application that automates security testing across the Software Development Life Cycle (SDLC).

![Pipeline](https://github.com/Apart004/Ecommerce-Devsecops-Pipeline/actions/workflows/devsecops-pipeline.yml/badge.svg)
![Python](https://img.shields.io/badge/Python-3.14-blue)
![Flask](https://img.shields.io/badge/Flask-Web_App-black)
![Docker](https://img.shields.io/badge/Docker-Containerization-2496ED)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-CI/CD-2088FF)
![Bandit](https://img.shields.io/badge/Bandit-SAST-red)
![Safety](https://img.shields.io/badge/Safety-SCA-yellow)
![Trivy](https://img.shields.io/badge/Trivy-Container_Security-blue)
![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4)
![Checkov](https://img.shields.io/badge/Checkov-IaC_Security-green)

---

# 📖 Project Overview

Modern software development requires security to be integrated into every phase of the development lifecycle instead of performing security testing only after deployment.

This project demonstrates a complete **DevSecOps CI/CD pipeline** for a Flask-based E-Commerce application by integrating multiple automated security tools that continuously validate:

- Source Code Security
- Dependency Security
- Container Security
- Infrastructure as Code (IaC) Security

The pipeline automatically scans every code change before it can be merged, helping developers identify and fix security issues early.

---

# 🎯 Project Objectives

- Build an automated DevSecOps pipeline
- Containerize a Flask application using Docker
- Automate CI/CD using GitHub Actions
- Detect insecure Python code using Bandit
- Detect vulnerable dependencies using Safety
- Scan Docker images using Trivy
- Secure Terraform infrastructure using Checkov
- Follow enterprise Git workflow using feature branches and Pull Requests

---

# 🏗️ Project Architecture

```
                Developer
                    │
                    │ Push Code
                    ▼
             GitHub Repository
                    │
                    ▼
          GitHub Actions Pipeline
                    │
      ┌─────────────┼──────────────┐
      │             │              │
      ▼             ▼              ▼

   Build/Test     Bandit         Safety
      │             │              │
      └─────────────┼──────────────┘
                    │
                    ▼
                 Trivy
                    │
                    ▼
               Terraform
                    │
                    ▼
                Checkov
                    │
                    ▼
            Pipeline Result
```

---

# ⚙️ Technology Stack

| Category | Technology |
|-----------|------------|
| Language | Python 3.14 |
| Framework | Flask |
| Containerization | Docker |
| Version Control | Git |
| Repository | GitHub |
| CI/CD | GitHub Actions |
| SAST | Bandit |
| SCA | Safety |
| Container Security | Trivy |
| IaC | Terraform |
| IaC Security | Checkov |

---

# 📂 Project Structure

```
Ecommerce-Devsecops-Pipeline
│
├── app/
│   ├── __init__.py
│   └── routes.py
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── .github/
│   └── workflows/
│       └── devsecops-pipeline.yml
│
├── Dockerfile
├── requirements.txt
├── run.py
└── README.md
```

---

# 🚀 DevSecOps Pipeline

Every push or Pull Request automatically executes the following security pipeline.

| Stage | Tool | Purpose |
|---------|------|---------|
| Build | Python | Build & Validate Application |
| Test | Flask | Verify Application Startup |
| SAST | Bandit | Detect insecure Python code |
| SCA | Safety | Detect vulnerable Python packages |
| Container Scan | Trivy | Scan Docker image for vulnerabilities |
| IaC Validation | Terraform | Validate Infrastructure Code |
| IaC Scan | Checkov | Detect Terraform misconfigurations |

---

# 🔐 Security Tools Used

## 1️⃣ Bandit (SAST)

Bandit performs Static Application Security Testing by analyzing Python source code without executing it.

Detects:

- Hardcoded passwords
- Use of eval()
- Weak cryptography
- Insecure functions

---

## 2️⃣ Safety (SCA)

Safety scans Python dependencies against known CVEs.

Detects:

- Vulnerable packages
- Outdated libraries
- Dependency risks

---

## 3️⃣ Trivy

Trivy scans Docker images.

Checks:

- OS vulnerabilities
- Package vulnerabilities
- Secret detection
- Misconfigurations

---

## 4️⃣ Terraform

Infrastructure is managed as code using Terraform.

Resources include:

- AWS VPC
- Public Subnet
- Security Groups
- S3 Bucket
- Flow Logs
- Encryption
- Access Logging

---

## 5️⃣ Checkov

Checkov validates Terraform configuration before deployment.

Detects:

- Open Security Groups
- Missing Encryption
- Missing Logging
- Public Resource Exposure
- Security Misconfigurations

---

# 🧪 Milestones Completed

## ✅ Week 1

✔ Repository Setup

✔ Flask Application

✔ Docker Containerization

✔ GitHub Actions

✔ Bandit Integration

✔ SAST Pipeline Validation

---

## ✅ Week 2

✔ Safety Integration

✔ Trivy Integration

✔ Dependency Scanning

✔ Container Scanning

✔ Combined Security Pipeline

✔ Vulnerable Package Detection Test

---

## ✅ Week 3 (Day 15)

✔ Terraform Infrastructure

✔ Terraform Validation

✔ Checkov Integration

✔ Infrastructure Security Scanning

✔ Milestone Test:

Intentionally opened SSH Port **22** to **0.0.0.0/0**

Result:

✅ Checkov detected the security issue

✅ Pipeline failed successfully

This validated that insecure Infrastructure as Code cannot be merged into the main branch.

---

# 🔄 Git Workflow

The project follows enterprise Git workflow.

```
Feature Branch
      │
      ▼
Commit Changes
      │
      ▼
Push Branch
      │
      ▼
Pull Request
      │
      ▼
Code Review
      │
      ▼
Squash Merge
      │
      ▼
Main Branch
```

No direct commits are made to the main branch.

---

# 📈 Current Progress

| Week | Status |
|--------|--------|
| Week 1 | ✅ Completed |
| Week 2 | ✅ Completed |
| Week 3 (up to Day 15) | ✅ Completed |
| OWASP ZAP | ⏳ Upcoming |
| Scan Artifacts | ⏳ Upcoming |
| Documentation | ⏳ Upcoming |

---

# 💡 Key Learning Outcomes

- DevSecOps Fundamentals
- Secure CI/CD Pipelines
- Docker Containerization
- Static Application Security Testing
- Software Composition Analysis
- Container Security
- Infrastructure as Code
- Infrastructure Security Scanning
- Enterprise Git Workflow
- Secure Development Lifecycle

---

# 📌 Future Enhancements

- OWASP ZAP Dynamic Security Testing
- Automated HTML Security Reports
- Pipeline Artifact Storage
- Production Deployment
- Slack / Email Notifications
- Security Dashboard

---

# 👨‍💻 Author

**Ansh Jagdhari**

Cybersecurity Intern

GitHub: https://github.com/Apart004