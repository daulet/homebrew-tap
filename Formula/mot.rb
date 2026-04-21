class Mot < Formula
  desc "Fast CLI to aggregate LLM token usage from Codex and Claude Code metadata"
  homepage "https://github.com/daulet/mot"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/mot/releases/download/v0.1.2/mot-x86_64-apple-darwin.tar.gz"
      sha256 "d3b2a59f957c922e25edee1ff5bedb7a5d5051cc22dbe54b71c99a753f9d08f3"
    end
    on_arm do
      url "https://github.com/daulet/mot/releases/download/v0.1.2/mot-aarch64-apple-darwin.tar.gz"
      sha256 "80cc8cf630ec14f064d9a2faf06e11e71c0259bf808e932f782fe3c03f555b38"
    end
  end

  def install
    bin.install "mot"
  end

  test do
    assert_path_exists bin/"mot"
  end
end
