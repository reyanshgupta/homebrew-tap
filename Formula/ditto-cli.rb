class DittoCli < Formula
  desc "Switch between multiple Claude Code, Codex, opencode, and OMP accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.3/ditto-cli-v0.3.3-aarch64-apple-darwin.tar.gz"
      sha256 "e0f26fbd932697c601d0e09e9237d475e46f28ae23132f03dc66f7d58dc8cd11"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.3/ditto-cli-v0.3.3-x86_64-apple-darwin.tar.gz"
      sha256 "5758d580b0333934da63b35ae0857a08790b599e5203ef36b40d24714c9e418e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.3/ditto-cli-v0.3.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e14bd5a0a9cc94b35be8665ec20d314e02d68d541d4f8a20ef0911b252e40f3d"
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
