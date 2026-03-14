# Custom Personas

In Cursor, personas are skills. Each skill defines a "brain": mindset, process, output format. Creating a new persona means creating a new skill.

## Where to put them

- **Project personas:** `.cursor/skills/persona-name/` (shared with teammates)
- **Personal personas:** `~/.cursor/skills/persona-name/` (just for you)

## Create a new persona

1. **Create the skill folder** (e.g., `security-reviewer`, `docs-writer`)

2. **Add SKILL.md** using the template from `templates/persona-template/SKILL.md`:

```markdown
---
name: security-reviewer
description: Security-focused code review. Use when changes touch auth, data, or external APIs.
---

# Security Reviewer

## Mindset
- Assume attackers exist
- Check trust boundaries
- Look for injection vectors

## Process
1. [Your steps]
2. ...

## Output Format
[What this persona produces]

## Handoff
[What feeds into other skills]
```

3. **Add to setup scripts** if you are contributing this persona to the cursor-stack repo: update `setup.ps1` and `setup` to include the new skill.

4. **Use it:** Run `/security-reviewer` or add it to a [custom workflow](custom-workflows.md).

## Skill format best practices

- **name:** Lowercase, hyphens only. Must match the folder name.
- **description:** Include WHAT and WHEN. Use trigger terms so Cursor can suggest the skill. If the description contains colons or square brackets, wrap it in quotes: `description: "Your text here"`.
- **Structure:** Mindset, Process, Output Format. Use checklists for multi-step workflows.
- **Progressive disclosure:** Put essentials in SKILL.md; move details to `references/` or `assets/`.

See [Cursor's skill docs](https://cursor.com/docs/skills) and existing skills (plan-ceo, researcher, workflow) for examples.
