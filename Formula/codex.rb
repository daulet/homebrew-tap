class Codex < Formula
  desc "AI coding assistant fork with persistent tree and side conversations"
  homepage "https://github.com/daulet/codex"
  license "Apache-2.0"

  depends_on "ripgrep"

  on_macos do
    on_intel do
      url "https://github.com/daulet/codex/releases/download/codex-v0.130.0/codex-x86_64-apple-darwin.tar.gz"
      sha256 "4e728dd283842e61d62ee8ca334e65f9b101ed2e6d85b793ae2f821c845ca390"
    end
    on_arm do
      url "https://github.com/daulet/codex/releases/download/codex-v0.130.0/codex-aarch64-apple-darwin.tar.gz"
      sha256 "45d78e13591240b38fab811938bf1807cf73d0d76a4f1f0fdfa7309a21105f5b"
    end
  end

  def install
    bin.install "codex"
  end

  test do
    assert_match "codex", shell_output("#{bin}/codex --version")
  end
end
