class Unjson < Formula
  desc "Format newline-delimited JSON logs into readable key=value output"
  homepage "https://github.com/daulet/unjson"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/unjson/releases/download/v0.1.2/unjson-x86_64-apple-darwin.tar.gz"
      sha256 "626bcf2abf957dc67369b538f1bbf3f50c5e01029c3cad62d57e8b70271909a5"
    end
    on_arm do
      url "https://github.com/daulet/unjson/releases/download/v0.1.2/unjson-aarch64-apple-darwin.tar.gz"
      sha256 "723bead7575dba81def12df9cd478d319bb3682cd0154a9bc94a540e78071487"
    end
  end

  def install
    bin.install "unjson"
  end

  test do
    assert_path_exists bin/"unjson"
  end
end
