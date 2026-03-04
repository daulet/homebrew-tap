class Maestro < Formula
  desc "Stateless tmux-first session manager for interactive CLI agents"
  homepage "https://github.com/daulet/maestro"
  license "MIT"
  version "0.1.5"

  on_macos do
    on_intel do
      url "https://github.com/daulet/maestro/releases/download/v0.1.5/maestro-x86_64-apple-darwin.tar.gz"
      sha256 "029d88b315e7f430e457340927df465ab14da9740a6a94926601743faf168d2e"
    end
    on_arm do
      url "https://github.com/daulet/maestro/releases/download/v0.1.5/maestro-aarch64-apple-darwin.tar.gz"
      sha256 "8ecab690463263e7a97d0af77fee8af5043d064d7d4fb61f797d8203b2a87f74"
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
