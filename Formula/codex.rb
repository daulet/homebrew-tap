class Codex < Formula
  desc "AI coding assistant fork with persistent tree and side conversations"
  homepage "https://github.com/daulet/codex"
  license "Apache-2.0"

  depends_on "ripgrep"

  on_macos do
    on_intel do
      url "https://github.com/daulet/codex/releases/download/v0.128.1/codex-x86_64-apple-darwin.tar.gz"
      sha256 "ab4e376bd2d8f35f49618c8f26eb9d8a8f344b8c9614398e88d026db4d329bb1"
    end
    on_arm do
      url "https://github.com/daulet/codex/releases/download/v0.128.1/codex-aarch64-apple-darwin.tar.gz"
      sha256 "29ddd14c5ee7574bb8241f296751e7df3e351a879461a862d60cbbe5d26ce004"
    end
  end

  def install
    bin.install "codex"
  end

  test do
    assert_match "codex", shell_output("#{bin}/codex --version")
  end
end
