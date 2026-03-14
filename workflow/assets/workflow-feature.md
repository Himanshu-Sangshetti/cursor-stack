# Feature Workflow

Full flow for new features or significant changes.

## Steps

1. **/researcher** *(optional)* — Gather domain knowledge and codebase context. Use when the feature touches unfamiliar domains or you want to compare approaches.
2. **/plan-ceo** — Product direction. Is this the right thing to build? Three modes: EXPANSION, HOLD, REDUCTION.
3. **/plan-eng** — Technical spec. How should it be built? Architecture, data flow, failure modes.
4. **Implement** — Implement the plan. Keep plan-ceo and plan-eng output in the same chat.
5. **/code-review** — Paranoid code review. (Cursor may show as /review.) Find bugs that pass CI but break in production.
6. **/ship** — Land the branch. Sync main, run tests, push, open PR.
7. **/qa** — Verify it works. Use Cursor's browser automation if applicable.

## Usage

Run `/workflow` and select "feature", or create `.cursor/skills/feature-workflow/SKILL.md` with this content and run `/feature-workflow`.
