class Maestro < Formula
  desc "Stateless tmux-first session manager for interactive CLI agents"
  homepage "https://github.com/daulet/maestro"
  license "MIT"
  version "0.1.6"

  on_macos do
    on_intel do
      url "https://github.com/daulet/maestro/releases/download/v0.1.6/maestro-x86_64-apple-darwin.tar.gz"
      sha256 "33a0c2f924c895b68206ea2a5607f7c456486e4c758c51b0f7e8621f1a3aa82e"
    end
    on_arm do
      url "https://github.com/daulet/maestro/releases/download/v0.1.6/maestro-aarch64-apple-darwin.tar.gz"
      sha256 "b962bc0cb2356f172438b661689263128645b8177f5dc3eac11b5154b049a197"
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
