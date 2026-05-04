class Codex < Formula
  desc "AI coding assistant fork with persistent tree and side conversations"
  homepage "https://github.com/daulet/codex"
  license "Apache-2.0"

  depends_on "ripgrep"

  on_macos do
    on_intel do
      url "https://github.com/daulet/codex/releases/download/rust-v0.128.3/codex-x86_64-apple-darwin.tar.gz"
      sha256 "fa28ada9a5adf82e1545d256b38be032cf9d9f8f2d8e3c4aab65f4716e685067"
    end
    on_arm do
      url "https://github.com/daulet/codex/releases/download/rust-v0.128.3/codex-aarch64-apple-darwin.tar.gz"
      sha256 "b48460a5a9611946ad5aa6226f0444d86b6364af405946033e61736f8300ac0d"
    end
  end

  def install
    bin.install "codex"
  end

  test do
    assert_match "codex", shell_output("#{bin}/codex --version")
  end
end
