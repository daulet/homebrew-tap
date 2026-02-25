class Reviewer < Formula
  desc "TUI for reviewing GitHub PRs with Claude Code/Codex integration"
  homepage "https://github.com/daulet/reviewer"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/reviewer/releases/download/v0.5.0/reviewer-x86_64-apple-darwin.tar.gz"
      sha256 "e69fb9b71ad838003d4a8e8730283c766488c71e5bc72314eb55d2d1e76c0938"
    end
    on_arm do
      url "https://github.com/daulet/reviewer/releases/download/v0.5.0/reviewer-aarch64-apple-darwin.tar.gz"
      sha256 "2e2c3db1c3db6a9c0fd6f597ce69050a727da0669d89235bb2fbea3fd1f9de5f"
    end
  end

  def install
    bin.install "reviewer"
  end

  def caveats
    <<~EOS
      reviewer requires the GitHub CLI (gh) to be installed and authenticated:
        brew install gh
        gh auth login

      Optional: Install delta for improved diff visualization:
        brew install git-delta

      Optional: For AI-powered reviews, install one of:
        npm install -g @anthropic-ai/claude-code
        npm install -g @openai/codex

      Optional: Install the code-review skill for enhanced AI reviews:
        mkdir -p ~/.claude/skills/code-review
        # Copy SKILL.md from the repository to ~/.claude/skills/code-review/
        # Or for Codex: ~/.codex/skills/code-review/

      Optional: Create a custom review guide:
        mkdir -p ~/.config/reviewer
        # Add your review preferences to ~/.config/reviewer/review_guide.md
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/reviewer --version")
  end
end
