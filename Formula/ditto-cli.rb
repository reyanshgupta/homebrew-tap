class DittoCli < Formula
  desc "Switch between multiple Claude Code, Codex, opencode, and OMP accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.1/ditto-cli-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "c1fa1af04a20a68888b2f5ade52c2dd074f0ae202453dd7b12f971ac4fe7a556"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.1/ditto-cli-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "38d5700da359e7c211fc94066d3e0e74fbd30c8c10eff99246aedbb500b017bb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.1/ditto-cli-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2d96d95c16b77b7ec27692a9703557929770a985f6ecace265dd395df6be6b6"
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
