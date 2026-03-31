class Mot < Formula
  desc "Fast CLI to aggregate LLM token usage from Codex and Claude Code metadata"
  homepage "https://github.com/daulet/mot"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/mot/releases/download/v0.1.0/mot-x86_64-apple-darwin.tar.gz"
      sha256 "e45b82d5384d20a3e39dedf8e12abaf54bb2044d0ba9c98ecb25125f7f9de48d"
    end
    on_arm do
      url "https://github.com/daulet/mot/releases/download/v0.1.0/mot-aarch64-apple-darwin.tar.gz"
      sha256 "bf18d490709b12e875188d4600593715b442d3ac06d82e1ecc2de13931594e16"
    end
  end

  def install
    bin.install "mot"
  end

  test do
    assert_path_exists bin/"mot"
  end
end
