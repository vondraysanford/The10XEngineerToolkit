# Agents

This folder contains AI agent definitions in the Claude Code subagent format. Each file has YAML frontmatter (`name`, `description`, `model`, and the optional `tools`) and then the agent's system prompt. The description tells the parent model *when* to delegate work to this agent. The `model` field selects the model tier that the agent runs on. Claude Code enforces it.

**Install for a project:**

```bash
cp agents/*.md your-project/.claude/agents/
```

**Use with other systems:** Paste the body of the file (below the frontmatter) as a system prompt.

| Agent | Model | Role |
|---|---|---|
| [devils-advocate.md](devils-advocate.md) | opus | Challenges a plan, an estimate, or a "done" claim before you commit to it. Read-only. Reports the strongest objections, ranked by cost-if-true |

The kit ships one agent on purpose. A challenger is the role that pays for itself on every team, because it is the role that nobody staffs. Role-playing agents (a reviewer, an implementer, a designer) work best when you write them against your own team's standards. Use [CONTRIBUTING.md](../CONTRIBUTING.md) for the format, and pair each one with the [skills/](../skills/) it should apply.
