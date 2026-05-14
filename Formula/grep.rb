class Grep < Formula
  desc "GPU-accelerated grep with all backends (Metal + Vulkan on macOS, Vulkan on Linux)"
  homepage "https://github.com/e-jerk/grep"
  version "0.4.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/e-jerk/grep/releases/download/v#{version}/grep-gnu-macos-arm64-v#{version}.tar.gz"
      sha256 "912be1a3a2e144563d8a95efdf8251f875b11b071fd9aaf40269c9223f785f5c" # macos-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/e-jerk/grep/releases/download/v#{version}/grep-gnu-linux-arm64-v#{version}.tar.gz"
      sha256 "ad08e7f87e467b8f551942fe36497041b236690bad66a67538cac9b8d8bdfa80" # linux-arm64
    end
    on_intel do
      url "https://github.com/e-jerk/grep/releases/download/v#{version}/grep-gnu-linux-amd64-v#{version}.tar.gz"
      sha256 "7556fbea1ff17efa6cba66187ac587cfd362b3fee6c705cf33d94a7d05056a83" # linux-amd64
    end
    depends_on "vulkan-loader"
  end

  depends_on "molten-vk" => :recommended if OS.mac?

  def install
    bin.install "grep"
  end

  test do
    system "#{bin}/grep", "--help"
  end
end
