class Codex < Formula
  desc "AI coding assistant fork with persistent tree and side conversations"
  homepage "https://github.com/daulet/codex"
  license "Apache-2.0"

  depends_on "ripgrep"

  on_macos do
    on_intel do
      url "https://github.com/daulet/codex/releases/download/rust-v0.128.4/codex-x86_64-apple-darwin.tar.gz"
      sha256 "059673d57824053a78414fe94bc8921c9682a75bc5a007208d1003cc8dfff6d0"
    end
    on_arm do
      url "https://github.com/daulet/codex/releases/download/rust-v0.128.4/codex-aarch64-apple-darwin.tar.gz"
      sha256 "170d71e2978e845efea30bd6c8396b9909121d6459dcaa9ceeb14e81fcc72c2c"
    end
  end

  def install
    bin.install "codex"
  end

  test do
    assert_match "codex", shell_output("#{bin}/codex --version")
  end
end
