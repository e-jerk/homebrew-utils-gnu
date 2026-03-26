class Find < Formula
  desc "GPU-accelerated find with all backends (Metal + Vulkan on macOS, Vulkan on Linux)"
  homepage "https://github.com/e-jerk/find"
  version "0.2.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/e-jerk/find/releases/download/v#{version}/find-gnu-macos-arm64-v#{version}.tar.gz"
      sha256 "588330be05ac4a37525f0658748f0446aff2102025b3d5677ab274b2f1248e50" # macos-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/e-jerk/find/releases/download/v#{version}/find-gnu-linux-arm64-v#{version}.tar.gz"
      sha256 "21ffb334891974fbafdbcd9aaeeb0d1d1a06645cf5ac091270d7257e29bd2eac" # linux-arm64
    end
    on_intel do
      url "https://github.com/e-jerk/find/releases/download/v#{version}/find-gnu-linux-amd64-v#{version}.tar.gz"
      sha256 "df800307178c3aa6e841787c2f3ee4056c8d8e8e1b3963b1ee208fb1f6fe0dc0" # linux-amd64
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
