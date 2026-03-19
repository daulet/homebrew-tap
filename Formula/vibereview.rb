class Vibereview < Formula
  desc "TUI for viewing Claude Code and Codex CLI sessions"
  homepage "https://github.com/daulet/vibereview"
  license "MIT"
  version "0.3.2"

  on_macos do
    on_intel do
      url "https://github.com/daulet/vibereview/releases/download/v0.3.2/vibereview-x86_64-apple-darwin.tar.gz"
      sha256 "6e25ead4f6ff8220978d8c86aa55b275d4c19f31d1296ac2d82398e139dbfc3f"
    end
    on_arm do
      url "https://github.com/daulet/vibereview/releases/download/v0.3.2/vibereview-aarch64-apple-darwin.tar.gz"
      sha256 "15ab0c96613f9c29f2c6d2ba00aac10dc2b2ca8b6042f90d509d77e7f8d1b275"
    end
  end

  def install
    bin.install "vibereview"
  end

  test do
    assert_path_exists bin/"vibereview"
  end
end
