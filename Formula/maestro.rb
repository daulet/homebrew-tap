class Maestro < Formula
  desc "Stateless tmux-first session manager for interactive CLI agents"
  homepage "https://github.com/daulet/maestro"
  license "MIT"
  version "0.1.7"

  on_macos do
    on_intel do
      url "https://github.com/daulet/maestro/releases/download/v0.1.7/maestro-x86_64-apple-darwin.tar.gz"
      sha256 "5a3b90b5c96d03ae4cea49e641750d86945cc3e7069cfe9593766416351e53e6"
    end
    on_arm do
      url "https://github.com/daulet/maestro/releases/download/v0.1.7/maestro-aarch64-apple-darwin.tar.gz"
      sha256 "7284164cc27d03a29423c500b00f91e7c749600733d0a9b2fd1a41c0b8444e71"
    end
  end

  def install
    bin.install "maestro"
  end

  def caveats
    <<~EOS
      maestro requires tmux to manage sessions:
        brew install tmux

      Optional: for metadata correlation and interactive workflows:
        npm install -g @openai/codex
        npm install -g @anthropic-ai/claude-code
    EOS
  end

  test do
    assert_path_exists bin/"maestro"
  end
end
