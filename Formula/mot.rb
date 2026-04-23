class Mot < Formula
  desc "Fast CLI to aggregate LLM token usage from Codex and Claude Code metadata"
  homepage "https://github.com/daulet/mot"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/mot/releases/download/v0.3.1/mot-x86_64-apple-darwin.tar.gz"
      sha256 "9b47774163c9f72779219b82ba725b303475eebdeeabb682a89b8713acb71342"
    end
    on_arm do
      url "https://github.com/daulet/mot/releases/download/v0.3.1/mot-aarch64-apple-darwin.tar.gz"
      sha256 "fe00523263de527ba97b4687aa21ff2cfa8953edaa87f818ebddb60c8e6e4221"
    end
  end

  def install
    bin.install "mot"
  end

  test do
    assert_path_exists bin/"mot"
  end
end
