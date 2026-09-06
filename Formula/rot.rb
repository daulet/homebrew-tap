class Rot < Formula
  desc "Fast, Rust-aware source metrics"
  homepage "https://github.com/daulet/rot"
  version "0.1.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/daulet/rot/releases/download/v0.1.4/rot-metrics-aarch64-apple-darwin.tar.gz"
      sha256 "6c95284c9672886e0e6b48c30f7b17852f622e8692b6dd60d409bbdc50b967b4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/daulet/rot/releases/download/v0.1.4/rot-metrics-x86_64-apple-darwin.tar.gz"
      sha256 "2127a3f0af6147a791b058e83dc9ed45096a87db09ed90d3c9aa484b1e510e59"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/daulet/rot/releases/download/v0.1.4/rot-metrics-aarch64-unknown-linux-musl.tar.gz"
      sha256 "938998e6f0d51d1aca64e43a01c63fa4e9f435b4ba1e4947e7da952cc212fae1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/daulet/rot/releases/download/v0.1.4/rot-metrics-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9bf4aace3b361d5b91a13cd812c671e2e5b115c9aeb36d526ab0153298f0c5b1"
    end
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "aarch64-unknown-linux-musl-dynamic": {},
    "aarch64-unknown-linux-musl-static": {},
    "x86_64-apple-darwin": {},
    "x86_64-unknown-linux-gnu": {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static": {}
  }

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "rot"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "rot"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "rot"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "rot"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
