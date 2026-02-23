class Vibereview < Formula
  desc "TUI for viewing Claude Code and Codex CLI sessions"
  homepage "https://github.com/daulet/vibereview"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/vibereview/releases/download/v0.3.0/vibereview-x86_64-apple-darwin.tar.gz"
      sha256 "666cc9fbf2ee914a59076bb5b4243b08c0ac904400b6e9809538945ff99186b2"
    end
    on_arm do
      url "https://github.com/daulet/vibereview/releases/download/v0.3.0/vibereview-aarch64-apple-darwin.tar.gz"
      sha256 "eca8028bf6491b67dbfbdb7adbca6701788b86aa22504e68aee4fd090650cfdc"
    end
  end

  def install
    bin.install "vibereview"
  end

  test do
    assert_path_exists bin/"vibereview"
  end
end
