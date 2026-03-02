class Maestro < Formula
  desc "Stateless tmux-first session manager for interactive CLI agents"
  homepage "https://github.com/daulet/maestro"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/maestro/releases/download/v0.1.3/maestro-x86_64-apple-darwin.tar.gz"
      sha256 "8f9a399ac580c004553ea34410ce6a57563b272a83907ae8767d3b53fb65f23a"
    end
    on_arm do
      url "https://github.com/daulet/maestro/releases/download/v0.1.3/maestro-aarch64-apple-darwin.tar.gz"
      sha256 "3e7e1cb3c8848db27a4bfba2e9133ee9b621f2f1cfc59b310bd908b133d6cfc0"
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
