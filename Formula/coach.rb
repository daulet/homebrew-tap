class Coach < Formula
  desc "Conflict-aware skill sync for Codex and Claude Code"
  homepage "https://github.com/daulet/skills"
  # Stable release URLs and checksums are managed by skills/.github/workflows/release.yml.
  head "https://github.com/daulet/skills.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "coach", shell_output("#{bin}/coach --help")
  end
end
