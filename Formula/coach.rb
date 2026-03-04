class Coach < Formula
  desc "Conflict-aware skill sync for Codex and Claude Code"
  homepage "https://github.com/daulet/skills"
  version "0.1.1"

  on_macos do
    on_intel do
      url "https://github.com/daulet/skills/releases/download/v0.1.1/coach-x86_64-apple-darwin.tar.gz"
      sha256 "7359985ae2a2a9d1f0e81b68ec32a3619f0408b90a70207e2df12e8c1759914b"
    end
    on_arm do
      url "https://github.com/daulet/skills/releases/download/v0.1.1/coach-aarch64-apple-darwin.tar.gz"
      sha256 "7fde4f487ca4a2a2cd23c2683631b6ae46d88dd0ef6499e5fe6defa87949476b"
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
