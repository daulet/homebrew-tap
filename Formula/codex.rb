class Codex < Formula
  desc "AI coding assistant fork with persistent tree and side conversations"
  homepage "https://github.com/daulet/codex"
  license "Apache-2.0"

  depends_on "ripgrep"

  on_macos do
    on_intel do
      url "https://github.com/daulet/codex/releases/download/v0.128.0/codex-x86_64-apple-darwin.tar.gz"
      sha256 "81888a0eeab986b17ae92be8b5f07db132bc601675a299327dbbd822b3e4c9f8"
    end
    on_arm do
      url "https://github.com/daulet/codex/releases/download/v0.128.0/codex-aarch64-apple-darwin.tar.gz"
      sha256 "b38c966895403af43395e9fca7218ed502ecd396badb4111f5f931cbd6c77265"
    end
  end

  def install
    bin.install "codex"
  end

  test do
    assert_match "codex", shell_output("#{bin}/codex --version")
  end
end
