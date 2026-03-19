class Coach < Formula
  desc "Conflict-aware skill sync for Codex and Claude Code"
  homepage "https://github.com/daulet/skills"
  version "0.1.3"

  on_macos do
    on_intel do
      url "https://github.com/daulet/skills/releases/download/v0.1.3/coach-x86_64-apple-darwin.tar.gz"
      sha256 "261ae73b26c50a6d029d3a2e2ae72014f291dcfeb9e3e0133db47931be0e7fc2"
    end
    on_arm do
      url "https://github.com/daulet/skills/releases/download/v0.1.3/coach-aarch64-apple-darwin.tar.gz"
      sha256 "0fefba04810667982aa353119e900080ac3d9b7bdb119f8ddc3613d62e8aa2ae"
    end
  end

  head "https://github.com/daulet/skills.git", branch: "main"

  head do
    depends_on "rust" => :build
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "coach"
    end
  end

  test do
    assert_match "coach", shell_output("#{bin}/coach --help")
  end
end
