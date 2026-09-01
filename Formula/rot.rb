class Rot < Formula
  desc "Fast, configuration-aware Rust source metrics"
  homepage "https://github.com/daulet/rot"
  license "Apache-2.0"
  depends_on :macos

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/daulet/rot/releases/download/v0.1.0/rot-x86_64-apple-darwin.tar.gz"
      sha256 "0214f20398e69acc8871d0564e53021ce808ffe3d1735843c4569d05193245ef"
    else
      url "https://github.com/daulet/rot/releases/download/v0.1.0/rot-aarch64-apple-darwin.tar.gz"
      sha256 "a7a82f6a65e4d535688c7e3183d8159d015f1aaa54cfaa85e1a709c4edb93191"
    end
  end

  def install
    bin.install "rot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rot --version")
  end
end
