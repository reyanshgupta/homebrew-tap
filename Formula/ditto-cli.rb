class DittoCli < Formula
  desc "Isolate Claude Code, Codex, opencode, OMP, and Prime Agent accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.3/ditto-cli-v0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "f46473e1fe17c9184b5f2a73a7582f473e4b6119ae4717ca35a26a0a308e588a"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.3/ditto-cli-v0.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "31cea2ff4a800519aeb8c679da174007d6ed86f5964c16b2683dfce7f5fa611d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.3/ditto-cli-v0.4.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e172119148798132a620ce4d4a0ccc561f0332060720a212fd70483d198aa33e"
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
