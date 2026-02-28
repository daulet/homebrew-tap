class Maestro < Formula
  desc "Stateless tmux-first session manager for interactive CLI agents"
  homepage "https://github.com/daulet/maestro"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/maestro/releases/download/v0.1.1/maestro-x86_64-apple-darwin.tar.gz"
      sha256 "ad74147e7fe4cab6729517667c244c5eabda1b402ed04255827c80415d39f8be"
    end
    on_arm do
      url "https://github.com/daulet/maestro/releases/download/v0.1.1/maestro-aarch64-apple-darwin.tar.gz"
      sha256 "49a4a717bbda420ddd27c43d75d4b6a0e92de5058f1cfce9f61a2bd1831d540e"
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
