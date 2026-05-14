class Grep < Formula
  desc "GPU-accelerated grep with all backends (Metal + Vulkan on macOS, Vulkan on Linux)"
  homepage "https://github.com/e-jerk/grep"
  version "0.5.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/e-jerk/grep/releases/download/v#{version}/grep-gnu-macos-arm64-v#{version}.tar.gz"
      sha256 "f906d6960327a34cafb8023295785f97fdc640cc7692b32ff5ac7d741b7c320c" # macos-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/e-jerk/grep/releases/download/v#{version}/grep-gnu-linux-arm64-v#{version}.tar.gz"
      sha256 "0c012476474eb83d9cb64c544cf851025d7424d3fae2f097450b70129a27213f" # linux-arm64
    end
    on_intel do
      url "https://github.com/e-jerk/grep/releases/download/v#{version}/grep-gnu-linux-amd64-v#{version}.tar.gz"
      sha256 "821d277aece3f774bad41d4dd6b49521e3b83745e5eeeb423fa2db23e1c31c0a" # linux-amd64
    end
    depends_on "vulkan-loader"
  end

  depends_on "molten-vk" => :recommended if OS.mac?

  def install
    bin.install "grep"
  end

  test do
    system "#{bin}/grep", "--help"
  end
end
