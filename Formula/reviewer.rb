class Reviewer < Formula
  desc "TUI for reviewing GitHub PRs with Claude Code/Codex integration"
  homepage "https://github.com/daulet/reviewer"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/reviewer/releases/download/v0.4.1/reviewer-x86_64-apple-darwin.tar.gz"
      sha256 "dd3f23075b7cbcea8846fff1c08969d38c18ca88ae2f56f7ed8e807566707452"
    end
    on_arm do
      url "https://github.com/daulet/reviewer/releases/download/v0.4.1/reviewer-aarch64-apple-darwin.tar.gz"
      sha256 "fdd91a242ef191e2700a2d66aabed188763f69f42d6d26fe24e7e45f0abb83a8"
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
