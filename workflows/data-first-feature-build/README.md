# Data-First Feature Build

The repeatable order for a feature that an AI agent builds: **Data layer → Backend layer → Frontend layer**. The schema is the contract. An agent that reads the real schema does not invent columns, guess types, or drift from the database. Each layer grounds the next one.

## Before you start

- [ ] Make sure that the agent context file exists ([Agents-md-Template](../../templates/Agents-md-Template.md)). It must name the database, the ORM, and the layer rules.
- [ ] For a tracked ticket, run this workflow inside the [task-lifecycle](../task-lifecycle/) folder for that item.

## 1. Data layer

1. **Design the schema first.** Write the tables, columns, types, keys, and constraints before any application code. Apply your team's SQL standards.
2. **Put the schema in the repo, in code.** Use migration scripts, ORM entity classes, or a schema dump. If the tables already exist, scaffold them into code (`dotnet ef dbcontext scaffold`, `prisma db pull`, or the equivalent). The agent must read real column names and real types, not your description of them.
3. **Ship each migration with a paired rollback script.** Make the migration idempotent.
4. **Add a seed script** with a small set of realistic rows. Every later layer runs against this data.
5. **Verify:** the migration runs clean on an empty database, the rollback undoes it, and the seed loads.

## 2. Backend layer

1. **Point the agent at the schema code.** Then describe the CRUD operations that the feature needs against that data. Name the entities and the columns. Do not make the agent infer them.
2. **State the non-CRUD rules in the same prompt:** validation, authorization, pagination, and soft-delete behavior. These rules are where agents guess wrong most often.
3. **Place the code by your team's layer rules.** Keep DTOs at the edges. Do not return ORM entities from the API.
4. **Verify:** call each endpoint against the seed data. Record the calls in `Testing/` ([Test-Cases-Template](../../templates/Test-Cases-Template.md)). Do not start the frontend until the API answers correctly.

## 3. Frontend layer

1. **Give the agent the real API contract:** the DTO shapes, the routes, and the error responses from step 2. Do not let the agent mock an imagined API.
2. **Build the UI against the running backend** and the seed data, not against fixtures.
3. **Verify end to end:** run the happy path and one failure path through the UI. Capture the evidence.

## Match the model to the step

Model choice and effort mode control quality, token cost, and time. Use the strongest model where the reasoning is hardest. Use the smallest model where the work is mechanical.

| Step | Model | Why |
|---|---|---|
| Planning: the schema, the layer plan, the ADR | The strongest tier | A wrong plan is the most expensive defect. Spend the strongest reasoning here |
| Implementation: migrations, CRUD code, the UI | A mid tier | A clear plan constrains the work. A mid-tier model executes it well at a lower cost |
| Documentation: the README, comments, monitoring notes | A small tier | The facts already exist. A small fast model formats them quickly |

Set the effort mode with the same rule. Use high effort for the planning step. Use a lower effort for implementation and documentation. A wrong effort mode makes a step slow. At worst, the agent repeats one approval request in an endless loop. When that happens, stop the agent and correct the effort ([landmines](../../resources/landmines.md)).

> **Customize this:** map the tiers to the model names of your provider of today. The pattern is the contract: the strongest model for the plan, a mid-tier model for the code, a small model for the prose.

## The principle

An AI agent fills every gap in its context with a plausible invention. The largest gap is the shape of the data. When the schema is in the repo as code, the agent builds the API from facts. When the API exists, the agent builds the UI from facts. Reverse the order and the frontend invents the contract, the backend copies the invention, and the database must bend to fit it. Ground each layer in the layer below it.
