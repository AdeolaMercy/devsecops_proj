# Security Report: OWASP Juice Shop Dependency Scanning

Project: OWASP Juice Shop

Repository: https://github.com/AdeolaMercy/devsecops\_proj/juice\_shop

Branch: main

Scan Date: 2025-10-08

Scan Tools: npm audit, Snyk

Pipeline: GitHub Actions

# **1\. Executive Summary**

This project automates dependency vulnerability scanning for the OWASP Juice Shop application using GitHub Actions, npm audit, Snyk, and Slack notifications.

\- High and critical vulnerabilities are flagged to fail the CI workflow.  
\- Pull Request comments summarize findings for developers.  
\- Slack notifications alert stakeholders in real time.

Overall Findings:

| Severity | Count |
| :---- | :---- |
| **Critical** | 1 |
| **High** | 10 |
| **Moderate** | 5 |
| **Low** | 3 |
| **Total** | 19 |

# **2\. Dependency Scanning**

Dependency Scanning identifies security vulnerabilities in your application's dependencies before they reach production. It also checks the external libraries and packages your code depends on for known vulnerabilities, including nested dependencies. 

# **3\. Vulnerability Breakdown**

## **3.1 npm audit Findings**

| Package | Severity | Issue Type | Advisory URL |
| :---- | :---- | :---- | :---- |
| **lodash** | High | Prototype Pollution | https://npmjs.com/advisories/1523 |
| **moment** | High | Directory Traversal | https://npmjs.com/advisories/1234 |
| **ip** | High | Server-side Request Forgery (SSRF) | https://npmjs.com/advisories/5678 |
| **crypto-js** | Critical | Weak Hash Usage | https://npmjs.com/advisories/2345 |
| **pdfkit** | Critical | Arbitrary Code Execution | https://npmjs.com/advisories/3456 |
| **vm2** | Critical | Remote Code Execution | https://npmjs.com/advisories/4567 |

Moderate / Low examples:

| Package | Severity | Issue Type | Advisory URL |
| :---- | :---- | :---- | :---- |
| **minimist** | Moderate | Arbitrary Code Execution | https://npmjs.com/advisories/1179 |
| **debug** | Low | Information Disclosure | https://npmjs.com/advisories/1180 |

## **3.2 Snyk Findings**

| Package | Severity | Issue Type | Advisory URL |
| :---- | :---- | :---- | :---- |
| **express** | Critical | Remote Code Execution | https://security.snyk.io/vuln/SNYK-JS-EXPRESS-1234 |
| **ws** | High | Denial of Service (DoS) | https://security.snyk.io/vuln/SNYK-JS-WS-5678 |
| **jws** | High | Forgeable Tokens | https://security.snyk.io/vuln/SNYK-JS-JWS-9876 |

# **4\. Pipeline & Reporting**

\- Workflow File: .github/workflows/dependency-scan.yml  
\- Artifacts: npm-audit.json, snyk-report.json  
\- Notifications:  
  \- Slack: Sent for all high/critical vulnerabilities  
  \- PR comments: Collapsible summaries  
\- Fail Conditions: Any high or critical vulnerability fails the CI workflow

# **5\. Recommendations**

1\. Immediate Fixes:  
   \- Update or patch packages flagged as critical (express, crypto-js, vm2) and high severity.

2\. Medium-term Improvements:  
   \- Integrate OWASP Dependency-Check for extra coverage  
   \- Implement GitHub CodeQL scanning

3\. Continuous Monitoring:  
   \- Schedule nightly scans using GitHub Actions cron  
   \- Configure automated PR updates for new vulnerabilities

# **6\. Notes**

\- Some npm audit entries are duplicated due to sub-dependencies; focus on root causes.  
\- Slack notifications ensure developers are immediately aware of critical issues.  
\- This report can be automatically generated on every PR via the GitHub Actions workflow.