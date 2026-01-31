class Reviewer < Formula
  desc "TUI for reviewing GitHub PRs across multiple repositories with Claude Code integration"
  homepage "https://github.com/daulet/reviewer"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/reviewer/releases/download/v#{version}/reviewer-x86_64-apple-darwin.tar.gz"
      sha256 "f573599164bd932b4feaa16ef49018469230fb9d143e8223dbf6b60e4b8fc719"
    end
    on_arm do
      url "https://github.com/daulet/reviewer/releases/download/v#{version}/reviewer-aarch64-apple-darwin.tar.gz"
      sha256 "9566f10c6df1e8b7a3700c7e0216febbf1cfb6ec8c646ea7ff3e887ab4d751f3"
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
