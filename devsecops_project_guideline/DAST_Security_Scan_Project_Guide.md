# **DAST (Dynamic Application Security Testing) Project**

## **1\. Objective**

Automate a Dynamic Application Security Test (DAST) against the OWASP Juice Shop application using OWASP ZAP. Detect runtime vulnerabilities and integrate results into the CI/CD pipeline to enhance continuous security testing.

## **2\. Prerequisites**

• Docker installed locally or in your CI environment  
• OWASP Juice Shop container image (either pulled or built locally)  
• A GitHub repository for workflow execution

## **3\. Project Setup**

Fork and clone OWASP Juice Shop:

* git clone [https://github.com/](https://github.com/)\<your-username\>/\<your-repo\>.git  
* cd \<your-repo\>

Create a workflow directory:

* mkdir \-p .github/workflows

## **4\. GitHub Actions Workflow**

You can find an example dependency yaml file here

* [https://github.com/AdeolaMercy/devsecops\_proj/blob/master/.github/workflows/dast-check.yml](https://github.com/AdeolaMercy/devsecops_proj/blob/master/.github/workflows/dast-check.yml) 

## **5\. Workflow Breakdown**

• Checkout code – Fetch repository contents  
• Start Juice Shop – Launch vulnerable app  
• Wait for readiness – Allow startup delay  
• Run ZAP scan – Perform DAST security analysis  
• Upload reports – Save HTML and JSON artifacts  
• Fail on severe alerts – Enforce build security gates

## **6\. Local Execution (Optional)**

To run OWASP ZAP locally on a windows machine:

docker run \-d \--name juice \-p 3000:3000 bkimminich/juice-shop

docker run \--rm \-v $pwd/zap-reports:/zap/wrk  [ghcr.io/zaproxy/zaproxy:stable](http://ghcr.io/zaproxy/zaproxy:stable) zap-baseline.py \-t http://localhost:3000 \-r baseline.html \-J baseline.json || true

## **7\. Expected Outputs**

• HTML and JSON reports appear in zap-reports/  
• Reports are uploaded as GitHub workflow artifacts  
• Build fails automatically on high or critical vulnerabilities

## **8\. Example Alert Categories**

• High – SQL Injection  
• Medium – Cross-Site Scripting (XSS)  
• Low – Information Disclosure  
• Info – Missing Security Headers

## **9\. Security Gate Integration**

Enable required status checks for the main branch in GitHub to prevent merging PRs with failed DAST results.

## **10\. Benefits**

• Automates vulnerability detection during runtime  
• Prevents insecure code from deployment  
• Improves visibility and governance  
• Reinforces secure CI/CD practices

## **11\. Best practices & caveats**

• Don’t run heavy DAST in production. Use staging or ephemeral test environments that mirror prod data (with sanitized data).
• Rate-limiting / blocking: Aggressive scanning may trigger WAF or rate-limits. Use baseline scans in PRs and full scans on     dedicated environments or nightly runs.

• Auth & state: DAST is stateful, ensure login works and session state is handled.
• False positives: DAST has false positives, implement triage and mark exceptions in an issue tracker.
• Scan frequency: Fast scans per PR, full scans nightly or on release branches.
• Permissions: Ensure that CI service account has permission to run Docker (self-hosted runners may be easier if you need --network=host).
• Resource/time: Full scans can take long, schedule them accordingly.
