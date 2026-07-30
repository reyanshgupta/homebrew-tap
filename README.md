# Homebrew tap for Ditto CLI

Formulae for [Ditto CLI](https://github.com/reyanshgupta/ditto-cli), a terminal profile switcher that keeps multiple Claude Code, Codex, opencode, and OMP accounts apart.

```bash
brew install reyanshgupta/tap/ditto-cli
```

Name the tap in full, as above. Homebrew 6 loads a formula from a third-party tap only once you have trusted it, and installing by the full name trusts this one formula as it goes. Tapping first and installing by bare name is refused until you say so separately:

```bash
brew tap reyanshgupta/tap
brew trust --formula reyanshgupta/tap/ditto-cli
brew install ditto-cli
```

Ditto installs as `ditto-cli`, not `ditto`: macOS already uses that name for its built-in file-copy utility at `/usr/bin/ditto`.

The formula installs the prebuilt binary for your platform from the Ditto CLI releases, so Homebrew does not need a Rust toolchain to install it.

## Editing the formula

`Formula/ditto-cli.rb` is generated. Ditto CLI's release workflow renders it from [`.github/homebrew/ditto-cli.rb.template`](https://github.com/reyanshgupta/ditto-cli/blob/main/.github/homebrew/ditto-cli.rb.template) and pushes the result here, so a change made in this repository is overwritten by the next release. Edit the template instead.
