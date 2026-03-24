class K11s < Formula
  desc "Speed-first CLI/TUI for Kubernetes navigation and operations"
  homepage "https://github.com/daulet/k11s"
  license "MIT"
  version "0.1.1"

  on_macos do
    on_intel do
      url "https://github.com/daulet/k11s/releases/download/v0.1.1/k11s-x86_64-apple-darwin.tar.gz"
      sha256 "60904ab7e6738ac35df8bc2901fea17d5446be1d8e4d175b312790ce860fb3ae"
    end
    on_arm do
      url "https://github.com/daulet/k11s/releases/download/v0.1.1/k11s-aarch64-apple-darwin.tar.gz"
      sha256 "2b2d122ee6ca6aa7a2f13252b6798982935840a28549683d21758a01ce66ca25"
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
