class Reviewer < Formula
  desc "TUI for reviewing GitHub PRs with Claude Code/Codex integration"
  homepage "https://github.com/daulet/reviewer"
  license "MIT"
  version "0.6.2"

  on_macos do
    on_intel do
      url "https://github.com/daulet/reviewer/releases/download/v0.6.2/reviewer-x86_64-apple-darwin.tar.gz"
      sha256 "72062bc6f454395bfcdcddb4304ddae27a8bb79666251e779b7c7f99fd343260"
    end
    on_arm do
      url "https://github.com/daulet/reviewer/releases/download/v0.6.2/reviewer-aarch64-apple-darwin.tar.gz"
      sha256 "7a279d6df24945ec37e9951859e24916bdcaf1469fb7a805b844f27e0e19424f"
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
