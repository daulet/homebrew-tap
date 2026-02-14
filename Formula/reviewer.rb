class Reviewer < Formula
  desc "TUI for reviewing GitHub PRs with Claude Code/Codex integration"
  homepage "https://github.com/daulet/reviewer"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/reviewer/releases/download/v0.2.2/reviewer-x86_64-apple-darwin.tar.gz"
      sha256 "0bfe33ede300efd834c0c33874277c828ec63208bdc9cb87ccada048837a6b35"
    end
    on_arm do
      url "https://github.com/daulet/reviewer/releases/download/v0.2.2/reviewer-aarch64-apple-darwin.tar.gz"
      sha256 "c4e2c8eb8db94d39b3efd830836c5ec95c3d1292953131fd956580cb0fe6d6a6"
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
