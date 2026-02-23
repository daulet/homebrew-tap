class Vibereview < Formula
  desc "TUI for viewing Claude Code and Codex CLI sessions"
  homepage "https://github.com/daulet/vibereview"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/vibereview/releases/download/v0.3.1/vibereview-x86_64-apple-darwin.tar.gz"
      sha256 "b05d69f662e0ad52773f7ec554d796b83d5b3dbcbba8970f54bf2fbe80c483cc"
    end
    on_arm do
      url "https://github.com/daulet/vibereview/releases/download/v0.3.1/vibereview-aarch64-apple-darwin.tar.gz"
      sha256 "57e142ea3a227839f707bcc41a654e6b0d8e6938582c7220c25e0781b8e7b6db"
    end
  end

  def install
    bin.install "vibereview"
  end

  test do
    assert_path_exists bin/"vibereview"
  end
end
