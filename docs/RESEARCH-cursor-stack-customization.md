# Research Report: cursor-stack Customization Plan

**Note:** This was a one-time Cursor capability audit (checking what Cursor already offers). The general `/researcher` skill gathers domain knowledge and codebase context for any feature—see `researcher/SKILL.md`.

**Date:** 2025-03-15  
**Plan validated:** Implementation Plan for cursor-stack config + workflows

---

## Cursor Capabilities (Relevant)

| Capability | What it does | Source |
|------------|--------------|--------|
| **Project-level skills** | `.cursor/skills/` or `.agents/skills/` in project — skills load from project, user, or global | [cursor.com/docs/skills](https://cursor.com/docs/skills) |
| **Skill assets/** | Skills can include `scripts/`, `references/`, `assets/` — config templates can live here | [cursor.com/docs/skills](https://cursor.com/docs/skills) |
| **Team Rules** | Org-wide rules from Cursor dashboard; Team/Enterprise plans; precedence over project rules | [cursor.com/docs/rules](https://cursor.com/docs/rules) |
| **Project Rules** | `.cursor/rules/` — version-controlled, glob patterns, Apply Manually for @mention | [cursor.com/help/customization/rules](https://cursor.com/help/customization/rules) |
| **AGENTS.md** | Project root — simple markdown instructions, no metadata | [cursor.com/docs/rules](https://cursor.com/docs/rules) |
| **Plan Mode** | Built-in: researches codebase, asks questions, creates `.plan.md` | [cursor.com/docs/agent/modes](https://cursor.com/docs/agent/modes) |
| **Rules import** | Import rules from GitHub — stays synced with remote | [cursor.com/docs/rules](https://cursor.com/docs/rules) |

---

## Gap Analysis

| Plan Element | Cursor Has? | Recommendation |
|--------------|-------------|----------------|
| **Config file (`.cursor-stack/config.json`)** | Partial | **Use Project Rules** instead. `.cursor/rules/cursor-stack.mdc` with Apply Manually. Or AGENTS.md section. No new config format needed. |
| **Org-level defaults** | **Yes** | **Use Team Rules** from dashboard. Cursor already has org-wide rules. Document this; don't build. |
| **Project overrides** | **Yes** | **Use Project Rules** with globs or Apply Manually. `.cursor/rules/cursor-stack-overrides.mdc`. |
| **Workflow definitions** | Partial | **Use project-level skills**. User adds `.cursor/skills/feature-workflow/SKILL.md` that defines their sequence. Or put workflow JSON in skill `assets/`. |
| **Workflow orchestrator** | No | **Build** — Cursor has no built-in step-by-step workflow runner. Our `workflow` skill fills this gap. |
| **Config schema** | No | **Simplify** — If we use Rules, no JSON schema. If we keep config.json, schema is useful for validation. |
| **Plan Mode integration** | **Yes** | **Document** — Plan Mode does implementation planning. plan-ceo does product direction. Add note: "For complex features, Plan Mode (Shift+Tab) for implementation plan, then plan-ceo for product direction." |

---

## Key Findings

### 1. Use Cursor's Team Rules for org-level config

**Don't build:** A custom org config server or shared config repo.

**Use instead:** Cursor Team Rules (dashboard). Admins create rules that apply to all team members. Precedence: Team > Project > User. This is exactly org-level defaults.

**Action:** Document in README: "For org-wide cursor-stack defaults, use Cursor Team Rules. Add a rule with your preferred thresholds, branch name, etc."

### 2. Use Project Rules for project overrides

**Don't build:** A new `.cursor-stack/config.json` format that skills must parse.

**Use instead:** `.cursor/rules/cursor-stack.mdc` with Apply Manually. User @mentions it when running plan-ceo/plan-eng. Content: "mainBranch: main, testCommand: npm test, complexityThreshold: 12..."

**Alternative:** Add a "cursor-stack" section to AGENTS.md. Simpler, always in context when working in project.

**Action:** Provide a template rule file. Skills already say "read project context" — we add "if @cursor-stack or AGENTS.md has cursor-stack section, apply overrides."

### 3. Use skill `assets/` for templates

**Don't build:** A separate `cursor-stack init` script.

**Use instead:** Skills can have `assets/` directories. Our `workflow` skill could include `assets/config-template.json` and `assets/workflow-feature.json`. User copies or references. No new tooling.

**Action:** Add `workflow/assets/` with template files. Document: "Copy from workflow skill assets to your project."

### 4. Project-level skills for custom workflows

**Don't build:** A workflow engine that reads JSON.

**Use instead:** User creates `.cursor/skills/my-feature-workflow/SKILL.md` in their project. Content: "Run plan-ceo, then plan-eng, then implement, then review, then ship." The workflow skill can list project skills and suggest "you have my-feature-workflow — run /my-feature-workflow for guided flow."

**Action:** Workflow skill reads `.cursor/skills/` and `.agents/skills/` for *-workflow skills, presents them as options.

### 5. Build the workflow orchestrator

**Cursor does not have:** A step-by-step workflow runner that says "Step 1 of 6: plan-ceo. Run /plan-ceo..."

**We build:** The `workflow` skill. It's the one net-new piece. It can read project rules or a simple workflow file to know the sequence.

---

## Revised Recommendations

### Phase 1: Leverage Cursor (no new config format)

1. **Document Team Rules** — Add README section: "Org defaults: Use Cursor Team Rules."
2. **Document Project Rules** — Add README section: "Project overrides: Create `.cursor/rules/cursor-stack.mdc` or add cursor-stack section to AGENTS.md."
3. **Add Config section to plan-ceo/plan-eng** — "If @cursor-stack or AGENTS.md contains cursor-stack overrides (mainBranch, complexityThreshold, etc.), apply them."
4. **Provide template** — Add `templates/cursor-stack.mdc.example` with override format.

### Phase 2: Workflow skill (simplified)

5. **Create workflow skill** — Reads project for workflow definitions. If `.cursor/rules/cursor-stack.mdc` or AGENTS.md has a workflow section, use it. Else use built-in defaults (feature, bugfix, hotfix).
6. **Add workflow templates to skill assets** — `workflow/assets/workflow-feature.md` etc. User copies to project.
7. **Project-level workflow skills** — Document: "Add `.cursor/skills/my-workflow/SKILL.md` for custom sequences."

### Phase 3: Defer

8. **No JSON config schema** — Use Rules/AGENTS.md. Simpler.
9. **No cursor-stack init** — Use skill assets + copy. No new CLI.

---

## Summary

| Original Plan | Revised Approach |
|--------------|------------------|
| `.cursor-stack/config.json` | Project Rules or AGENTS.md section |
| Org config | Cursor Team Rules (already exists) |
| Workflow JSON files | Project-level workflow skills or Rules |
| Config schema | Not needed with Rules |
| Workflow orchestrator | Build — Cursor has no equivalent |
| cursor-stack init | Skill assets + manual copy |

**Bottom line:** Cursor already offers Team Rules (org), Project Rules (project), and project-level skills. We should use these instead of inventing a new config system. Build only the workflow orchestrator skill.
