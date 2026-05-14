class Sed < Formula
  desc "GPU-accelerated sed with all backends (Metal + Vulkan on macOS, Vulkan on Linux)"
  homepage "https://github.com/e-jerk/sed"
  version "0.4.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/e-jerk/sed/releases/download/v#{version}/sed-gnu-macos-arm64-v#{version}.tar.gz"
      sha256 "0da1ba52cbb63202db2644042e7086e85222b6b92d8d8f6372ec6aa9f7b697d8" # macos-arm64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/e-jerk/sed/releases/download/v#{version}/sed-gnu-linux-arm64-v#{version}.tar.gz"
      sha256 "d46ba86048d22629c5987948d9aad7c1fbf8ecc3381feac3ceb100a5daf97808" # linux-arm64
    end
    on_intel do
      url "https://github.com/e-jerk/sed/releases/download/v#{version}/sed-gnu-linux-amd64-v#{version}.tar.gz"
      sha256 "36a4a657055bc3b32c772e6b50513779a386155bd74630644739eafdca537961" # linux-amd64
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
