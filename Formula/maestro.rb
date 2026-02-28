class Maestro < Formula
  desc "Stateless tmux-first session manager for interactive CLI agents"
  homepage "https://github.com/daulet/maestro"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/maestro/releases/download/v0.1.0/maestro-x86_64-apple-darwin.tar.gz"
      sha256 "8a016fdb6fefd1af37dd7f33a261e52fbf8918b3f6f51432d88efb8bf3cac4dc"
    end
    on_arm do
      url "https://github.com/daulet/maestro/releases/download/v0.1.0/maestro-aarch64-apple-darwin.tar.gz"
      sha256 "df4696167b94cddf0b7bca12e13edbca2ad186e261ca0a545f36c1081eef8437"
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
