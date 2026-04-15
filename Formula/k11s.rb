class K11s < Formula
  desc "Speed-first CLI/TUI for Kubernetes navigation and operations"
  homepage "https://github.com/daulet/k11s"
  license "MIT"
  version "0.2.2"

  on_macos do
    on_intel do
      url "https://github.com/daulet/k11s/releases/download/v0.2.2/k11s-x86_64-apple-darwin.tar.gz"
      sha256 "1ae41f63006ec58a51487b9de73c297de4fa521c7f5dfb279d30e3d62b0b0c5f"
    end
    on_arm do
      url "https://github.com/daulet/k11s/releases/download/v0.2.2/k11s-aarch64-apple-darwin.tar.gz"
      sha256 "4cd0624f528fd2cc4e750915033c5505c45ab1432797e5ed088d529bdf339ede"
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
