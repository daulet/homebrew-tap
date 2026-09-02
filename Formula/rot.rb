class Rot < Formula
  desc "Fast, Rust-aware source metrics"
  homepage "https://github.com/daulet/rot"
  version "0.1.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/daulet/rot/releases/download/v0.1.3/rot-metrics-aarch64-apple-darwin.tar.gz"
      sha256 "ae6b2aacb1ed920fa26a7a361ffcf1e7ed2682131ae70f58b160c1995ae08d0e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/daulet/rot/releases/download/v0.1.3/rot-metrics-x86_64-apple-darwin.tar.gz"
      sha256 "2323948dc3af93fe3f680a2e805d88d46a67bdbb4608f435ab0e384c796a2401"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/daulet/rot/releases/download/v0.1.3/rot-metrics-aarch64-unknown-linux-musl.tar.gz"
      sha256 "29fb6ca269b323d00bdbe230ac339e7d2588969f82d2c9edfdddffc125b104ad"
    end
    if Hardware::CPU.intel?
      url "https://github.com/daulet/rot/releases/download/v0.1.3/rot-metrics-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a431e4b4ed2c747049ba4ab6397553d3f584ded45504bdf28d10997642568906"
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
