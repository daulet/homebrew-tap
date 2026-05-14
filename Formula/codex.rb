class Codex < Formula
  desc "AI coding assistant fork with persistent tree and side conversations"
  homepage "https://github.com/daulet/codex"
  license "Apache-2.0"

  depends_on "ripgrep"

  on_macos do
    on_intel do
      url "https://github.com/daulet/codex/releases/download/rust-v0.130.2/codex-x86_64-apple-darwin.tar.gz"
      sha256 "fe958f478b3b51320d2ff246309b59da2886fff93da8acb4866c9ef20d27e272"
    end
    on_arm do
      url "https://github.com/daulet/codex/releases/download/rust-v0.130.2/codex-aarch64-apple-darwin.tar.gz"
      sha256 "b2b64fd203867842e9e7bf9a4ce55e61451d1a9830743bee4a34b4445c0011bc"
    end
  end

  def install
    bin.install "codex"
  end

  test do
    assert_match "codex", shell_output("#{bin}/codex --version")
  end
end
