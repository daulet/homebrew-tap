class Reviewer < Formula
  desc "TUI for reviewing GitHub PRs across multiple repositories with Claude Code integration"
  homepage "https://github.com/daulet/reviewer"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/reviewer/releases/download/v#{version}/reviewer-x86_64-apple-darwin.tar.gz"
      sha256 "f3323b6d5c5595a262ebb10f66bf83daf699105f8c73ca95122d9375625bbe46"
    end
    on_arm do
      url "https://github.com/daulet/reviewer/releases/download/v#{version}/reviewer-aarch64-apple-darwin.tar.gz"
      sha256 "81434e29d6eca5cb3016d3514cb1448fab74bf215126e95583f622719c8c212a"
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
