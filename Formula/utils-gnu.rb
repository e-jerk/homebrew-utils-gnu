class UtilsGnu < Formula
  desc "GPU-accelerated Unix utilities with GNU fallback"
  homepage "https://github.com/e-jerk/homebrew-utils-gnu"
  url "https://github.com/e-jerk/homebrew-utils-gnu/archive/refs/heads/main.tar.gz"
  version "0.1.0"

  depends_on "e-jerk/utils-gnu/grep"
  depends_on "e-jerk/utils-gnu/find"
  depends_on "e-jerk/utils-gnu/gawk"
  depends_on "e-jerk/utils-gnu/sed"

  def install
    prefix.install "README.md" if File.exist?("README.md")
  end
end
