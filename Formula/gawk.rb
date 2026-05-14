class Gawk < Formula
  desc "GPU-accelerated gawk with all backends (Metal + Vulkan on macOS, Vulkan on Linux)"
  homepage "https://github.com/e-jerk/gawk"
  version "0.5.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/e-jerk/gawk/releases/download/v#{version}/gawk-gnu-macos-arm64-v#{version}.tar.gz"
      sha256 "2312de474c411cffdd028b190418139c3e941759bda1b5f868fbea243d611a7f" # macos-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/e-jerk/gawk/releases/download/v#{version}/gawk-gnu-linux-arm64-v#{version}.tar.gz"
      sha256 "69b646eca612e154d9dffb30f1f20294cefbe10003f97c0644582d7d6c3a3618" # linux-arm64
    end
    on_intel do
      url "https://github.com/e-jerk/gawk/releases/download/v#{version}/gawk-gnu-linux-amd64-v#{version}.tar.gz"
      sha256 "543aba15769b01e4fb5ada7aed4137b6d0b14c54b8653d49a7c599908f1a2230" # linux-amd64
    end
    depends_on "vulkan-loader"
  end

  depends_on "molten-vk" => :recommended if OS.mac?

  def install
    bin.install "gawk"
  end

  test do
    system "#{bin}/gawk", "--help"
  end
end
