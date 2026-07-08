# 🛡️ E-Commerce Enterprise IaC DevSecOps Pipeline

![Pipeline](https://github.com/Apart004/Ecommerce-Devsecops-Pipeline/actions/workflows/devsecops-pipeline.yml/badge.svg)

A fully automated, enterprise-grade DevSecOps pipeline built for an e-commerce application. This project integrates multiple security scanning layers — SAST, SCA, Container Scanning, IaC Scanning, and DAST — into a CI/CD pipeline that acts as a strict security gate on every code commit.

---

## 🎯 Project Overview

| Property | Details |
|----------|---------|
| **Domain** | E-Commerce Security |
| **Organization** | Infotact Solutions & Co. |
| **Duration** | 20 Days |
| **Pipeline** | GitHub Actions |
| **Architecture** | Multi-layer DevSecOps |

---

## 🏗️ Architecture

```
Code Commit → GitHub Actions Pipeline
                    │
                    ├── 🔨 Build & Test
                    │       └── Flask app health check
                    │
                    ├── 🔍 SAST Scan (Bandit)
                    │       └── Static code analysis
                    │
                    ├── 📦 SCA Scan (Safety)
                    │       └── Dependency vulnerability scan
                    │
                    ├── 🐳 Container Scan (Trivy)
                    │       └── Docker image CVE scan
                    │
                    ├── 🏗️ IaC Scan (Checkov + Terraform)
                    │       └── Infrastructure misconfiguration scan
                    │
                    └── 🕷️ DAST Scan (OWASP ZAP)
                            └── Runtime vulnerability scan
```

---

## 🔧 Tech Stack

| Layer | Technology | Purpose |
|-------|-----------|---------|
| **Application** | Python Flask | Sample e-commerce REST API |
| **Containerization** | Docker | Application packaging |
| **CI/CD** | GitHub Actions | Pipeline orchestration |
| **SAST** | Bandit | Static code security analysis |
| **SCA** | Safety | Dependency vulnerability scanning |
| **Container Security** | Trivy | Docker image CVE scanning |
| **IaC** | Terraform | AWS infrastructure as code |
| **IaC Security** | Checkov | Terraform misconfiguration scanning |
| **DAST** | OWASP ZAP | Dynamic runtime security testing |

---

## 📁 Project Structure

```
Ecommerce-Devsecops-Pipeline/
├── app/
│   ├── __init__.py          # Flask app factory
│   └── routes.py            # API endpoints
├── terraform/
│   ├── main.tf              # AWS infrastructure
│   ├── variables.tf         # Input variables
│   └── outputs.tf           # Output values
├── .github/
│   └── workflows/
│       └── devsecops-pipeline.yml  # CI/CD pipeline
├── .zap/
│   └── rules.tsv            # ZAP scan rules
├── Dockerfile               # Container definition
├── .dockerignore            # Docker ignore rules
├── .trivyignore             # Trivy ignore rules
├── requirements.txt         # Python dependencies
└── run.py                   # Application entry point
```

---

## 🚀 Pipeline Stages

### 1. 🔨 Build & Test
- Sets up Python 3.11 environment
- Installs all dependencies
- Runs Flask app health check

### 2. 🔍 SAST — Bandit
- Scans Python source code for security vulnerabilities
- Detects hardcoded secrets, dangerous functions, injection risks
- Generates `bandit-report.json` artifact

### 3. 📦 SCA — Safety
- Scans `requirements.txt` for known CVEs
- Checks all dependencies against vulnerability database
- Generates `safety-report.json` artifact

### 4. 🐳 Container Scan — Trivy
- Builds Docker image and scans for CRITICAL/HIGH CVEs
- Checks OS packages and application dependencies inside container
- Generates `trivy-report.json` artifact

### 5. 🏗️ IaC Scan — Checkov + Terraform
- Validates Terraform syntax with `terraform validate`
- Scans Terraform scripts for cloud misconfigurations
- Detects open ports, unencrypted storage, missing logging
- Generates `checkov-report.json` artifact

### 6. 🕷️ DAST — OWASP ZAP
- Starts Flask app inside pipeline
- Runs ZAP baseline scan against live application
- Tests for XSS, missing security headers, injection vulnerabilities
- Generates `zap-report.html` artifact

---

## 🏆 Security Milestones

### Milestone 1 — SAST Gate (Day 5)
Pipeline **automatically failed** when Bandit detected:
- Hardcoded passwords (`SECRET_PASSWORD = "admin123"`)
- Use of `eval()` function (code injection risk)
- Command injection via `subprocess shell=True`

### Milestone 2 — SCA Gate (Day 10)
Pipeline **automatically failed** when Safety detected:
- `requests==2.18.0` with known CVEs
- Vulnerability ID confirmed and remediated by upgrading to `requests>=2.32.2`

### Milestone 3 — IaC Gate (Day 15)
Pipeline **automatically detected** when Checkov found:
- `CKV_AWS_24` — SSH port 22 open to `0.0.0.0/0`
- Security group misconfiguration immediately caught and remediated

---

## 🏛️ Infrastructure (Terraform)

AWS resources defined as code:
- **VPC** with DNS support and flow logs
- **Public Subnet** with secure configuration
- **Security Group** — HTTP/HTTPS only (no open SSH)
- **S3 Bucket** — encrypted, versioned, access logging enabled
- **CloudWatch** — VPC flow log retention
- **IAM Role** — least privilege for flow logs

---

## 🔒 Security Best Practices Followed

- ✅ No hardcoded secrets — GitHub Secrets used
- ✅ No direct commits to `main` — feature branches only
- ✅ Squash merges for clean history
- ✅ Semantic commit messages (`feat:`, `fix:`, `ci:`, `docs:`)
- ✅ Daily commits — continuous contribution history
- ✅ All scan reports saved as downloadable artifacts

---

## 📊 Pipeline Artifacts

Every pipeline run generates downloadable security reports:

| Artifact | Scanner | Format |
|----------|---------|--------|
| `bandit-sast-report` | Bandit | JSON |
| `safety-sca-report` | Safety | JSON |
| `trivy-container-report` | Trivy | JSON |
| `checkov-iac-report` | Checkov | JSON |
| `zap-dast-report` | OWASP ZAP | HTML |

---

## 🏃 How to Run Locally

### Prerequisites
- Python 3.11+
- Docker Desktop
- Git

### Run Flask App
```bash
git clone https://github.com/Apart004/Ecommerce-Devsecops-Pipeline.git
cd Ecommerce-Devsecops-Pipeline
pip install -r requirements.txt
python run.py
```

### Run with Docker
```bash
docker build -t ecommerce-app:latest .
docker run -p 5000:5000 ecommerce-app:latest
```

### API Endpoints
| Endpoint | Method | Description |
|----------|--------|-------------|
| `/` | GET | Welcome message |
| `/products` | GET | List all products |
| `/health` | GET | Health check |

---

## 📅 20-Day Development Timeline

| Week | Days | Focus | Status |
|------|------|-------|--------|
| Week 1 | 1-5 | Containerization & SAST | ✅ |
| Week 2 | 6-10 | Dependency & Container Scanning | ✅ |
| Week 3 | 11-15 | IaC Scanning | ✅ |
| Week 4 | 16-20 | DAST & Submission | ✅ |

---

## 👤 Author

**Ansh Jagdhari**
Cybersecurity Intern — Infotact Solutions & Co.
GitHub: [@Apart004](https://github.com/Apart004)
```