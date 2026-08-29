---
name: system-mapping
description: Map how a codebase works, either as a fast orientation for a newcomer or as durable documentation in the repo. Use this skill when the user is new to a repo, asks "how does X work here?", or wants system knowledge written down.
---

Map a system by tracing it, not by browsing it. Pick a real trigger (a request, a message, a scheduled run) and follow it end to end through the code. A traced path yields facts. A folder scan yields impressions.

This skill has two modes. Ask which one the user needs if it is not clear.

## Mode 1: the orientation map (fast, for a newcomer)

Produce one report that saves a new person their first two weeks of questions:

1. **What and for whom.** One paragraph from the README, the project files, and the top-level layout.
2. **Where execution starts.** The entry points: main functions, route registrations, message handlers, scheduled jobs. These are the roots for all further reading.
3. **How to run it, verified.** The build, test, and run commands, executed where possible. Report what actually happened. A README that disagrees with reality is itself a finding.
4. **The real shape.** One diagram (Mermaid renders on GitHub) of the main path through the layers, drawn from code you traced, not from a wiki.
5. **Where the risk lives.** Mine the history: `git log` shows the most-changed files, and files that are both large and hot are where the pain concentrates. Note TODO/FIXME density.
6. **A reading list.** The 8 to 10 files to read first, ordered by value (entry point, core domain, risk areas), with one line each on why.
7. **Questions only a human can answer.** Ownership, deploy process, and the reasons behind decisions the code cannot explain.

## Mode 2: the knowledge base (durable, in the repo)

For knowledge that must outlive the session, write per-topic files under `docs/knowledge/` (or the user's chosen location), one file per subsystem or flow. Each file covers: what it does in business terms, the traced flow with real symbol references, the handful of types and tables that matter, the invariants and where each one is enforced, the behavior on failure and retry, and what to check before changing the area. Keep an index README with one line per topic, and stamp each file with the date and commit it was verified against. Update the existing file when the system changes. A stale knowledge file misleads with authority.

## Rules for both modes

- Label every statement as observed (you saw it in code or history) or inferred (your best reading). The reader must know which claims to trust and which to check.
- Verify each diagram arrow against a call you actually found.
- Recover design reasons from history (`git log -p`, PR descriptions, ADRs) where you can. Where you cannot, write "reason unknown". A guessed reason is worse than an admitted gap.
