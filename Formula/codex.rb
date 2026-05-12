class Codex < Formula
  desc "AI coding assistant fork with persistent tree and side conversations"
  homepage "https://github.com/daulet/codex"
  license "Apache-2.0"

  depends_on "ripgrep"

  on_macos do
    on_intel do
      url "https://github.com/daulet/codex/releases/download/rust-v0.130.0/codex-x86_64-apple-darwin.tar.gz"
      sha256 "cbc8ab1b1b540fe289c349acc3b0089a0e6505b57a1f89d00e740b778e92b1e4"
    end
    on_arm do
      url "https://github.com/daulet/codex/releases/download/rust-v0.130.0/codex-aarch64-apple-darwin.tar.gz"
      sha256 "ea8f96fa610211809d6e361d806bf07bee43576f4fa486c11aa8e0718b46e113"
    end
  end

  def install
    bin.install "codex"
  end

  test do
    assert_match "codex", shell_output("#{bin}/codex --version")
  end
end
