# Definition of Done Checklist

> Before you close a task, complete this checklist from top to bottom. The checklist is not bureaucracy. You already do all of these steps on your *best* tickets. The checklist makes the steps automatic on each ticket. If a row does not apply to your task, delete it. Do not delete a row because you are tired.

## Build

- [ ] Make sure that each acceptance criterion is met, with evidence
- [ ] If an approach decision is not trivial, record it in an [ADR](ADR-Template.md)
- [ ] Make sure that the code follows the team standards (linters and analyzers are clean, and there are no new warnings)
- [ ] Make sure that the code has no secrets, no debug code, no commented-out blocks, and no TODOs without tickets

## Test

- [ ] Add or update the unit and integration tests. Make sure that the suite passes
- [ ] Run and record the [test cases](Test-Cases-Template.md) (happy path, boundaries, negative cases, failure modes)
- [ ] Test in an environment that is like production, not only on your machine

## Review

- [ ] Use the [template](PR-Template.md) for the PR. Keep the PR small enough to review, or split it
- [ ] Act on the review feedback. Do not only mark it as resolved
- [ ] If a change is relevant to security, do a [threat check](../skills/threat-check/SKILL.md)

## Ship

- [ ] Put the deployment steps in scripts. Do not do them manually (Scripts/)
- [ ] Make sure that a rollback script or plan exists, and check it (Rollback/)
- [ ] Run each DB change with a paired rollback. Apply each config change to each environment
- [ ] Tell the stakeholders before the change ships, as the risk and rollout section of the [PR](PR-Template.md) states

## Verify and close

- [ ] Do a smoke check in production after the deployment
- [ ] Fill the [monitoring note](Monitoring-Note-Template.md). Schedule the watch window
- [ ] If the behavior or the operations changed, update the docs and the runbook
- [ ] Draft the [impact summary](Impact-Summary-Template.md) with numbers, not opinions
- [ ] If this was a production defect, write the [post-mortem](Post-Mortem-Template.md) and create tickets for the action items
