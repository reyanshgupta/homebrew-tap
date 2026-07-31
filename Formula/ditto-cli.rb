class DittoCli < Formula
  desc "Switch between multiple Claude Code, Codex, opencode, and OMP accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.1/ditto-cli-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "135609fbfb0d26ebd6a8a31e9e7405482a157cfce77ac7c65cff7b4e70fb5469"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.1/ditto-cli-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "87b123cf6bfabcd18cf9a6b3a11dd108f0b26927e2a9c70003ec8a851cbf7930"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.1/ditto-cli-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b744de4341ad590198c74f848b46187eaed593813ddd4ab8b165c296146869a"
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
