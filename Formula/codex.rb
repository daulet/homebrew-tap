class Codex < Formula
  desc "AI coding assistant fork with persistent tree and side conversations"
  homepage "https://github.com/daulet/codex"
  license "Apache-2.0"

  depends_on "ripgrep"

  on_macos do
    on_intel do
      url "https://github.com/daulet/codex/releases/download/rust-v0.129.0/codex-x86_64-apple-darwin.tar.gz"
      sha256 "708999359a6a710e52a43ca0f66171341ed65de81a76e762583e2902ff575568"
    end
    on_arm do
      url "https://github.com/daulet/codex/releases/download/rust-v0.129.0/codex-aarch64-apple-darwin.tar.gz"
      sha256 "78c7cdc3b61b59515fa7813d4113e0228d745c983c2ed18f5bf10c96cf5a133f"
    end
  end

  def install
    bin.install "codex"
  end

  test do
    assert_match "codex", shell_output("#{bin}/codex --version")
  end
end
