class DittoCli < Formula
  desc "Isolate Claude Code, Codex, opencode, OMP, and Prime Agent accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.2/ditto-cli-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "6cd6ad55b84c5a30191a16a26f4508474a2d53051c971e2af6d474dd7bb8dbf1"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.2/ditto-cli-v0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "e5b1e86d7237a14c26eb60992ec550c3d79b7524c3c1fd2d5e376d8cfc10ab2b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.2/ditto-cli-v0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e359d4af6151f4443c24ee88530a7c5f55222929fa686606ec284b7b20a06e7c"
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
