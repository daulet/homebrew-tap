class Codex < Formula
  desc "AI coding assistant fork with persistent tree and side conversations"
  homepage "https://github.com/daulet/codex"
  license "Apache-2.0"

  depends_on "ripgrep"

  on_macos do
    on_intel do
      url "https://github.com/daulet/codex/releases/download/rust-v0.137.0/codex-x86_64-apple-darwin.tar.gz"
      sha256 "d66067c4257aca93f36a7cc9ae8bc3d0d03dccad1a1a1a9aefbb415f19c54808"
    end
    on_arm do
      url "https://github.com/daulet/codex/releases/download/rust-v0.137.0/codex-aarch64-apple-darwin.tar.gz"
      sha256 "cbcf1f26363f4ffaaada275d9d331a7525ca60a2a112f9b9a63ade7c2604b2aa"
    end
  end

  def install
    bin.install "codex"
  end

  test do
    assert_match "codex", shell_output("#{bin}/codex --version")
  end
end
