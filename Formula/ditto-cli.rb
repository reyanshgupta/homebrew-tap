class DittoCli < Formula
  desc "Switch between multiple Claude Code, Codex, opencode, and OMP accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.2/ditto-cli-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "05c0c0e2f203e6bc79a587cb98f8ecc79b177edf265e8df87124dbf6812c925d"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.2/ditto-cli-v0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "dbbadd2e526e4925142c182a06b4c5f06c6291f55b268e5589ca70a26045b28d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.3.2/ditto-cli-v0.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d25af211b411c394f2d3db25a953eb5ae82afe09fd6dc547b5aca936d4fe8a9"
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
