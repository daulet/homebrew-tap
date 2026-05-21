class Codex < Formula
  desc "AI coding assistant fork with persistent tree and side conversations"
  homepage "https://github.com/daulet/codex"
  license "Apache-2.0"

  depends_on "ripgrep"

  on_macos do
    on_intel do
      url "https://github.com/daulet/codex/releases/download/rust-v0.132.0/codex-x86_64-apple-darwin.tar.gz"
      sha256 "dcc3cc8ad238ba7bc75a8acfa840349094bc6e97685b915e39c423f2d0039763"
    end
    on_arm do
      url "https://github.com/daulet/codex/releases/download/rust-v0.132.0/codex-aarch64-apple-darwin.tar.gz"
      sha256 "042df0edb62dfc4d99fb3f2cf530cd3180f75a2a066eed993294f0e30e91c2d0"
    end
  end

  def install
    bin.install "codex"
  end

  test do
    assert_match "codex", shell_output("#{bin}/codex --version")
  end
end
