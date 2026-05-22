class Codex < Formula
  desc "AI coding assistant fork with persistent tree and side conversations"
  homepage "https://github.com/daulet/codex"
  license "Apache-2.0"

  depends_on "ripgrep"

  on_macos do
    on_intel do
      url "https://github.com/daulet/codex/releases/download/rust-v0.133.0/codex-x86_64-apple-darwin.tar.gz"
      sha256 "ced125037152d40928df089b2718b09a47968dcefe83bfc85eef77c1511cc8a6"
    end
    on_arm do
      url "https://github.com/daulet/codex/releases/download/rust-v0.133.0/codex-aarch64-apple-darwin.tar.gz"
      sha256 "907d073e39f3593b6c25ffbb55983e0ad693cc713558ebe1456164ce124d6e6d"
    end
  end

  def install
    bin.install "codex"
  end

  test do
    assert_match "codex", shell_output("#{bin}/codex --version")
  end
end
