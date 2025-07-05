class Textplay < Formula
  desc "Converts Fountain formatted plain-text to HTML, XML, and FDX (Final Draft)"
  homepage "https://github.com/overvale/Textplay/"
  head "https://github.com/overvale/Textplay.git", branch: "master"

  depends_on "ruby"
  # uses_from_macos "ruby"

  def install
    bin.install "textplay"
  end

  test do
    system bin/"textplay", "-h"
  end
end
