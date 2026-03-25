class Sed < Formula
  desc "GPU-accelerated sed with all backends (Metal + Vulkan on macOS, Vulkan on Linux)"
  homepage "https://github.com/e-jerk/sed"
  version "0.2.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/e-jerk/sed/releases/download/v#{version}/sed-gnu-macos-arm64-v#{version}.tar.gz"
      sha256 "b11745dd0bf49ed205081767be8a65da3eb76a37ce60f04414e89a98b9f83e31" # macos-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/e-jerk/sed/releases/download/v#{version}/sed-gnu-linux-arm64-v#{version}.tar.gz"
      sha256 "3a1ba1ec9256312095d586dc3b1a005d2c780cf40e7de2a08ed02c8b49f94358" # linux-arm64
    end
    on_intel do
      url "https://github.com/e-jerk/sed/releases/download/v#{version}/sed-gnu-linux-amd64-v#{version}.tar.gz"
      sha256 "ccb269de962f2b287912bf66a86eac7861a0f20c9954cff77853fa8eac0ca00c" # linux-amd64
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
