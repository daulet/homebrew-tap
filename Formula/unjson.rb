class Unjson < Formula
  desc "Format newline-delimited JSON logs into readable key=value output"
  homepage "https://github.com/daulet/unjson"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/daulet/unjson/releases/download/v0.1.0/unjson-darwin-x86_64"
      sha256 "9e12c422d6c5f0a261bab3f5ba41a0cd17f17ad98d477136cbabf07028b83872"
    end
    on_arm do
      url "https://github.com/daulet/unjson/releases/download/v0.1.0/unjson-darwin-aarch64"
      sha256 "3e5a0e202c558dc5d15c8cd66c1148ce09530b291e7175dff3a6cbeb0349d19e"
    end
  end

  def install
    if Hardware::CPU.intel?
      bin.install "unjson-darwin-x86_64" => "unjson"
    else
      bin.install "unjson-darwin-aarch64" => "unjson"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/unjson --version").strip
  end
end
