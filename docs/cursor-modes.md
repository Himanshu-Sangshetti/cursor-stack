# cursor-stack + Cursor Modes

cursor-stack skills work inside any Cursor mode (Ask, Plan, Agent, Debug). Pick a Cursor mode for the task type, then invoke a skill for the cognitive mode.

## Cursor Plan mode (Shift+Tab)

Plan mode creates implementation plans. Two ways to combine with cursor-stack:

1. **plan-ceo first:** Use `/plan-ceo` to challenge the premise and get product direction. Then Plan mode for the how.
2. **Plan mode first:** Use Plan mode for the implementation plan. Then `/plan-ceo` for product direction check.

## Cursor Agent mode

Agent mode writes code. Use cursor-stack around it:

- Run `/code-review` before merging
- Run `/ship` when the branch is ready
- Run `/qa` to verify it works

## Skill discovery

Skills are loaded from:

- `~/.cursor/skills/` (user)
- `.cursor/skills/` or `.agents/skills/` (project)

Setup copies to user dir. Project install uses project dir.

## Slash command note

The code-review skill may appear as `/code-review` or `/review` in Cursor's slash menu depending on your version. Use whichever shows up.
