class DittoCli < Formula
  desc "Isolate Claude Code, Codex, opencode, OMP, and Prime Agent accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.4/ditto-cli-v0.3.4-aarch64-apple-darwin.tar.gz"
      sha256 "c7908ece446210777371f925d8d552ade51ce88df313df3ba7e1cdde04152db5"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.4/ditto-cli-v0.3.4-x86_64-apple-darwin.tar.gz"
      sha256 "e164240d19399a522215509867c0b62f942ded7df3a68641776fbe1c08809472"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.4/ditto-cli-v0.3.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a9974ddd6ad8b55be77b6e122d0b30f61373e3762f6766d0200179d610ef5bb"
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
