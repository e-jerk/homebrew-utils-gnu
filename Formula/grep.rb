class Grep < Formula
  desc "GPU-accelerated grep with all backends (Metal + Vulkan on macOS, Vulkan on Linux)"
  homepage "https://github.com/e-jerk/grep"
  version "0.1.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/e-jerk/grep/releases/download/v#{version}/grep-gnu-macos-arm64-v#{version}.tar.gz"
      sha256 "941cc6ad8228243b154dccfb61806807697b35035f3062dab2176959a4851f4f" # macos-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/e-jerk/grep/releases/download/v#{version}/grep-gnu-linux-arm64-v#{version}.tar.gz"
      sha256 "3e1bfda6a50f8010f27db66e0f16e725e91f08bd6a0dc23c7b8fb2d90073ea5f" # linux-arm64
    end
    on_intel do
      url "https://github.com/e-jerk/grep/releases/download/v#{version}/grep-gnu-linux-amd64-v#{version}.tar.gz"
      sha256 "f3527ee7e5e0b465f9333fc73d5fc7a9a1486d97fabe61497085a2f40789dd63" # linux-amd64
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
