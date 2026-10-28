class DittoCli < Formula
  desc "Isolate Claude Code, Codex, opencode, OMP, and Prime Agent accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.7/ditto-cli-v0.4.7-aarch64-apple-darwin.tar.gz"
      sha256 "9f736d752d1db0e0d29754d96e9a4f66a92e359678038e36fb1bf0860c618768"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.7/ditto-cli-v0.4.7-x86_64-apple-darwin.tar.gz"
      sha256 "40f8a28e7cb95cd324549c3152a165f4f01f09b5247bcbfc8f0d88bb7499ae31"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.7/ditto-cli-v0.4.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3555ea5e23a3a3318f726a5bc00aec9ac7a74b0ec452520e03bdd59ce4710d91"
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
