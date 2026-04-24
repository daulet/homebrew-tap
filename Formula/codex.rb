class Codex < Formula
  desc "AI coding assistant fork with persistent tree and side conversations"
  homepage "https://github.com/daulet/codex"
  version "0.124.0"
  license "Apache-2.0"

  depends_on "ripgrep"

  on_macos do
    on_intel do
      url "https://github.com/daulet/codex/releases/download/v0.124.0/codex-x86_64-apple-darwin.tar.gz"
      sha256 "1137344084708ca2477e2869880ffae2e68a2a71438913cbf77c3b7d43b20e2d"
    end
    on_arm do
      url "https://github.com/daulet/codex/releases/download/v0.124.0/codex-aarch64-apple-darwin.tar.gz"
      sha256 "3bbe9ee7ffcfac867eedf3070c87c7392ba12dac6d179319ecd783d91e2fd8fd"
    end
  end

  def install
    bin.install "codex"
  end

  test do
    assert_match "codex", shell_output("#{bin}/codex --version")
  end
end
