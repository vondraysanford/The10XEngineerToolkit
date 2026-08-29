---
name: threat-check
description: Check a change, feature, or code area for exploitable weaknesses, organized by the OWASP risk categories. Produces findings with concrete attack scenarios and severity. Use for "is this safe?" questions and pre-release security passes on your own systems.
---

Check the user's own system for weaknesses an attacker could use. Every finding must carry the scenario that makes it real. A weakness with no plausible attacker, path, and payoff is a code-quality note, not a security finding. This is a defensive review of systems the user is authorized to assess.

## Scope before depth

Establish three facts first, because they set the depth of the check:

1. **Exposure:** internet-facing, internal, or admin-only.
2. **Data class:** credentials, money, personal data, or none of these.
3. **Change surface:** the specific endpoints, handlers, and queries this change adds or touches.

An internet-facing endpoint that moves money gets the full sweep. An internal report does not. Say which depth you chose and why.

## The sweep, by OWASP category

Work through the categories of the [OWASP Top 10](https://owasp.org/www-project-top-ten/), applied to the change surface:

- **Broken access control.** For each entry point: who can call it, and does the entry point itself enforce that? Check object-level access too: can caller A supply caller B's identifier and win? UI-side enforcement counts for nothing here.
- **Injection.** Any place a query, command, or path is built from strings that include input. Confirm parameterization, not sanitization promises.
- **Cryptographic and secret failures.** Credentials or keys in code, config, logs, URLs, or client-visible payloads. In a new repo, check the git history too.
- **Insecure design of the data surface.** Responses that serialize whole entities, personal data in logs and error messages, verbose errors that describe internals.
- **Unsafe input handling.** Mass assignment, deserialization of untrusted data, file uploads (type, size, destination path), server-side requests to user-supplied URLs, and output echoed into HTML.
- **Abuse tolerance.** Missing rate limits on authentication and on expensive operations, unbounded result sets, and races on money or state transitions.
- **Vulnerable components.** Run the dependency scanner if one is available. Check runtimes against [endoflife.date](https://endoflife.date/). Check the standard security headers.

The [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/) is the reference when a category needs a deeper checklist than this file carries.

## Reporting

Each finding: **severity (Critical/High/Medium/Low)**, location, one-line claim, then the **attack scenario** (actor, steps, result) and a one-line **fix direction**. No scenario, no finding: downgrade it or drop it. Order by severity. Recommend a regression test with every fix, one that fails while the hole is open. If nothing significant turns up, say so plainly rather than inflating nits.
