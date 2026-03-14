# Customization

Override cursor-stack behavior at the org or project level.

## Org defaults: Team Rules

For org-wide defaults (Team and Enterprise plans), use [Cursor Team Rules](https://cursor.com/docs/rules) from the dashboard. Admins create rules that apply to all team members.

Precedence: Team Rules > Project Rules > User Rules.

Example content: `mainBranch: main`, `testCommand: npm test`, `complexityThreshold: 12`.

## Project overrides: Rules or AGENTS.md

Override cursor-stack per project.

**Option A:** Create `.cursor/rules/cursor-stack.mdc` with Apply Manually. Copy from `templates/cursor-stack.mdc.example`. @mention it when running plan-ceo or plan-eng.

**Option B:** Add a cursor-stack section to your project's `AGENTS.md` (simpler, always in context):

```markdown
## cursor-stack

- mainBranch: main
- testCommand: npm test
- complexityThreshold: 12
```

## Override options

| Option | Description |
|--------|-------------|
| mainBranch | Default branch name (e.g., `main`, `master`) |
| testCommand | Command to run tests (e.g., `npm test`, `pytest`) |
| complexityThreshold | Max files before suggesting scope reduction (e.g., `12`) |
| branchPrefix | Prefix for feature branches (e.g., `feat/`, `feature/`) |

## Project-level install

To share cursor-stack with teammates, copy skills into your project:

```bash
mkdir -p .cursor/skills
git clone https://github.com/Himanshu-Sangshetti/cursor-stack.git .cursor/skills/cursor-stack
# Then copy each skill folder to .cursor/skills/ in your project
```

Skills are discovered from `~/.cursor/skills/` (user) or `.cursor/skills/` / `.agents/skills/` (project).
