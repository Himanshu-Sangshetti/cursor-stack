# Contributing to cursor-stack

Thanks for wanting to make cursor-stack better. Whether you're fixing a typo in a skill prompt or adding a new workflow, this guide will help.

## Quick start

cursor-stack skills are Markdown files that Cursor discovers from `~/.cursor/skills/` (user) or `.cursor/skills/` / `.agents/skills/` (project). Each skill lives in a folder with a `SKILL.md` file.

## How to test skills

1. **Run the setup script** to copy skills to your Cursor skills directory:
   - **Windows (PowerShell):** `.\setup.ps1`
   - **macOS / Linux:** `./setup`
2. **Restart Cursor** or open a new chat.
3. **Invoke the skill** — e.g., type `/plan-ceo` or "Use plan-ceo to review this feature idea".

Changes to skills in the repo take effect after you re-run setup (skills are copied, not symlinked).

## How to add a new skill

1. **Create the skill folder** — e.g., `skill-name/`
2. **Add `SKILL.md`** with YAML frontmatter and instructions:

```markdown
---
name: skill-name
description: What this skill does. Use when [trigger scenarios].
---

# Skill Name

## Instructions
...
```

3. **Add to setup scripts** — update `setup.ps1` and `setup` to include the new skill in the list.
4. **Re-run setup** and test in a new Cursor chat.

## Skill format (best practices)

- **name**: Lowercase, hyphens only. Must match the folder name.
- **description**: Include WHAT and WHEN. Use trigger terms so Cursor can suggest the skill.
- **Structure**: Mindset, Process, Output Format. Use checklists for multi-step workflows.
- **Progressive disclosure**: Put essentials in SKILL.md; move details to `references/` or `assets/`.

See [Cursor's skill docs](https://cursor.com/docs/skills) and the existing skills (plan-ceo, researcher, workflow) for examples.

## Project structure

```
cursor-stack/
├── plan-ceo/          # Founder mode
├── plan-eng/          # Tech lead mode
├── researcher/       # Pre-planning research
├── code-review/      # Paranoid review
├── ship/             # Release engineer
├── qa/               # QA lead
├── retro/            # Engineering retro
├── workflow/         # Orchestrator
│   └── assets/       # Workflow templates
├── templates/        # Config and persona templates
├── docs/             # Documentation
├── setup             # macOS/Linux install
└── setup.ps1         # Windows install
```

## Questions?

Open an issue on GitHub. We're happy to help.
