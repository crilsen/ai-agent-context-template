# Contributing

Thanks for helping improve ai-agent-relay. This project is a set of small Markdown files plus a few shell scripts; contributions should stay small, portable, and tool-agnostic.

## Ground rules

- Keep the portable core portable: `AGENTS.md` and `.ai/` are the source of truth; nothing should depend on one IDE, model, or provider.
- Keep tool-specific files as thin adapters that only route to `AGENTS.md`. Do not put project facts in them.
- Keep `AGENTS.md` short and route-oriented; put detail in `.ai/`.
- Do not invent history. Facts are observed, inferences are marked inferred, unknowns stay unknown.
- Never store secrets, credentials, machine paths, or personal data in the repository.
- Follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## Ways to contribute

- Fix typos, unclear wording, or broken links.
- Improve a workflow or adapter.
- Add an adapter for a tool that does not read `AGENTS.md` natively and is not listed in `.ai/ADAPTERS.md`.
- Report confusion: if the template was unclear when you adopted it, that is a bug worth fixing.

## Adding or changing an adapter

1. Add the source file under `.ai/adapters/` (for example `mytool.md` with the tool's exact content).
1. Register it in `.ai/adapters/install.sh` and in the mapping table in `.ai/ADAPTERS.md`.
1. Test the install into a scratch directory:

```bash
sh .ai/adapters/install.sh /tmp/actx-adapter-test mytool
```

1. If the tool reads `AGENTS.md` natively, document that and skip the adapter.

## Testing scripts

The shell scripts must pass `shellcheck` and work with `sh` (POSIX), not only `bash`. Verify the bootstrap end to end:

```bash
sh .ai/adapters/bootstrap.sh /tmp/actx-bootstrap-test claude opencode
```

Confirm it creates `AGENTS.md`, `.ai/`, `README.md`, and `.gitignore`, is idempotent when run twice, and does not overwrite existing files.

## Documentation conventions

- Write in English.
- Prefer short sentences and concrete examples.
- Reference authoritative documents instead of copying them.
- Update `CHANGELOG.md` under `Unreleased` for user-visible changes.

## Pull requests

- Keep each pull request focused on one change.
- Describe what changed, why, and how you validated it.
- If you add a new file or section, update `README.md` (layout) and `CHANGELOG.md`.
- Note anything you could not validate.

## Commit messages

Use a concise summary line in the imperative mood, for example:

```text
Add adapter for MyTool and register it in install.sh
```

## License

By contributing, you agree that your contributions are licensed under the [MIT License](LICENSE).
