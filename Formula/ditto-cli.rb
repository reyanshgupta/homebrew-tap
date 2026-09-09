class DittoCli < Formula
  desc "Isolate Claude Code, Codex, opencode, OMP, and Prime Agent accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.5/ditto-cli-v0.4.5-aarch64-apple-darwin.tar.gz"
      sha256 "3ef96c1df6ec2cd63ae6cfe23f5e984beba4b00accbcb97f976946c15c0a8d5d"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.5/ditto-cli-v0.4.5-x86_64-apple-darwin.tar.gz"
      sha256 "1c4634a0a4f8d766a9826b943766500d2087db7a432c6bf327ca1b37b056e92b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.5/ditto-cli-v0.4.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "58d21f9efa2018aeb579896b1c42cd9254bf43299eba700759959c91b4eaa9d4"
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
