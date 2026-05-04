class Codex < Formula
  desc "AI coding assistant fork with persistent tree and side conversations"
  homepage "https://github.com/daulet/codex"
  license "Apache-2.0"

  depends_on "ripgrep"

  on_macos do
    on_intel do
      url "https://github.com/daulet/codex/releases/download/v0.128.2/codex-x86_64-apple-darwin.tar.gz"
      sha256 "e632fd5148958fd515d380e7f4f2456bde2c7d350d084d69ac5028fda7b822be"
    end
    on_arm do
      url "https://github.com/daulet/codex/releases/download/v0.128.2/codex-aarch64-apple-darwin.tar.gz"
      sha256 "7e141e49181088328180d3682e15010f32d53df88d53e10d91149385f062dbbf"
    end
  end

  def install
    bin.install "codex"
  end

  test do
    assert_match "codex", shell_output("#{bin}/codex --version")
  end
end
