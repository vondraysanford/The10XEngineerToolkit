# Skills

This folder contains reusable AI instructions in the Claude Code skill format. Each skill has one folder and one `SKILL.md` file. The `SKILL.md` file has frontmatter (`name`, `description`) and an instruction body. The content is plain Markdown. Any capable assistant can use it.

**Install with the plugin (recommended):**

```
/plugin marketplace add vondraysanford/The10XEngineerToolkit
/plugin install 10x-toolkit@10x-engineer-toolkit
```

**Or copy into one project:**

```bash
cp -r skills/* your-project/.claude/skills/
```

Then start a skill with `/10x-toolkit:skill-name` (plugin) or `/skill-name` (copy), or let the assistant select a skill by its description.

## The catalog

### Work with an AI agent
| Skill | Does |
|---|---|
| [plan-first](plan-first/SKILL.md) | A written plan with files and acceptance checks before any edit |
| [verification-loop](verification-loop/SKILL.md) | Evidence, not claims, before any "done": build output, test runs, measured numbers |
| [context-hygiene](context-hygiene/SKILL.md) | Small, current sessions: what to load, when to reset, how to spot context rot |
| [agents-md](agents-md/SKILL.md) | A project context file (AGENTS.md / CLAUDE.md) that agents actually obey |

### Write work artifacts
| Skill | Produces |
|---|---|
| [pull-request-creator](pull-request-creator/SKILL.md) | Pull requests from the actual diff and log: title, description, and the command that opens it |
| [write-ticket](write-ticket/SKILL.md) | Tickets that a stranger can start, with testable criteria and explicit scope edges |
| [avoid-ai-writing](avoid-ai-writing/SKILL.md) | Human-sounding prose: posts, docs, commits, and PR text without AI patterns |

### Understand systems
| Skill | Does |
|---|---|
| [system-mapping](system-mapping/SKILL.md) | A day-one orientation map, or a durable knowledge base in the repo |

### Reviews and quality gates
| Skill | Does |
|---|---|
| [spec-scrub](spec-scrub/SKILL.md) | A pre-implementation scrub of a spec: testability, blind spots, contradictions |
| [threat-check](threat-check/SKILL.md) | A security pass organized by the OWASP categories, with attack scenarios |
| [dependency-verification](dependency-verification/SKILL.md) | Verification of every package before install: exact ID, pinned version, official source |

### Testing and evolution
| Skill | Does |
|---|---|
| [flaky-test-diagnosis](flaky-test-diagnosis/SKILL.md) | Root-cause diagnosis of intermittent and CI-only test failures |
| [incremental-migration](incremental-migration/SKILL.md) | Legacy upgrades in shippable increments, without a big-bang rewrite |

## Model and mode

A skill runs on the model of the current session. It does not select a model itself. Select the model when you start the session ([tools/ai.md](../tools/ai.md) has the tier rule). A mid-tier model is the working default. The exceptions:

- Use the strongest model for [spec-scrub](spec-scrub/SKILL.md), [threat-check](threat-check/SKILL.md), and [incremental-migration](incremental-migration/SKILL.md). These skills make decisions, and a wrong decision is the most expensive defect.
- A small model is enough for [pull-request-creator](pull-request-creator/SKILL.md), [write-ticket](write-ticket/SKILL.md), and [avoid-ai-writing](avoid-ai-writing/SKILL.md). The facts already exist. The skill formats them.
- Start [spec-scrub](spec-scrub/SKILL.md) and [system-mapping](system-mapping/SKILL.md) in plan mode. Plan mode makes the assistant explore and report before it changes files.
- Set the effort mode with the same rule as the model. Use high effort for the decision skills above. Low effort is enough for the formatting skills. A wrong effort mode slows the run, and it can trap the agent in an endless approval loop ([landmines](../resources/landmines.md)).

## Write your own skill

See [CONTRIBUTING.md](../CONTRIBUTING.md). Use this test for a good skill: the AI output must *change* because the skill exists. Encode judgment: what a good result is, what to refuse, and the common traps. Do not encode only steps. Mark team-specific details in a "Customize this" section.

For UI and design-engineering skills from the community (accessibility, motion, interface quality), see [UI Skills](https://www.ui-skills.com/).
