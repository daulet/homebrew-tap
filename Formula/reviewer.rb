class Reviewer < Formula
  desc "TUI for reviewing GitHub PRs with Claude Code/Codex integration"
  homepage "https://github.com/daulet/reviewer"
  license "MIT"
  version "0.5.3"

  on_macos do
    on_intel do
      url "https://github.com/daulet/reviewer/releases/download/v0.5.3/reviewer-x86_64-apple-darwin.tar.gz"
      sha256 "e4f13ecdd44d89e46e54afbb36bc659583e5f2da54f61b78fb6994a2eef311fa"
    end
    on_arm do
      url "https://github.com/daulet/reviewer/releases/download/v0.5.3/reviewer-aarch64-apple-darwin.tar.gz"
      sha256 "4e189ba4376ff6f357e5966d6cb21ac4f52b58514355037abd2bb5824185d81d"
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
