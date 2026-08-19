class DittoCli < Formula
  desc "Isolate Claude Code, Codex, opencode, OMP, and Prime Agent accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.7/ditto-cli-v0.3.7-aarch64-apple-darwin.tar.gz"
      sha256 "7e7e8db93a9b43b7874c6e2a6603b9dc3c82ca3722877a1acae7e8bcadf01b58"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.7/ditto-cli-v0.3.7-x86_64-apple-darwin.tar.gz"
      sha256 "029d1d45792e0d69bdd4f1012550e562d9dc3a1eb84b838c570962f2366397cc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.7/ditto-cli-v0.3.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c0985765eedc6ac77efa2078945ff89a99486d875714aae1dd69e25a77503ab"
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
