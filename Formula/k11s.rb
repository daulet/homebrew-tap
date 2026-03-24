class K11s < Formula
  desc "Speed-first CLI/TUI for Kubernetes navigation and operations"
  homepage "https://github.com/daulet/k11s"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_intel do
      url "https://github.com/daulet/k11s/releases/download/v0.1.0/k11s-x86_64-apple-darwin.tar.gz"
      sha256 "e11b0a18d22bbb50e54ee8b712c934e081b6ae6396b5c95f1c16c895855eaf1a"
    end
    on_arm do
      url "https://github.com/daulet/k11s/releases/download/v0.1.0/k11s-aarch64-apple-darwin.tar.gz"
      sha256 "880f818bec64bf35762cb536a660ac64cc5f1da4addd30774cb6c247efebdae9"
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
