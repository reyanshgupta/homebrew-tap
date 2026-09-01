class DittoCli < Formula
  desc "Isolate Claude Code, Codex, opencode, OMP, and Prime Agent accounts"
  homepage "https://github.com/reyanshgupta/ditto-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling Rust on the user's machine.
  on_macos do
    on_arm do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.1/ditto-cli-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "1144c9a6bd0a88a5f800d92e92f07ce1cfa81f50dbf961968f853903ca2015ed"
    end

    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.1/ditto-cli-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "489c49e602f5bbaae560fee9469b3026a623552fb7199988304123f4c8484c54"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/reyanshgupta/ditto-cli/releases/download/v0.4.1/ditto-cli-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4470c3a18ea4e0e208e4bb00466f3b34b30d30f150bc4d583e91b90f7391e1e5"
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
