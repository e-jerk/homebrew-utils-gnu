class Gawk < Formula
  desc "GPU-accelerated gawk with all backends (Metal + Vulkan on macOS, Vulkan on Linux)"
  homepage "https://github.com/e-jerk/gawk"
  version "0.2.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/e-jerk/gawk/releases/download/v#{version}/gawk-gnu-macos-arm64-v#{version}.tar.gz"
      sha256 "14948f7377f323477c7789d021523bacbcfacef4c6d677692475adf6f448e250" # macos-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/e-jerk/gawk/releases/download/v#{version}/gawk-gnu-linux-arm64-v#{version}.tar.gz"
      sha256 "6f299083fd14cc2edaa12e4940f996e529fa1937ad9638e561dbc5b688b68550" # linux-arm64
    end
    on_intel do
      url "https://github.com/e-jerk/gawk/releases/download/v#{version}/gawk-gnu-linux-amd64-v#{version}.tar.gz"
      sha256 "08e65a721c971867af3620b25997ba8deb65d43e0165561ce8b54263e03d40c8" # linux-amd64
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
