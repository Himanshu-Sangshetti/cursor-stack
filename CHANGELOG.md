# Changelog

All notable changes to cursor-stack will be documented in this file.

## [1.0.0] - 2025-03-15

### Added

- **8 workflow skills**: plan-ceo, plan-eng, researcher, code-review, ship, qa, retro, workflow
- **plan-ceo**: Founder/CEO mode — challenge the premise, find the 10-star product. Three modes: EXPANSION, HOLD, REDUCTION
- **plan-eng**: Tech lead mode — architecture, data flow, failure modes, diagrams
- **researcher**: Pre-planning research — domain knowledge, tech options, codebase map. Feeds plan-ceo and plan-eng
- **code-review**: Paranoid staff engineer — find bugs that pass CI but break in production
- **ship**: Release engineer — sync main, run tests, push, open PR
- **qa**: QA lead — diff-aware testing using Cursor's built-in browser
- **retro**: Engineering manager — team-aware retrospectives
- **workflow**: Step-by-step orchestrator — feature, bugfix, hotfix flows
- **Customization**: Project overrides via Rules/AGENTS.md; Team Rules for org defaults
- **Templates**: cursor-stack.mdc.example, persona-template
- **Documentation**: README, CONTRIBUTING.md

### Credits

- Inspired by [gstack](https://github.com/garrytan/gstack) by Garry Tan (YC)
- Built for the Cursor community
