class DittoCli < Formula
  desc "Isolate Claude Code, Codex, opencode, OMP, and Prime Agent accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.4/ditto-cli-v0.3.4-aarch64-apple-darwin.tar.gz"
      sha256 "27c3bfbbc8b4aee5628ec61b2fcf9a8fa8a57167b33f7835a628a3fe3e1c39ee"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.4/ditto-cli-v0.3.4-x86_64-apple-darwin.tar.gz"
      sha256 "9cfecc62deb50509a2fd8c26997171998138dee74092bf4066b9ff85554af3f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.4/ditto-cli-v0.3.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f97656321dbf6adb49a3a8d5898fffab29682295cd110462539ec171c86699d"
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
