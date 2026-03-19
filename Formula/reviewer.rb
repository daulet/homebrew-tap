class Reviewer < Formula
  desc "TUI for reviewing GitHub PRs with Claude Code/Codex integration"
  homepage "https://github.com/daulet/reviewer"
  license "MIT"
  version "0.6.0"

  on_macos do
    on_intel do
      url "https://github.com/daulet/reviewer/releases/download/v0.6.0/reviewer-x86_64-apple-darwin.tar.gz"
      sha256 "abe2b1b54b54ed0f809ce9018abfc2bd2fd1ea3c6c61ae264fa5f0563a9b0c5c"
    end
    on_arm do
      url "https://github.com/daulet/reviewer/releases/download/v0.6.0/reviewer-aarch64-apple-darwin.tar.gz"
      sha256 "5d63fba1baa3a9afd3bc142e81b42efd754ce990531bd3dce924bc18bb80cf0c"
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
