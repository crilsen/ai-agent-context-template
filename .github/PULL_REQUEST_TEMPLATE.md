## What changed

<!-- A short description of the change. -->

## Why

<!-- The problem it solves or the reason for the change. -->

## Validation

- [ ] Ran `shellcheck` on changed shell scripts
- [ ] Tested `sh .ai/adapters/bootstrap.sh /tmp/actx-bootstrap-test claude opencode`
- [ ] Tested `sh .ai/adapters/install.sh /tmp/actx-adapter-test <tool>`
- [ ] Verified idempotency (running twice does not overwrite existing files)
- [ ] Updated `README.md` layout if files were added
- [ ] Updated `CHANGELOG.md` under `Unreleased`

## Scope

- [ ] Portable core (`AGENTS.md`, `.ai/`)
- [ ] Adapters
- [ ] Workflows or prompts
- [ ] Docs

## Notes

<!-- Anything not validated, open questions, or follow-ups. -->
