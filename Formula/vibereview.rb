class Vibereview < Formula
  desc "TUI for viewing Claude Code and Codex CLI sessions"
  homepage "https://github.com/daulet/vibereview"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/vibereview/releases/download/v#{version}/vibereview-x86_64-apple-darwin.tar.gz"
      sha256 "06b07d59fdf72fb95c89ed83553c2216260b28c51201342a5ddff0b504f6007a"
    end
    on_arm do
      url "https://github.com/daulet/vibereview/releases/download/v#{version}/vibereview-aarch64-apple-darwin.tar.gz"
      sha256 "8ffebcaf876359971685a24c27caaf258537bfec7506bb8e91381c6b2a7d1703"
    end
  end

  def install
    bin.install "vibereview"
  end

  test do
    assert_predicate bin/"vibereview", :exist?
  end
end
