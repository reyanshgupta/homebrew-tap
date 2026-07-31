class DittoCli < Formula
  desc "Switch between multiple Claude Code, Codex, opencode, and OMP accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.3/ditto-cli-v0.3.3-aarch64-apple-darwin.tar.gz"
      sha256 "933a86d97370cb0f6c5f1339c9a723ea8cf0dc9f6dd9f1c5cbf3f1a0d175ecc8"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.3/ditto-cli-v0.3.3-x86_64-apple-darwin.tar.gz"
      sha256 "de46a6e0385136a01097d004021eb9b3605bf8a496d9d18d2c9c6eaf4f10945b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.3/ditto-cli-v0.3.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcf075792bd769fca8247e5838a2f320d0cb1453b41f71f75427674cc6095a0a"
    end
  end

  def install
    bin.install "ditto-cli"
  end

  # Ditto installs as `ditto-cli` rather than `ditto` because macOS ships its
  # own file-copy utility at /usr/bin/ditto. Saying so at install time beats
  # leaving it to be discovered when `ditto` runs the wrong program.
  def caveats
    <<~EOS
      Ditto installs as `ditto-cli`. macOS already uses `ditto` for its
      built-in file-copy utility at /usr/bin/ditto.

      Run `ditto-cli` with no arguments for the profile picker.
    EOS
  end

  test do
    assert_match "ditto-cli #{version}", shell_output("#{bin}/ditto-cli --version")
  end
end
