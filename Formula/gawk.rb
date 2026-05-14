class Gawk < Formula
  desc "GPU-accelerated gawk with all backends (Metal + Vulkan on macOS, Vulkan on Linux)"
  homepage "https://github.com/e-jerk/gawk"
  version "0.4.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/e-jerk/gawk/releases/download/v#{version}/gawk-gnu-macos-arm64-v#{version}.tar.gz"
      sha256 "d05110f8d7b46e075fc34f1ac49e904013992f3d7d071687c73993bcef168365" # macos-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/e-jerk/gawk/releases/download/v#{version}/gawk-gnu-linux-arm64-v#{version}.tar.gz"
      sha256 "dd9063bf9e78dbfdbbde5c6e01c5aef4f6ebd1729f50cc3b1f94c7e26236dc58" # linux-arm64
    end
    on_intel do
      url "https://github.com/e-jerk/gawk/releases/download/v#{version}/gawk-gnu-linux-amd64-v#{version}.tar.gz"
      sha256 "9583e475f9765c029a1d0473125c1f1869255bc0f0949bec054c4f613285ac63" # linux-amd64
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
