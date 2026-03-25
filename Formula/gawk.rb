class Gawk < Formula
  desc "GPU-accelerated gawk with all backends (Metal + Vulkan on macOS, Vulkan on Linux)"
  homepage "https://github.com/e-jerk/gawk"
  version "0.1.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/e-jerk/gawk/releases/download/v#{version}/gawk-gnu-macos-arm64-v#{version}.tar.gz"
      sha256 "839c135ac2a8db0a46cda9e7c35defd51c231a5c1da862058398dc617a9a852a" # macos-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/e-jerk/gawk/releases/download/v#{version}/gawk-gnu-linux-arm64-v#{version}.tar.gz"
      sha256 "b5f84a4945d787efffa70758924d859fa5b3c4fe356d397b05fae16589759b89" # linux-arm64
    end
    on_intel do
      url "https://github.com/e-jerk/gawk/releases/download/v#{version}/gawk-gnu-linux-amd64-v#{version}.tar.gz"
      sha256 "fba0d9b670727f044fd7425537e2d90dc16f1629c3c879f24807aa694e6dcd14" # linux-amd64
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
