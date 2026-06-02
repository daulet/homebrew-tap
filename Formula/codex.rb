class Codex < Formula
  desc "AI coding assistant fork with persistent tree and side conversations"
  homepage "https://github.com/daulet/codex"
  license "Apache-2.0"

  depends_on "ripgrep"

  on_macos do
    on_intel do
      url "https://github.com/daulet/codex/releases/download/rust-v0.136.2/codex-x86_64-apple-darwin.tar.gz"
      sha256 "3a947c509cb1fb25074836a02d0af5ff8745ae36176468f688746a769db8a2c8"
    end
    on_arm do
      url "https://github.com/daulet/codex/releases/download/rust-v0.136.2/codex-aarch64-apple-darwin.tar.gz"
      sha256 "d926288fe6d85ea80ba0b2790084b028b7e94f6dbf44f7ec7e1c6c166f49a229"
    end
  end

  def install
    bin.install "codex"
  end

  test do
    assert_match "codex", shell_output("#{bin}/codex --version")
  end
end
