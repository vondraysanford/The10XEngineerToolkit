# Test Cases: <feature / ticket>

| Field | Value |
|---|---|
| **Ticket** | <link> |
| **Environment** | <where you ran these tests> |
| **Build/version** | <the version that you tested> |
| **Tester** | <name> |
| **Date** | <YYYY-MM-DD> |

> The columns copy cleanly into a spreadsheet or your tracker's test plans. One row is one behavior that you can verify.

| # | Scenario | Preconditions | Steps | Expected result | Actual result | Status | Evidence |
|---|---|---|---|---|---|---|---|
| 1 | <happy path: the main flow> | <the required state and data> | <numbered, exact> | <the observable outcome> | | ⬜ Pass / ⬜ Fail | <a screenshot or log link> |
| 2 | <boundary: empty/zero/max/unicode> | | | | | | |
| 3 | <negative: the system rejects invalid input cleanly> | | | | | | |
| 4 | <failure mode: a dependency is down, or a timeout occurs> | | | | | | |
| 5 | <idempotency/retry: the same action twice> | | | | | | |
| 6 | <permissions: the system blocks an unauthorized user> | | | | | | |
| 7 | <regression: the adjacent feature still works> | | | | | | |

## Coverage checklist

- [ ] Test the happy path
- [ ] Test the boundaries (empty, zero, max, special characters)
- [ ] Test invalid input and negative cases
- [ ] Test the failure modes (dependency errors, timeouts)
- [ ] If relevant, test concurrency, retry, and idempotency
- [ ] Test AuthZ (the roles that must NOT have access)
- [ ] Test for regression on adjacent functionality

## Notes and defects raised

- <Defect links, and observations that did not fit a row>
