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

  def caveats
    <<~EOS
      e-jerk GPU-accelerated utilities (GNU-fallback builds) installed:
        grep, find, gawk, sed

      These include full GNU backend support (--gnu flag).

      To use them instead of system versions, ensure Homebrew's
      bin directory comes first in your PATH:

        echo 'export PATH="$(brew --prefix)/bin:$PATH"' >> ~/.zshrc
        source ~/.zshrc

      Verify with:
        which grep   # should show #{HOMEBREW_PREFIX}/bin/grep
        grep --help  # shows --gnu backend option
    EOS
  end
end
