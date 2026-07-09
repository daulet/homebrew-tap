class Mot < Formula
  desc "Fast CLI to aggregate LLM token usage from Codex and Claude Code metadata"
  homepage "https://github.com/daulet/mot"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/mot/releases/download/v0.3.3/mot-x86_64-apple-darwin.tar.gz"
      sha256 "7a382407114b6cd21a72050b0a150502dd62544d7148d0eef2ce5f94fa713205"
    end
    on_arm do
      url "https://github.com/daulet/mot/releases/download/v0.3.3/mot-aarch64-apple-darwin.tar.gz"
      sha256 "9259e042e8d729424c9c8ca1aeb06ebb94ff71439b9e0aa56fbd7f6223907c92"
    end
  end

  def install
    bin.install "mot"
  end

  test do
    assert_path_exists bin/"mot"
  end
end
