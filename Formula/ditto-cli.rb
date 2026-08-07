class DittoCli < Formula
  desc "Isolate Claude Code, Codex, opencode, OMP, and Prime Agent accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.4/ditto-cli-v0.3.4-aarch64-apple-darwin.tar.gz"
      sha256 "175519d04c7b394568e85cd19ee8d012824a2c7497622daaab8a811cf386f29c"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.4/ditto-cli-v0.3.4-x86_64-apple-darwin.tar.gz"
      sha256 "bd27b3ab943e01888231e472cff2564181ca7121b3536c4c823c7e92374a3949"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.4/ditto-cli-v0.3.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f66dc5758f910b1ea55af5e47952e43c9d566de87599f5f7dfb3a2ff8890a9f6"
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
