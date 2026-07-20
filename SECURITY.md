# 🔒 Security Policy

## Pipeline Security Gates

This repository implements automated security gates via GitHub Actions.
Every commit triggers the following security checks:

| Scanner | Type | Blocks Pipeline |
|---------|------|----------------|
| Bandit | SAST | On critical findings |
| Safety | SCA | On known CVEs |
| Trivy | Container | On CRITICAL/HIGH CVEs |
| Checkov | IaC | On misconfigurations |
| OWASP ZAP | DAST | On runtime vulnerabilities |

## Reporting a Vulnerability

If you discover a security vulnerability in this project:
1. Do NOT open a public GitHub issue
2. Contact the maintainer directly via GitHub
3. Provide detailed description of the vulnerability
4. Allow 48 hours for response

## Security Best Practices Used

- No hardcoded secrets or API keys
- All sensitive data via GitHub Secrets
- Feature branch workflow — no direct main commits
- Daily security scanning on every push
- All scan reports archived as artifacts