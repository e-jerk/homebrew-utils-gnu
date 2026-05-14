class Find < Formula
  desc "GPU-accelerated find with all backends (Metal + Vulkan on macOS, Vulkan on Linux)"
  homepage "https://github.com/e-jerk/find"
  version "0.4.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/e-jerk/find/releases/download/v#{version}/find-gnu-macos-arm64-v#{version}.tar.gz"
      sha256 "2b91bea8abcd8890b450d7f6e5a58de35221025041cde1ba673634567aaab8d9" # macos-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/e-jerk/find/releases/download/v#{version}/find-gnu-linux-arm64-v#{version}.tar.gz"
      sha256 "a8a0fd446eb8ead1d48c77f7610346fca5b221d706ff9c463981c30a64eb786b" # linux-arm64
    end
    on_intel do
      url "https://github.com/e-jerk/find/releases/download/v#{version}/find-gnu-linux-amd64-v#{version}.tar.gz"
      sha256 "2b7559a457553f482320789944fb72f0fdf0c0869030fde15508745d80b7eb2e" # linux-amd64
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
