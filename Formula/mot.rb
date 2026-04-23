class Mot < Formula
  desc "Fast CLI to aggregate LLM token usage from Codex and Claude Code metadata"
  homepage "https://github.com/daulet/mot"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/mot/releases/download/v0.3.2/mot-x86_64-apple-darwin.tar.gz"
      sha256 "0842a3bfb7262bbe90f08d3b3e22688e5cd7639cc2feb4c81b73eca2b8a7a39e"
    end
    on_arm do
      url "https://github.com/daulet/mot/releases/download/v0.3.2/mot-aarch64-apple-darwin.tar.gz"
      sha256 "9aff10f76a32a6c2700ae17ceee1eb1e30f36afacea2f2ba44df22f51c2fefe5"
    end
  end

  def install
    bin.install "mot"
  end

  test do
    assert_path_exists bin/"mot"
  end
end
