class Coach < Formula
  desc "Conflict-aware skill sync for Codex and Claude Code"
  homepage "https://github.com/daulet/skills"
  version "0.1.0"

  on_macos do
    on_intel do
      url "https://github.com/daulet/skills/releases/download/v0.1.0/coach-x86_64-apple-darwin.tar.gz"
      sha256 "444fd1194ef67146587681710616a578d213bc493789adc0b66bb4680a1c2c43"
    end
    on_arm do
      url "https://github.com/daulet/skills/releases/download/v0.1.0/coach-aarch64-apple-darwin.tar.gz"
      sha256 "821964e1b6affb0b67dd9b6e78d61918cc71c410de6dca94ccba294f3b4ffcd6"
    end
  end

  head "https://github.com/daulet/skills.git", branch: "main"

  head do
    depends_on "rust" => :build
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "coach"
    end
  end

  test do
    assert_match "coach", shell_output("#{bin}/coach --help")
  end
end
