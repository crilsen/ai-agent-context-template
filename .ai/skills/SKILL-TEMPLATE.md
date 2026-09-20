# Skill Template

Copy this directory to `.ai/skills/<name>/` and edit `SKILL.md`. A skill describes a procedure and points to `.ai/` for facts; it must not duplicate project context.

Keep it thin. If the skill needs project knowledge, link to the relevant `.ai/` file instead of restating it.

---

Front matter fields:

- `name`: lowercase, hyphenated, matches the directory name.
- `description`: one or two sentences stating when to use the skill and what triggers it. Start with the situation, not the feature.

Body structure:

1. When to use it.
2. Steps.
3. Files to read.
4. Rules and boundaries.
