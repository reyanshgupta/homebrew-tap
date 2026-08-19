class DittoCli < Formula
  desc "Isolate Claude Code, Codex, opencode, OMP, and Prime Agent accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.6/ditto-cli-v0.3.6-aarch64-apple-darwin.tar.gz"
      sha256 "dd64ef433e94536ab225dfeb1c95b5cb9d1f72e1d12a7ae2aa3be05beb1aeefa"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.6/ditto-cli-v0.3.6-x86_64-apple-darwin.tar.gz"
      sha256 "8d9cdcdd9d734d2c231947b8c391463a100c612944da851c79bce4f5ad70570c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.6/ditto-cli-v0.3.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a4aa457f5020bc6a78f60a68f4c413049c4c206d33d7cdcad1247d6cc62a6892"
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
