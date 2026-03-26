class Sed < Formula
  desc "GPU-accelerated sed with all backends (Metal + Vulkan on macOS, Vulkan on Linux)"
  homepage "https://github.com/e-jerk/sed"
  version "0.2.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/e-jerk/sed/releases/download/v#{version}/sed-gnu-macos-arm64-v#{version}.tar.gz"
      sha256 "87661841e523494bd0ec0dc1867cbe4be50daee4d82912855b7e1af38b94eab7" # macos-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/e-jerk/sed/releases/download/v#{version}/sed-gnu-linux-arm64-v#{version}.tar.gz"
      sha256 "fdd7895c8f0b0f326bc93c30167db3f9e970f776fd2a9cc61b265ff2d9f7e88f" # linux-arm64
    end
    on_intel do
      url "https://github.com/e-jerk/sed/releases/download/v#{version}/sed-gnu-linux-amd64-v#{version}.tar.gz"
      sha256 "f3604fcda79da94e1d870c90024f2cf28fd88bc24ab569554cd9921587a31fad" # linux-amd64
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
