class Reviewer < Formula
  desc "TUI for reviewing GitHub PRs across multiple repositories with Claude Code integration"
  homepage "https://github.com/daulet/reviewer"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/reviewer/releases/download/v#{version}/reviewer-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_SHA256_X86"
    end
    on_arm do
      url "https://github.com/daulet/reviewer/releases/download/v#{version}/reviewer-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_SHA256_ARM"
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

      For Claude Code integration, ensure Claude CLI is installed:
        npm install -g @anthropic-ai/claude-code

      Optional: Install the code-review skill for enhanced reviews:
        mkdir -p ~/.claude/skills/code-review
        # Copy SKILL.md from the repository to ~/.claude/skills/code-review/
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/reviewer --version")
  end
end
