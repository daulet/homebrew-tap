class Mot < Formula
  desc "Fast CLI to aggregate LLM token usage from Codex and Claude Code metadata"
  homepage "https://github.com/daulet/mot"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/mot/releases/download/v0.1.1/mot-x86_64-apple-darwin.tar.gz"
      sha256 "e85a089c734d70b3613e3bef41c19076e2a2af46281e07054fd180c2416b96dd"
    end
    on_arm do
      url "https://github.com/daulet/mot/releases/download/v0.1.1/mot-aarch64-apple-darwin.tar.gz"
      sha256 "2beafaa44d70e991a5c7d5aaa49fa033759e9a6f5a2df12c2f91a938d1285711"
    end
  end

  def install
    bin.install "mot"
  end

  test do
    assert_path_exists bin/"mot"
  end
end
