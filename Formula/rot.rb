class Rot < Formula
  desc "Fast, Rust-aware source metrics"
  homepage "https://github.com/daulet/rot"
  version "0.1.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/daulet/rot/releases/download/v0.1.2/rot-metrics-aarch64-apple-darwin.tar.gz"
      sha256 "14c5c32b569f8134b44e70175980719c7c29fc85cecd93fab898722a42fbaa5d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/daulet/rot/releases/download/v0.1.2/rot-metrics-x86_64-apple-darwin.tar.gz"
      sha256 "552dc2cdf5633fb872d7c48e50c887442899179d944506f93e3ee6760a74c0b4"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/daulet/rot/releases/download/v0.1.2/rot-metrics-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7a3ab086620d65211d7039051074f5b8490cfee1bdf02acc758033b7d4c58dcc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/daulet/rot/releases/download/v0.1.2/rot-metrics-x86_64-unknown-linux-musl.tar.gz"
      sha256 "412bc94784d9c3111213aeb213e2d504270703701b45770de2277725847bb796"
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
