class DittoCli < Formula
  desc "Isolate Claude Code, Codex, opencode, OMP, and Prime Agent accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.0/ditto-cli-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "5965e997395141f9daf749d261643d9696099662d6498d4af85eb3a3544f5cf4"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.0/ditto-cli-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "7c7bfdcd67ff303cbd1e67b6df7e53b05b93c5c46a289af03759d73b0fc98aee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.0/ditto-cli-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "561aa522e2026b631595da4a5beca373ec417b987eeeff3aa1ddca8d86569136"
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
