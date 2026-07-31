class DittoCli < Formula
  desc "Switch between multiple Claude Code, Codex, opencode, and OMP accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.3/ditto-cli-v0.3.3-aarch64-apple-darwin.tar.gz"
      sha256 "61a678b2b46ba6d137842e0001ec369ba80333dfcbeab5d3306d1e9270478a41"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.3/ditto-cli-v0.3.3-x86_64-apple-darwin.tar.gz"
      sha256 "369a4276a370d7bcf2f8f6084a7bebe079a2b13ee729ce82f442ba1f4a74ded6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.3/ditto-cli-v0.3.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1af19a7061f991507294ec7753e6146a6cab9724d1469072f6b4f2d36a4f7345"
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
