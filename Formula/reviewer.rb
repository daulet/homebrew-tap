class Reviewer < Formula
  desc "TUI for reviewing GitHub PRs with Claude Code/Codex integration"
  homepage "https://github.com/daulet/reviewer"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/reviewer/releases/download/v0.3.0/reviewer-x86_64-apple-darwin.tar.gz"
      sha256 "a554e5c1e2d87a545ecb5145b815b53aa2dbf0f9cd4a99921aa510584a9f24fe"
    end
    on_arm do
      url "https://github.com/daulet/reviewer/releases/download/v0.3.0/reviewer-aarch64-apple-darwin.tar.gz"
      sha256 "35ed0566701bfdf3e81e9427709ece24ff83a74702d1272c3d900b6cf3793e22"
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
