# Planning Pipeline

plan-ceo and plan-eng work together as a coherent pipeline. Run them in the same chat so plan-eng can consume plan-ceo's output.

## The Flow

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

## Handoff Outputs

**plan-ceo produces** (for plan-eng to use):

- What You Asked For, The Real Problem, 10-Star Version (or Minimal Version)
- Key Questions to Answer First
- Recommendation
- NOT in scope: work deferred with rationale
- What already exists: code/flows that partially solve sub-problems
- Dream state delta: where this leaves us vs 12-month ideal

**plan-eng consumes** plan-ceo's output and produces:

- Technical Specification (architecture, data flow, diagrams)
- Failure modes table with CRITICAL GAP flagging for unrescued, untested, silent failures
- NOT in scope: technical deferrals
- What already exists: technical reuse
- Completion summary

## Why the handoff matters

Without it, plan-eng might create a spec that diverges from the product direction. With it, the technical plan implements exactly what plan-ceo recommended: same scope, same mode (EXPANSION / HOLD / REDUCTION), same deferred work.

## When to use researcher

Run `/researcher` first when:

- The domain is unfamiliar
- You want to compare approaches
- The codebase is large and you need a map
- Tradeoffs are unclear

Skip researcher when: well-known domain, small change (bug fix, config tweak), or requirements are clear.

Keep the Research Brief in the same chat so plan-ceo and plan-eng can use it. Do not repeat it; reference it.
