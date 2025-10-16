# **Infrastructure as Code (IaC) Security Scan with Checkov**

## **1\. Objective**

Automate the detection of security misconfigurations in Infrastructure as Code (IaC) files using Checkov within a GitHub Actions workflow. This pipeline ensures vulnerabilities are detected early, reports are uploaded as artifacts, and the build fails after upload to enforce compliance.

## **2\. Workflow Overview**

This workflow performs static analysis on Terraform, Kubernetes, Docker, and CloudFormation files to identify potential misconfigurations before deployment.

Key features include:

* Automated Checkov scanning for IaC misconfigurations.  
* Uploading scan reports as GitHub Artifacts for auditability.  
* Failing the CI pipeline if security violations are found, ensuring strict enforcement.

## **3\. GitHub Actions Workflow Configuration**

Below is the YAML configuration for the Checkov scan pipeline:

* https://github.com/AdeolaMercy/devsecops\_proj/blob/master/.github/workflows/iac-check.yml

## **4\. How It Works**

Step-by-step breakdown:

1. Checkout repository – Fetches code for analysis.  
2. Install Checkov – Installs the Checkov tool via pip.  
3. Run Checkov scan – Executes the IaC scan and generates a JSON report.  
4. Upload report – Saves the report as a GitHub Actions artifact.  
5. Fail workflow – Ends the pipeline with an error if misconfigurations are found.

## **5\. Expected Outputs**

When the workflow runs:

* A detailed report (iac-scan-report.json) is uploaded under the Actions → Artifacts section.  
* If issues are found, the workflow fails after uploading the report.  
* This enforces a DevSecOps security gate while maintaining visibility.

## **6\. Benefits**

* Continuous IaC security validation in CI/CD pipelines.  
* Early detection of configuration risks in Terraform or Kubernetes code.  
* Security teams gain traceable artifact-based reports for auditing.  
* Prevents insecure infrastructure deployments.

## **7\. Verification Steps**

To test the pipeline:

1\. Commit and push a vulnerable Terraform file (e.g., open security group rule).  
2\. Trigger the GitHub Action manually or via pull request.  
3\. Observe that the Checkov job runs, uploads a report, and fails the build.  
4\. Access the uploaded report in the 'Artifacts' section for detailed findings.

## **8\. Conclusion**

This Checkov-based IaC scan pipeline enforces compliance and security best practices by detecting infrastructure risks early in the development lifecycle. Combining artifact upload and strict failure conditions provides both transparency and enforcement, ensuring that no insecure infrastructure code reaches production.