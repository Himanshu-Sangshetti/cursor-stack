# Changelog

All notable changes to cursor-stack will be documented in this file.

## [1.0.0] - 2025-03-15

### Added

- **8 workflow skills**: plan-ceo, plan-eng, researcher, code-review, ship, qa, retro, workflow
- **plan-ceo**: Founder/CEO mode. Challenge the premise, find the 10-star product. Three modes: EXPANSION, HOLD, REDUCTION
- **plan-eng**: Tech lead mode. Architecture, data flow, failure modes, diagrams
- **researcher**: Pre-planning research. Domain knowledge, tech options, codebase map. Feeds plan-ceo and plan-eng
- **code-review**: Paranoid staff engineer. Find bugs that pass CI but break in production
- **ship**: Release engineer. Sync main, run tests, push, open PR
- **qa**: QA lead. Diff-aware testing using Cursor's built-in browser
- **retro**: Engineering manager. Team-aware retrospectives
- **workflow**: Step-by-step orchestrator. Feature, bugfix, hotfix flows
- **Customization**: Project overrides via Rules/AGENTS.md; Team Rules for org defaults
- **Templates**: cursor-stack.mdc.example, persona-template
- **Documentation**: README, CONTRIBUTING.md

### Credits

- Inspired by [gstack](https://github.com/garrytan/gstack) by Garry Tan (YC)
- Built for the Cursor community
