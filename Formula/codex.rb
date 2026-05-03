class Codex < Formula
  desc "AI coding assistant fork with persistent tree and side conversations"
  homepage "https://github.com/daulet/codex"
  license "Apache-2.0"

  depends_on "ripgrep"

  on_macos do
    on_intel do
      url "https://github.com/daulet/codex/releases/download/v0.128.0/codex-x86_64-apple-darwin.tar.gz"
      sha256 "385d88a21a73e3f58b9d806f3ff9d65bb8145ef4058bbd470524fa49a2fdca65"
    end
    on_arm do
      url "https://github.com/daulet/codex/releases/download/v0.128.0/codex-aarch64-apple-darwin.tar.gz"
      sha256 "31fbe9733c1d43b068a37a125433d243d9a8efb9078a6d22d61b71c7cfa1b599"
    end
  end

  def install
    bin.install "codex"
  end

  test do
    assert_match "codex", shell_output("#{bin}/codex --version")
  end
end
