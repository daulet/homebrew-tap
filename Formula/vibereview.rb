class Vibereview < Formula
  desc "TUI for viewing Claude Code and Codex CLI sessions"
  homepage "https://github.com/daulet/vibereview"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/vibereview/releases/download/v0.2.0/vibereview-x86_64-apple-darwin.tar.gz"
      sha256 "758c7c5079d1c72c07e717bbcc72161f86af046f50fa040e47bfea8e43419d52"
    end
    on_arm do
      url "https://github.com/daulet/vibereview/releases/download/v0.2.0/vibereview-aarch64-apple-darwin.tar.gz"
      sha256 "1c43245ccfab51d85eab41214a57553246f78a6c1136fbb32c3b99f81fc5e49f"
    end
  end

  def install
    bin.install "vibereview"
  end

  test do
    assert_path_exists bin/"vibereview"
  end
end
