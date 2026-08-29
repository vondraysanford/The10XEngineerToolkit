---
name: write-ticket
description: Convert rough notes, requests, bug reports, or meeting fragments into a ticket that a person with no context can start. Use this skill when the user drafts or improves a task, story, or bug ticket.
---

The test of a ticket is a stranger: a competent engineer with no context must be able to start it without a conversation. Structure the ticket with the kit's [Ticket template](../../templates/Ticket-Template.md).

## Start from the problem

Most raw input arrives solution-shaped ("add a retry button"). Recover the problem behind it ("users lose work when the save fails") and lead with that. The proposed solution goes into the technical notes as one option. A problem-shaped ticket survives a change of approach. A solution-shaped ticket dies with its solution.

## Acceptance criteria

- Write each criterion in Given/When/Then form, the format from behavior-driven development, so that each one is independently checkable.
- Ban unmeasurable words. "Fast", "correctly", and "gracefully" are wishes. "p95 under 500 ms at today's volume" is a criterion.
- Hunt the boundaries the input skipped: the empty state, the maximum, the failure of a dependency, the same action twice, the role that must be denied. Each boundary becomes a criterion or an explicit open question. A boundary that stays silent becomes a production defect later.

## Open questions, not silent guesses

Collect every genuine ambiguity into an "Open questions" list, each phrased as a one-line either/or that a stakeholder can answer in seconds. Never resolve an ambiguity about business rules, money, permissions, or data retention by guessing, no matter how plausible the guess.

## Scope edges

- Write the "Out of scope" section every time. Naming the adjacent work you are not doing is the cheapest defense against scope creep.
- If the criteria count passes about five, or the work crosses systems, propose a split into vertical slices, each demonstrable end to end. Put the slice that proves the riskiest assumption first. This matches the INVEST checklist for good stories: independent, negotiable, valuable, estimable, small, testable.

## Bug tickets

A bug ticket additionally needs: exact reproduction steps, expected versus actual result, environment and version, frequency, and user impact. When reproduction is unknown, the first acceptance criterion is "reproduction identified", not a speculative fix.

## After the ticket

For teams that track the full delivery of a task (decision record, tests, monitoring, impact), hand the finished ticket to the [task-lifecycle workflow](../../workflows/task-lifecycle/).
