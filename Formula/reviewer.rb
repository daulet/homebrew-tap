class Reviewer < Formula
  desc "TUI for reviewing GitHub PRs with Claude Code/Codex integration"
  homepage "https://github.com/daulet/reviewer"
  license "MIT"
  version "0.6.1"

  on_macos do
    on_intel do
      url "https://github.com/daulet/reviewer/releases/download/v0.6.1/reviewer-x86_64-apple-darwin.tar.gz"
      sha256 "c660fb1ff31907dcd0ffec4f21eb9b74e427a9c9caeec8ad48c6ca47fd8129bb"
    end
    on_arm do
      url "https://github.com/daulet/reviewer/releases/download/v0.6.1/reviewer-aarch64-apple-darwin.tar.gz"
      sha256 "93dd2a83862f5d7d030ec0bc0c8d2c85de1a6c7a158700681b4475aa9fcb7954"
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
