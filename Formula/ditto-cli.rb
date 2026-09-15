class DittoCli < Formula
  desc "Isolate Claude Code, Codex, opencode, OMP, and Prime Agent accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.6/ditto-cli-v0.4.6-aarch64-apple-darwin.tar.gz"
      sha256 "9b284d2999e5d45e59783baadf9bd53961496a69ce3a75fb12f555f66365a9d7"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.6/ditto-cli-v0.4.6-x86_64-apple-darwin.tar.gz"
      sha256 "502e26b3ad71c994317757989b4387481f03f861c65d6b5491445b1079f37abe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.6/ditto-cli-v0.4.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e21685c1dfceaa8238de79e15fa6e31c0764c04a6ff05cf1495fa276587c3f5"
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
