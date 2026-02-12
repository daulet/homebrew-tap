class Vibereview < Formula
  desc "TUI for viewing Claude Code and Codex CLI sessions"
  homepage "https://github.com/daulet/vibereview"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/vibereview/releases/download/v#{version}/vibereview-x86_64-apple-darwin.tar.gz"
      sha256 "TODO"
    end
    on_arm do
      url "https://github.com/daulet/vibereview/releases/download/v#{version}/vibereview-aarch64-apple-darwin.tar.gz"
      sha256 "TODO"
    end
  end

  def install
    bin.install "vibereview"
  end

  test do
    assert_predicate bin/"vibereview", :exist?
  end
end
