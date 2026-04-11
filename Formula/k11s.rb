class K11s < Formula
  desc "Speed-first CLI/TUI for Kubernetes navigation and operations"
  homepage "https://github.com/daulet/k11s"
  license "MIT"
  version "0.2.1"

  on_macos do
    on_intel do
      url "https://github.com/daulet/k11s/releases/download/v0.2.1/k11s-x86_64-apple-darwin.tar.gz"
      sha256 "b8fd8ef7a72d031eff884941b51610af01e7b3d236075a9fb172e019745c3eb8"
    end
    on_arm do
      url "https://github.com/daulet/k11s/releases/download/v0.2.1/k11s-aarch64-apple-darwin.tar.gz"
      sha256 "d0852538d28915b1f168412f43cd419da27942d9d2adbadebeca81d0caad406d"
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
