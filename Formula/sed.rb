class Sed < Formula
  desc "GPU-accelerated sed with all backends (Metal + Vulkan on macOS, Vulkan on Linux)"
  homepage "https://github.com/e-jerk/sed"
  version "0.5.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/e-jerk/sed/releases/download/v#{version}/sed-gnu-macos-arm64-v#{version}.tar.gz"
      sha256 "e8920042e3cc7f2c31965fd48af9e03a4088524b3fbc95968ef8df0461ee4aab" # macos-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/e-jerk/sed/releases/download/v#{version}/sed-gnu-linux-arm64-v#{version}.tar.gz"
      sha256 "4e1b09390099c9b3b3b5d1428f72e518118776af8aa87a2fd72d8fe4b3f53b9e" # linux-arm64
    end
    on_intel do
      url "https://github.com/e-jerk/sed/releases/download/v#{version}/sed-gnu-linux-amd64-v#{version}.tar.gz"
      sha256 "b3d98d524e866fbf91ce9954db2d2e8e0e7cecf9eca76de8691afdc4b3c19754" # linux-amd64
    end
    depends_on "vulkan-loader"
  end

  depends_on "molten-vk" => :recommended if OS.mac?

  def install
    bin.install "sed"
  end

  test do
    system "#{bin}/sed", "--help"
  end
end
