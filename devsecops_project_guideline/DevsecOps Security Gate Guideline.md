# DevsecOps Security Gate Guideline on GitHub

 **Step-by-step guide to enable required status checks**

-  Go to repository settings  
- Open your GitHub repository.  
- **Click on Settings → Branches** (in the left sidebar).  
  * Add a branch protection rule  
  * Under Branch protection rules, click Add rule.  
  * In Branch name pattern, type:  
  * main  
- **Enable required status checks** 
  * Check ✅ Require status checks to pass before merging.  
  * A list of workflows/jobs appears which should correspond to your GitHub Actions runs.  
  * Select the specific job(s) you want to enforce, e.g. dependency-scan, semgrep-scan  
  * (If you’re unsure, you can first run your workflow once which will appear in the list.)  
- **Optional: enforce review policies**  
- You can also enable:  
  * Require pull request reviews before merging  
  * Include administrators (to apply to admins too)  
  * Restrict who can push to main  
  * These make your main branch even more secure.  
- **Save changes**  
- **Click Create / Save changes at the bottom**.

Enforcing these security checks ensure whenever someone opens a PR into main:

* GitHub Actions runs your security workflow (npm audit \+ Snyk).  
* If either scan finds high/critical vulnerabilities (and exits non-zero), the job fails.  
* GitHub marks the check failed, and the PR cannot be merged until fixed.

**Benefits of enforcing security gate in a CI/CD pipeline**

* It turns your pipeline into a guardrail, not a guideline which means security checks can’t be bypassed accidentally.  
* Prevents introducing known vulnerabilities into deployment environments (which is the main branch in this instance)  
* Integrates Security Visibility into Developer Workflow  
* Enhances organizational compliance posture and supports continuous monitoring.  
* Strengthens Collaboration Between Dev, Sec, and Ops which builds a culture of shared responsibility

