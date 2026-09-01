class Rot < Formula
  desc "Fast, Rust-aware source metrics"
  homepage "https://github.com/daulet/rot"
  version "0.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/daulet/rot/releases/download/v0.1.1/rot-metrics-aarch64-apple-darwin.tar.gz"
      sha256 "cffa67285be55551fcbbd654def93908684f6abf48ba83e5d8fa1b1cd857f476"
    end
    if Hardware::CPU.intel?
      url "https://github.com/daulet/rot/releases/download/v0.1.1/rot-metrics-x86_64-apple-darwin.tar.gz"
      sha256 "f416fc8ccaa0cb3443969c99fce3f7bfa23eb2655261690c128c02259c8b0e06"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/daulet/rot/releases/download/v0.1.1/rot-metrics-aarch64-unknown-linux-musl.tar.gz"
      sha256 "90817de16f47268fd9b310852fa445331a2cf4967e29fd114dff8396a41cce56"
    end
    if Hardware::CPU.intel?
      url "https://github.com/daulet/rot/releases/download/v0.1.1/rot-metrics-x86_64-unknown-linux-musl.tar.gz"
      sha256 "508c95bf2dd07644c6240a7e89eaa47e06325bc2ce957bd6091017ec23f7eebd"
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
