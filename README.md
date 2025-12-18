# OWASP Juice Shop DevSecOps CI/CD Project

## Overview

This project demonstrates an **end-to-end DevSecOps pipeline** for the OWASP Juice Shop application. The pipeline automates **dependency scanning, container security, IaC scanning, dynamic application testing (DAST), and secret detection** using GitHub Actions, ensuring that security is enforced across the software development lifecycle.

The pipeline implements **security gates** so that high/critical vulnerabilities block merging to the main branch, enforcing secure coding and deployment practices.

---

## Project Components

### 1. Dependency Vulnerability Scanning

* Tools: **npm audit**, **Snyk**
* Automatically scans Node.js dependencies for vulnerabilities.
* Generates human-readable reports in pull requests with collapsible sections per severity.
* Sends notifications to **Slack** for high/critical vulnerabilities.

### 2. Container Security Scanning

* Tool: **Trivy**
* Scans the Juice Shop Docker image for OS and application-level vulnerabilities.
* Generates JSON and HTML reports uploaded as artifacts in CI.
* Fails builds on high/critical vulnerabilities to enforce secure container deployment.

### 3. Dynamic Application Security Testing (DAST)

* Tool: **OWASP ZAP**
* Performs runtime security scans on the running Juice Shop container.
* Generates HTML and JSON reports to highlight vulnerabilities like XSS, SQLi, and authentication issues.
* Workflow allows non-zero exit code to continue execution while reporting vulnerabilities.

### 4. Infrastructure as Code (IaC) Security

* Tool: **Checkov**
* Scans Terraform files for misconfigurations and security risks.
* Reports are uploaded as artifacts in the CI workflow.
* Pipeline can fail after uploading reports, enforcing IaC security checks.

### 5. Secret Detection

* Tool: **Gitleaks**
* Scans commits and the repository for exposed secrets.
* Local pre-commit hooks prevent committing secrets from developer machines.
* CI/CD scans detect historical or newly introduced secrets.
* Reports are uploaded as artifacts for auditing.

---

## CI/CD Pipeline Workflow

The GitHub Actions workflow includes the following steps:

1. Checkout repository with full Git history.
2. Set up Node.js environment and dependencies.
3. Run npm audit and Snyk scans.
4. Run Trivy container scan.
5. Run OWASP ZAP dynamic scan.
6. Run Checkov IaC scan.
7. Run Gitleaks secret scan (pre-commit and CI).
8. Generate pull request vulnerability reports.
9. Send Slack notifications on failure.
10. Fail build for high/critical findings to enforce security gates.

---

## Branch Protection & Security Gates

* **Required Status Checks:** Enforces that all security scans pass before merging to the main branch.
* **Branch Protection:** Prevents bypassing of security checks.
* **Slack Notifications:** Real-time alerting for high/critical vulnerabilities.
* **Pull Request Comments:** Provides a clear summary of vulnerabilities per tool for developer awareness.

---

## Getting Started

### Prerequisites

* Node.js >= 22
* Docker
* GitHub account with repository forked
* Slack workspace (optional for notifications)

### Repository Setup

```bash
# Fork the Juice Shop repository
git clone https://github.com/<your-username>/<your-repo>.git
cd <your-repo>

# Move Juice Shop into a subdirectory
mkdir juice_shop
mv * juice_shop/ 2>/dev/null || true

# Ensure structure
# 📁 your-repo/
# ├── 📁 .github/workflows/
# │   └── dependency-scan.yml
# └── 📁 juice_shop/
#     ├── package.json
#     ├── package-lock.json
```

### Configure Secrets

* **SNYK_TOKEN:** For authenticating Snyk scans.
* **SLACK_WEBHOOK_URL:** For sending notifications.
* **GITHUB_TOKEN:** Automatically provided by GitHub Actions.

---

## Reports

* PR Comments: Formatted, collapsible summary of vulnerabilities per tool.
* Artifacts: JSON/HTML reports from Trivy, ZAP, Checkov, and Gitleaks uploaded per workflow run.
* Slack Alerts: High/critical vulnerabilities immediately notified.

---

## Optional Enhancements

* Integrate **OWASP Dependency-Check** for additional dependency scanning.
* Generate **HTML dashboards** for easier visualization of scan results.
* Schedule **nightly security scans** using cron jobs in GitHub Actions.
* Integrate **GitHub Advanced Security (CodeQL)** for code-level static analysis.

---

## Outcome & Benefits

* Automated detection and reporting of security vulnerabilities at multiple layers.
* Ensures secure coding and deployment practices by enforcing **security gates**.
* Enhances developer awareness of security risks.
* Supports compliance and audit requirements with structured reporting.
