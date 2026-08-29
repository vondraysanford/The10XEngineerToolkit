# <Short title: what changed and where, for example "Add retry policy to payment gateway client">

## What and why

<2–4 sentences: the problem, the change, and the reason for this approach. Link the ticket.>

Closes #<ticket>

## Changes

- <List the important changes. Group them by area, not by file>
- <State each change that can surprise a reviewer, and the reason that it is intentional>

## How to test

1. <The exact steps that a reviewer can follow to verify the change: commands, URLs, and the source of credentials>
2. <The expected result>

## Risk and rollout

- **Risk level:** <Low / Medium / High>, <one line that gives the reason>
- **Rollback:** <how to undo the change: revert the PR, turn the feature flag off, or link the rollback script>
- **DB changes:** <None / a link to the migration and the rollback script>
- **Config/secrets changes:** <None / what must exist in each environment>

## Screenshots and evidence

<Before and after screenshots, query plans, benchmark output, or other evidence that shows that the change works>

## Checklist

- [ ] Add or update the tests. Make sure that they pass
- [ ] Make sure that the diff has no secrets, no connection strings, and no debug code
- [ ] If the behavior changed, update the docs and the runbook
- [ ] Make sure that monitoring covers the new path (see the [Monitoring Note](Monitoring-Note-Template.md))
