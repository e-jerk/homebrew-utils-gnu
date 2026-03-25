class Find < Formula
  desc "GPU-accelerated find with all backends (Metal + Vulkan on macOS, Vulkan on Linux)"
  homepage "https://github.com/e-jerk/find"
  version "0.2.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/e-jerk/find/releases/download/v#{version}/find-gnu-macos-arm64-v#{version}.tar.gz"
      sha256 "b8b42a7dbebadedb8fee015d2122bee92f95070a8091ddb803cd3a65f1cc4117" # macos-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/e-jerk/find/releases/download/v#{version}/find-gnu-linux-arm64-v#{version}.tar.gz"
      sha256 "7ac1604e3694fe6da2fd30b6b6909b4b68f1a59326801390fd9aa6a0c029d1c2" # linux-arm64
    end
    on_intel do
      url "https://github.com/e-jerk/find/releases/download/v#{version}/find-gnu-linux-amd64-v#{version}.tar.gz"
      sha256 "f8f2b989deaae113eff9f6284a30752a4105d040f795bc01adafaedcae49b95e" # linux-amd64
    end
    depends_on "vulkan-loader"
  end

  depends_on "molten-vk" => :recommended if OS.mac?

  def install
    bin.install "find"
  end

  test do
    system "#{bin}/find", "--help"
  end
end
