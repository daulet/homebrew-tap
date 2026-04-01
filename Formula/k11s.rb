class K11s < Formula
  desc "Speed-first CLI/TUI for Kubernetes navigation and operations"
  homepage "https://github.com/daulet/k11s"
  license "MIT"
  version "0.2.0"

  on_macos do
    on_intel do
      url "https://github.com/daulet/k11s/releases/download/v0.2.0/k11s-x86_64-apple-darwin.tar.gz"
      sha256 "f8af624033974448aa214f830ac5c500d2f5f10b5639edd06959142665e7b2bc"
    end
    on_arm do
      url "https://github.com/daulet/k11s/releases/download/v0.2.0/k11s-aarch64-apple-darwin.tar.gz"
      sha256 "be9ef2df248ceeef91d06a22bd4912e005191402e7a16d600812e15cf17ca311"
    end
  end

  def install
    libexec.install "k11s", "k11sd"
    (bin/"k11s").write_env_script libexec/"k11s", K11SD_PATH: libexec/"k11sd"
  end

  test do
    assert_path_exists bin/"k11s"
    assert_path_exists libexec/"k11sd"
  end
end
