# cursor-stack

**cursor-stack turns Cursor's AI agent from one generic assistant into a team of specialists you can summon on demand.**

Eight workflow skills for [Cursor](https://cursor.com). Plan review, code review, one-command shipping, QA testing, and engineering retrospectives. All as slash commands.

Inspired by [gstack](https://github.com/garrytan/gstack) by Garry Tan (YC). Built for Cursor. No binaries, no build step, just copy and go.

## Without cursor-stack

- The agent takes your request literally. It never asks if you're building the right thing.
- "Review my PR" gives inconsistent depth every time.
- "Ship this" turns into a long back-and-forth about what to do.
- You still do QA by hand: open browser, click around, check pages.

## With cursor-stack

| Skill | Mode | What it does |
|-------|------|--------------|
| `/plan-ceo` | Founder / CEO | Rethink the problem. Find the 10-star product. Three modes: EXPANSION, HOLD, REDUCTION. |
| `/plan-eng` | Tech lead | Lock in architecture, data flow, diagrams, edge cases, and tests. |
| `/code-review` | Paranoid staff engineer | Find bugs that pass CI but blow up in production. |
| `/ship` | Release engineer | Sync main, run tests, push, open PR. For a ready branch. |
| `/qa` | QA lead | Diff-aware testing. Uses Cursor's built-in browser automation. |
| `/retro` | Engineering manager | Team-aware retro: deep-dive plus per-person praise and growth. |
| `/researcher` | Research mode | Domain knowledge, tech options, codebase context. Run before plan-ceo and plan-eng. |
| `/workflow` | Orchestrator | Step-by-step flow. Built-in: feature, bugfix, hotfix. Or add custom workflows. |

## Demo

```
You:   I want to add seller photo upload to the listing app.

You:   /researcher  (optional, for unfamiliar domains)
Cursor: [Research Brief: codebase findings, domain knowledge, tech options]

You:   /plan-ceo
Cursor: "Photo upload" is not the feature. The real job is helping sellers
        create listings that sell. 10-star version: auto-identify product
        from photo, pull specs, draft title and description...

You:   /plan-eng
Cursor: [Architecture, state machine, edge cases, test matrix]

You:   [implement the plan]

You:   /code-review
Cursor: Race condition: two tabs can overwrite cover-photo selection.
        Trust boundary: web data into draft creates prompt injection risk...

You:   /ship
Cursor: [Syncs main, runs tests, pushes branch, opens PR]

You:   /qa
Cursor: [Tests affected pages via browser. All routes working.]
```

## Who this is for

You use Cursor heavily and want consistent, high-rigor workflows instead of one generic mode. You want to tell the model what kind of brain to use: founder taste, engineering rigor, paranoid review, or fast execution.

This is not a prompt pack for beginners. It is an operating system for people who ship.

## Install

**Requirements:** [Cursor](https://cursor.com) with Agent/Skills support.

### Option A: Clone to skills directory (recommended)

```bash
git clone https://github.com/Himanshu-Sangshetti/cursor-stack.git ~/.cursor/skills/cursor-stack

# Copy each skill so Cursor discovers them
cp -r ~/.cursor/skills/cursor-stack/plan-ceo ~/.cursor/skills/
cp -r ~/.cursor/skills/cursor-stack/plan-eng ~/.cursor/skills/
cp -r ~/.cursor/skills/cursor-stack/code-review ~/.cursor/skills/
cp -r ~/.cursor/skills/cursor-stack/ship ~/.cursor/skills/
cp -r ~/.cursor/skills/cursor-stack/qa ~/.cursor/skills/
cp -r ~/.cursor/skills/cursor-stack/retro ~/.cursor/skills/
cp -r ~/.cursor/skills/cursor-stack/researcher ~/.cursor/skills/
cp -r ~/.cursor/skills/cursor-stack/workflow ~/.cursor/skills/
```

### Option B: Run setup script

**macOS / Linux:**
```bash
git clone https://github.com/Himanshu-Sangshetti/cursor-stack.git /tmp/cursor-stack
cd /tmp/cursor-stack
./setup
```

**Windows (PowerShell):**
```powershell
git clone https://github.com/Himanshu-Sangshetti/cursor-stack.git $env:TEMP\cursor-stack
cd $env:TEMP\cursor-stack
.\setup.ps1
```

### Option C: Project-level install

Copy skills into your project's `.cursor/skills/` so teammates get them too. See [Customization](docs/customization.md#project-level-install) for project setup.

## How to use

Mention the skill in chat or use the slash command:

- "Use plan-ceo to review this feature idea" or `/plan-ceo`
- "Use plan-eng to create the technical spec" or `/plan-eng`
- `/code-review` or `/review` (Cursor may show either)
- `/ship`, `/qa`, `/retro`, `/researcher`, `/workflow`

## Your workflow

1. Describe the feature idea
2. `/researcher` (optional) for unfamiliar domains
3. `/plan-ceo` to challenge the premise
4. `/plan-eng` for the technical spec
5. Implement the plan
6. `/code-review` to find hidden bugs
7. `/ship` to land the code
8. `/qa` to verify

Or run `/workflow` for step-by-step guidance through feature, bugfix, or hotfix flows.

## Planning pipeline

plan-ceo, plan-eng, and researcher work as a pipeline. Run them in the same chat so plan-eng can use plan-ceo's output. plan-ceo decides what to build (product direction, scope, what to defer). plan-eng designs how to build it (architecture, failure modes, tests). For unfamiliar domains, run `/researcher` first to gather domain knowledge and codebase context. Keep the Research Brief in the chat so plan-ceo and plan-eng can reference it.

[Full details: Planning pipeline](docs/planning-pipeline.md)

## Customization

Override cursor-stack behavior per project or org. Use Cursor Team Rules for org-wide defaults (mainBranch, testCommand, complexityThreshold). For project overrides, add a cursor-stack section to `AGENTS.md` or create `.cursor/rules/cursor-stack.mdc`. Skills read these when you @mention them.

[Full details: Customization](docs/customization.md)

## Custom workflows

The built-in workflows (feature, bugfix, hotfix) cover most cases. You can add your own by creating a skill folder like `.cursor/skills/launch-workflow/SKILL.md` with your step sequence. The `/workflow` skill discovers any `*-workflow` skill in your project and presents it as an option. Copy templates from `workflow/assets/` to get started.

[Full details: Custom workflows](docs/custom-workflows.md)

## Custom personas

In Cursor, personas are skills. Each skill defines mindset, process, and output format. To add a new persona (e.g. security reviewer, docs writer), create a skill folder with `SKILL.md` using the same format as the built-in skills. Put it in `.cursor/skills/` (project) or `~/.cursor/skills/` (personal). Use the template in `templates/persona-template/SKILL.md`.

[Full details: Custom personas](docs/custom-personas.md)

## Cursor modes

cursor-stack skills work inside any Cursor mode (Ask, Plan, Agent, Debug). Pick a Cursor mode for the task, then invoke a skill for the cognitive mode. Plan mode (Shift+Tab) creates implementation plans: use `/plan-ceo` first for product direction, or Plan mode first for the spec then `/plan-ceo` to validate. Agent mode writes code: use `/code-review` before merging and `/ship` when ready. Skills load from `~/.cursor/skills/` (user) or `.cursor/skills/` (project).

[Full details: Cursor modes](docs/cursor-modes.md)

## Credits

Inspired by [gstack](https://github.com/garrytan/gstack) by [Garry Tan](https://x.com/garrytan), President & CEO of Y Combinator. Built for the Cursor community.

## License

MIT
