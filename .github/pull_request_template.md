# Description

Please delete options that are not relevant.

[x] fix: which represents bug fixes, and correlates to a PATCH version update.
[] feat: which represents a new feature, and correlates to a MINOR version update.
[] feat!:, or fix!:, refactor!: which represent a breaking change (indicated by the !) and will result in a MAJOR version update.
[] This change requires a documentation update

# Steps to Integrate/Test this PR

[] get latest dependencies, mix deps.get
[] run migrations, mix ecto.migrate (for both DEV and TEST)
[x] run the tests, mix test

# How Has This Been Tested?

- unit/integration tests
- manual tests via Insomnia
