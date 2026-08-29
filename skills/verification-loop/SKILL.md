---
name: verification-loop
description: Verify agent output with evidence before calling work done. Use this skill whenever an agent reports completion, before a commit or PR, or when the user asks "did this actually work?"
---

"Done" is a claim. Evidence is a fact. An AI agent under pressure to finish will report success from the shape of the code, not from its behavior. Close the gap with a verification pass that runs on every task, not only the ones that feel risky.

## The evidence standard

For each acceptance check, require the artifact that proves it:

| Claim | Required evidence |
|---|---|
| "It builds" | The build command's output, exit code zero |
| "Tests pass" | The test run output, with the count of passed and failed |
| "The endpoint works" | The actual request and the actual response body |
| "The migration is safe" | The migration run on a clean database, and the rollback run after it |
| "It is faster" | The measured number, before and after, same conditions |

Report what occurred, not what should occur. If the evidence cannot be produced (no test harness, no environment), say exactly that. An honest "unverified" is useful. A confident guess is a defect with a delay.

## The self-review pass

Before presenting work, read the full diff once as a reviewer, not as the author:

- Does every changed line serve the task? Flag drive-by edits, leftover debug output, and commented-out blocks.
- Did anything change that the plan did not name? Say so explicitly.
- Would the diff pass the team's review standard? If not, fix it now, not after the human finds it.

## The failure rules

- If a check fails, report the failure with its output first. Then propose the fix. Never rerun until green and report only the green run.
- Do not weaken a check to make it pass. A deleted assertion, a widened tolerance, or a skipped test converts a defect into a baseline.
- After two failed fix attempts on the same check, stop and summarize what you know. Repeated blind attempts burn context and hide the pattern a human would see.

## Customize this

- Add your project's specific evidence commands (the build, the test suite, the smoke check).
- Add the checks your team requires before merge (lint, coverage threshold, security scan).
