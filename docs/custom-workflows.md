# Custom Workflows

cursor-stack includes built-in workflows (feature, bugfix, hotfix). You can add your own.

## How it works

The `/workflow` skill discovers workflows in two ways:

1. **Built-in:** feature, bugfix, hotfix (always available)
2. **Project-level:** Any skill folder matching `*-workflow` in `.cursor/skills/` or `.agents/skills/`

When you add a custom workflow skill, `/workflow` will present it as an option.

## Create a custom workflow

1. **Create the skill folder** in your project: `.cursor/skills/my-workflow/SKILL.md` (or `launch-workflow`, `release-workflow`, etc.)

2. **Add SKILL.md** with YAML frontmatter and the step sequence:

```markdown
---
name: launch-workflow
description: Full launch flow: research, plan-ceo, plan-eng, implement, review, ship, qa
---

# Launch Workflow

Run these skills in order. After each, confirm completion before proceeding.

1. /researcher - gather domain knowledge
2. /plan-ceo - product direction
3. /plan-eng - technical spec
4. [Implement the plan]
5. /code-review - paranoid review
6. /ship - land the branch
7. /qa - verify
```

3. **Run it:** Type `/launch-workflow` (or whatever you named it) in Cursor. Your custom workflow skill will guide you step by step.

## Templates

Copy from `workflow/assets/` in the cursor-stack repo:

- `workflow-feature.md` - full feature flow
- `workflow-bugfix.md` - bug fix flow
- `workflow-hotfix.md` - urgent production fix

Use these as starting points. Adjust the steps to match your team's process.

## Adding personas to a workflow

You can insert custom personas into your workflow. For example, add a security reviewer before ship:

```markdown
1. /researcher
2. /plan-ceo
3. /plan-eng
4. [Implement]
5. /code-review
6. /security-reviewer   <- your custom persona
7. /ship
8. /qa
```

See [Custom personas](custom-personas.md) for how to create personas.
