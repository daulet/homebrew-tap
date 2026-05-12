class Codex < Formula
  desc "AI coding assistant fork with persistent tree and side conversations"
  homepage "https://github.com/daulet/codex"
  license "Apache-2.0"

  depends_on "ripgrep"

  on_macos do
    on_intel do
      url "https://github.com/daulet/codex/releases/download/rust-v0.130.1/codex-x86_64-apple-darwin.tar.gz"
      sha256 "978b113b5fa834f36147e06b47fbbad38a8b112a2e7c13d2fa56db25ca8f4373"
    end
    on_arm do
      url "https://github.com/daulet/codex/releases/download/rust-v0.130.1/codex-aarch64-apple-darwin.tar.gz"
      sha256 "9bcfabc8c1542fa28c810db1319d0225fd4956bc2460fc66d6da495a22b5cdf4"
    end
  end

  def install
    bin.install "codex"
  end

  test do
    assert_match "codex", shell_output("#{bin}/codex --version")
  end
end
