class Unjson < Formula
  desc "Format newline-delimited JSON logs into readable key=value output"
  homepage "https://github.com/daulet/unjson"
  license "MIT"
  version "0.1.1"

  on_macos do
    on_intel do
      url "https://github.com/daulet/unjson/releases/download/v0.1.1/unjson-x86_64-apple-darwin.tar.gz"
      sha256 "7dca790272a37e276b62bc65c1fa5e7e45fdd8cf98e02c74134012517df31be6"
    end
    on_arm do
      url "https://github.com/daulet/unjson/releases/download/v0.1.1/unjson-aarch64-apple-darwin.tar.gz"
      sha256 "8626b75465a5c5419a614f7fa72ddb3c3810a958e89e0bccc35260b6820a33ff"
    end
  end

  def install
    bin.install "unjson"
  end

  test do
    assert_path_exists bin/"unjson"
  end
end
