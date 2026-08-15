class DittoCli < Formula
  desc "Isolate Claude Code, Codex, opencode, OMP, and Prime Agent accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.5/ditto-cli-v0.3.5-aarch64-apple-darwin.tar.gz"
      sha256 "6037f8b4ff6aab3c074116abf01eff622c61f13b9a724e5dc0b3797b75316e77"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.5/ditto-cli-v0.3.5-x86_64-apple-darwin.tar.gz"
      sha256 "020f4c867d2713c51954560e65de41aa02d75e88498eee4f7295fa2e0325b5ce"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.5/ditto-cli-v0.3.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "80b7ec7ad6c9600302cc998bc538bb2bdde6a56935de43ea4f34c88798c833fa"
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
