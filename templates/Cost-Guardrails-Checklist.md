# Cloud Cost Guardrails Checklist

> For personal, demo, and portfolio projects on a cloud account with your own credit card. Complete the "Before first deploy" section before any resource exists. A surprise bill is almost always a default SKU, an always-on resource, or an unbounded loop that this checklist would have caught.

## Before the first deploy

- [ ] Create a budget with alerts at 50% / 80% / 100%, on the subscription or resource group
- [ ] Set the monthly ceiling as a number, in writing, in the project README
- [ ] Check the SKU of every resource that a portal wizard creates. Wizards default to paid tiers (for example, an AI search service can default to a ~$245/month tier when a free or basic tier exists)
- [ ] Choose scale-to-zero as the default posture for compute (container apps at 0–1 replicas, serverless tiers)
- [ ] Prefer OIDC/federated credentials over stored keys. A credential that does not exist cannot leak and cannot be abused into a bill

## In the code

- [ ] Cap tokens per AI call, and set the cap with headroom for reasoning tokens, which count against the output budget
- [ ] Enforce a per-user or per-IP rate limit on every endpoint that costs money
- [ ] Enforce a global daily spend cap in code. Compute the worst case: max calls × max tokens × price
- [ ] Make expensive operations opt-in, never on a timer by default

## Every work session

- [ ] Tear down resources billed by the hour in the same session that created them. Demonstrate, capture the evidence, then delete
- [ ] Before you close the laptop, check that the running state matches the intent: what is deployed, and what does it cost at idle

## Monthly

- [ ] Read the cost breakdown by resource, not only the total
- [ ] State the idle cost as a number in the project README. "Idle cost: $<X>/month" is part of the project's honesty contract
- [ ] Delete resources from experiments that ended. If it has no owner and no purpose, it is a leak
