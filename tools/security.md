# Security Tools

This is defense-in-depth for a normal engineering team. Find secrets, vulnerable dependencies, and code-level flaws automatically. Know how to verify a fix.

## Code & dependency scanning

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [Semgrep](https://semgrep.dev/) | Free/Paid | Fast static analysis with readable, searchable rules | Write a custom rule for a common error on *your* team in 10 minutes. Then run the rule in CI permanently |
| [CodeQL](https://codeql.github.com/) | Free for OSS | Semantic code analysis (powers GitHub code scanning) | It finds taint-flow bugs (user input → SQL) that pattern matching cannot find |
| [Dependabot](https://docs.github.com/en/code-security/dependabot) / [Renovate](https://docs.renovatebot.com/) | Free | Automated dependency update PRs with vulnerability alerts | Small weekly update PRs are better than one large yearly upgrade |
| [Snyk](https://snyk.io/) | Freemium | Dependency, container, and IaC vulnerability scanning | Developer-friendly triage. It shows whether your code can reach a given CVE |

## Secrets

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [gitleaks](https://github.com/gitleaks/gitleaks) | Free | Scans repos and git history for committed secrets | Run it as a pre-commit hook. It is low-cost protection against a leaked secret |
| [TruffleHog](https://github.com/trufflesecurity/trufflehog) | Free/Paid | Secret scanning that *verifies* that credentials are live | It shows automatically whether a leaked key is active. It reduces 100 findings to the 3 findings that matter |

## Dynamic testing & reference

| Tool | Cost | What it does | Why it is useful |
|---|---|---|---|
| [OWASP ZAP](https://www.zaproxy.org/) | Free | A web app scanner and intercepting proxy | Run a baseline scan of your own app in CI. Test only systems that you have permission to test |
| [Burp Suite Community](https://portswigger.net/burp) | Freemium | An intercepting proxy for manual web security testing | The standard tool to see what your app sends. Use it with PortSwigger's free [Web Security Academy](https://portswigger.net/web-security) |
| [Security Headers](https://securityheaders.com/) / [SSL Labs](https://www.ssllabs.com/ssltest/) | Free (web) | Grades your HTTP headers and TLS configuration | A two-minute check that finds common misconfigurations |
| [OWASP Top 10](https://owasp.org/www-project-top-ten/) + [ASVS](https://owasp.org/www-project-application-security-verification-standard/) | Free | The canonical risk list and verification standard | ASVS turns a security pass into a real checklist. See [skills/threat-check](../skills/threat-check/SKILL.md) |

## Practices

- Run secrets scanning in pre-commit **and** in CI. A history rewrite costs much more than prevention.
- Make sure that every security fix has a test that fails without the fix. This prevents regressions.
- A security pass is a workflow, not a single event: [skills/threat-check](../skills/threat-check/SKILL.md).
