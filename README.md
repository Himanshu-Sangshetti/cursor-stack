# cursor-stack

**cursor-stack turns Cursor's AI agent from one generic assistant into a team of specialists you can summon on demand.**

Eight opinionated workflow skills for [Cursor](https://cursor.com). Plan review, code review, one-command shipping, QA testing, and engineering retrospectives — all as slash commands.

Inspired by [gstack](https://github.com/garrytan/gstack) by Garry Tan (YC). Built for Cursor — no binaries, no build step, just copy and go.

## Without cursor-stack

- The agent takes your request literally — it never asks if you're building the right thing
- "Review my PR" gives inconsistent depth every time
- "Ship this" turns into a long back-and-forth about what to do
- You still do QA by hand: open browser, click around, check pages

## With cursor-stack

| Skill | Mode | What it does |
|-------|------|--------------|
| `/plan-ceo` | Founder / CEO | Rethink the problem. Find the 10-star product hiding inside the request. Three modes: EXPANSION, HOLD, REDUCTION. |
| `/plan-eng` | Eng manager / tech lead | Lock in architecture, data flow, diagrams, edge cases, and tests. |
| `/review` | Paranoid staff engineer | Find the bugs that pass CI but blow up in production. |
| `/ship` | Release engineer | Sync main, run tests, push, open PR. For a ready branch, not for deciding what to build. |
| `/qa` | QA lead | Systematic QA testing. Diff-aware, full exploration, quick smoke test. Uses Cursor's built-in browser automation. |
| `/retro` | Engineering manager | Team-aware retro: your deep-dive + per-person praise and growth opportunities. |
| `/researcher` | Research mode | Gathers domain knowledge, tech options, and codebase context. Run before plan-ceo and plan-eng for better-informed planning. |
| `/workflow` | Workflow orchestrator | Step-by-step guided flow. Built-in: feature, bugfix, hotfix. Or use project-level workflow skills. |

## Demo: one feature, five modes

```
You:   I want to add seller photo upload to the listing app. Sellers
       should be able to upload a photo and we create the listing from it.

You:   /plan-ceo

Cursor: "Photo upload" is not the feature. The real job is helping sellers
        create listings that actually sell. The 10-star version: auto-identify
        the product from the photo, pull specs from the web, draft the title
        and description, suggest the best hero image...

You:   /plan-eng

Cursor: [Architecture diagram, state machine for upload → classify → enrich
        → draft pipeline, edge cases, test matrix]

You:   [implement the plan]

You:   /review

Cursor: Race condition: two tabs can overwrite cover-photo selection.
        Trust boundary: pulling web data into draft generation creates
        a prompt injection vector. Missing: orphan cleanup for failed uploads.

You:   (fix the issues)

You:   /ship

Cursor: [Syncs main, runs tests, pushes branch, opens PR — done]

You:   /qa

Cursor: Analyzing branch diff... 8 files changed, 3 routes affected.
        [Tests affected pages via browser-use]
        All 3 routes working. Upload + enrichment flow passes end to end.
```

## Who this is for

You already use Cursor heavily and want consistent, high-rigor workflows instead of one mushy generic mode. You want to tell the model what kind of brain to use right now — founder taste, engineering rigor, paranoid review, or fast execution.

This is not a prompt pack for beginners. It is an operating system for people who ship.

## Install

**Requirements:** [Cursor](https://cursor.com) with Agent/Skills support.

### Option A: Clone to skills directory (recommended)

```bash
# Clone into your Cursor skills folder
git clone https://github.com/Himanshu-Sangshetti/cursor-stack.git ~/.cursor/skills/cursor-stack

# Copy each skill so Cursor discovers them (skills must be direct children of ~/.cursor/skills/)
# Run the setup script, or manually:
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

### Option C: Project-level install (share with teammates)

Copy the `cursor-stack` folder into your project's `.cursor/skills/` directory:

```bash
mkdir -p .cursor/skills
git clone https://github.com/Himanshu-Sangshetti/cursor-stack.git .cursor/skills/cursor-stack
# Then copy skills as in Option A, but to .cursor/skills/ in your project
```

## How to use

Just mention the skill name in your Cursor chat:

- "Use plan-ceo to review this feature idea"
- "Use plan-eng to create the technical spec"
- "/review" or "Use code-review on my changes"
- "/ship" or "Use ship to land this branch"
- "/qa" or "Use qa to test localhost:3000"
- "/retro" or "Use retro for the last week"
- "/researcher" or "Use researcher to gather info before planning"
- "/workflow" or "Use workflow for guided feature/bugfix/hotfix flow"

Cursor will automatically read the skill and follow its instructions.

## Your workflow

1. **Describe** the feature idea
2. **`/researcher`** *(optional)* — Gather domain knowledge and codebase context first. Use for unfamiliar domains or when you want to compare approaches.
3. **`/plan-ceo`** — Is this the right thing to build?
4. **`/plan-eng`** — How should it be built?
5. **Implement** the plan
6. **`/review`** — Find hidden bugs
7. **`/ship`** — Land the code
8. **`/qa`** — Verify it works

**Or run `/workflow`** for step-by-step guidance through the feature, bugfix, or hotfix flow.

## Plan-CEO and Plan-ENG: The Planning Pipeline

plan-ceo and plan-eng work together as a coherent pipeline. Run them in the same chat so plan-eng can consume plan-ceo's output.

### The Flow

```
User describes feature
        |
        v
   /researcher  (optional: domain knowledge, tech options, codebase map)
        |
        v
   /plan-ceo  (product direction, mode, 10-star version)
        |
        |  Outputs: Recommendation, NOT in scope, What already exists, Dream state delta
        v
   /plan-eng  (technical spec that implements plan-ceo's direction)
        |
        |  Outputs: Architecture, Failure modes, NOT in scope, What already exists
        v
   Implement
```

### Handoff Outputs

**plan-ceo produces** (for plan-eng to use):

- What You Asked For, The Real Problem, 10-Star Version (or Minimal Version)
- Key Questions to Answer First
- Recommendation
- **NOT in scope** — work deferred with rationale
- **What already exists** — code/flows that partially solve sub-problems
- **Dream state delta** — where this leaves us vs 12-month ideal

**plan-eng consumes** plan-ceo's output and produces:

- Technical Specification (architecture, data flow, diagrams)
- **Failure modes table** — with CRITICAL GAP flagging for unrescued, untested, silent failures
- **NOT in scope** — technical deferrals
- **What already exists** — technical reuse
- Completion summary

### Why the handoff matters

Without it, plan-eng might create a spec that diverges from the product direction. With it, the technical plan implements exactly what plan-ceo recommended — same scope, same mode (EXPANSION / HOLD / REDUCTION), same deferred work.

## Customization

### Org defaults: Team Rules

For org-wide cursor-stack defaults (Team and Enterprise plans), use [Cursor Team Rules](https://cursor.com/docs/rules) from the dashboard. Admins create rules that apply to all team members. Precedence: Team Rules > Project Rules > User Rules.

Example content: `mainBranch: main`, `testCommand: npm test`, `complexityThreshold: 12`.

### Project overrides: Rules or AGENTS.md

Override cursor-stack behavior per project:

**Option A:** Create `.cursor/rules/cursor-stack.mdc` with Apply Manually. Copy from `templates/cursor-stack.mdc.example`. @mention it when running plan-ceo or plan-eng.

**Option B:** Add a cursor-stack section to your project's `AGENTS.md` (simpler, always in context):

```markdown
## cursor-stack

- mainBranch: main
- testCommand: npm test
- complexityThreshold: 12
```

### Custom workflows

Add `.cursor/skills/my-workflow/SKILL.md` for custom step sequences. Example: `launch-workflow` that runs researcher → plan-ceo → plan-eng → implement → review → ship → qa. Copy templates from `workflow/assets/` (workflow-feature.md, workflow-bugfix.md, workflow-hotfix.md). Run `/workflow` to discover project workflows; use `/my-workflow` for your custom flow.

## Creating custom personas

In Cursor, **personas are skills**. Each skill defines a "brain" (mindset, process, output format). Creating a new persona = creating a new skill.

**Storage:** Project personas → `.cursor/skills/persona-name/`; Personal → `~/.cursor/skills/`

**Template:** Copy from `templates/persona-template/SKILL.md`. Structure: Mindset, Process, Output Format, Handoff (what feeds into other skills).

**Example:** Add a `security-reviewer` persona that runs before `/ship` for security-sensitive changes. Create `.cursor/skills/security-reviewer/SKILL.md` with security-focused mindset and checklist, then add it to your workflow sequence.

**Workflow integration:** Add your persona to a project workflow skill. E.g., in `launch-workflow`, insert step 5.5: `/security-reviewer` before `/ship`.

## Comparison with gstack

| Feature | gstack (Claude Code) | cursor-stack (Cursor) |
|---------|----------------------|------------------------|
| Platform | Claude Code | Cursor |
| Browser QA | Custom ~58MB binary (Bun + Playwright) | Cursor's built-in browser-use |
| Install | `./setup` builds binary, symlinks | Copy skills, no build |
| Skills | 8 (includes browse, setup-browser-cookies) | 8 (browse via Cursor native; researcher, workflow) |

cursor-stack adapts the gstack philosophy for Cursor. Same cognitive modes, Cursor-native implementation.

## Credits

- Inspired by [gstack](https://github.com/garrytan/gstack) by [Garry Tan](https://x.com/garrytan), President & CEO of Y Combinator
- Built for the Cursor community

## License

MIT
