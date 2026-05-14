class Find < Formula
  desc "GPU-accelerated find with all backends (Metal + Vulkan on macOS, Vulkan on Linux)"
  homepage "https://github.com/e-jerk/find"
  version "0.5.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/e-jerk/find/releases/download/v#{version}/find-gnu-macos-arm64-v#{version}.tar.gz"
      sha256 "7585c1c2bf41ef45cc071034d912455d948996523d68c4f8644e7a6e4014a823" # macos-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/e-jerk/find/releases/download/v#{version}/find-gnu-linux-arm64-v#{version}.tar.gz"
      sha256 "c640a13b5cf6e0b1b1f61a7bc517368fe78bc2f7e625be0d4ccb3cac079ff370" # linux-arm64
    end
    on_intel do
      url "https://github.com/e-jerk/find/releases/download/v#{version}/find-gnu-linux-amd64-v#{version}.tar.gz"
      sha256 "c9024efa8c74e95f9a938373749cde95499d3eca64f9e9ee8387697431c5ca87" # linux-amd64
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
