class DittoCli < Formula
  desc "Isolate Claude Code, Codex, opencode, OMP, and Prime Agent accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.4/ditto-cli-v0.4.4-aarch64-apple-darwin.tar.gz"
      sha256 "efaf61d3cb0b8cb6db8da4d1afbdacf9784b6deb74912ac749c562947636a003"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.4/ditto-cli-v0.4.4-x86_64-apple-darwin.tar.gz"
      sha256 "3b64b8d01d5419bab4390705378bf5cd69eb447f45dd9d2dfad725bce3e5b96f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.4/ditto-cli-v0.4.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce3cf8bedf45be7a8b9eb115f2ecb57e38da272488ba786b8a5c68e53062822a"
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
