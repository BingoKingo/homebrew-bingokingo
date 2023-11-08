class AdbfsMac < Formula
  desc "Mount Android phones with adb rootlessly (require adb, macfuse)"
  homepage "https://github.com/spion/adbfs-rootless/"
  url "https://github.com/spion/adbfs-rootless/archive/fd56381af4dc9ae2f09b904c295686871a46ed0f.tar.gz"
  version "fd56381"
  head "https://github.com/spion/adbfs-rootless.git", branch: "master"

  depends_on "pkg-config" => :build
  depends_on :macos

  def install
    # macFUSE puts pkg-config into /usr/local/lib/pkgconfig, which is not included in
    # homebrew's default PKG_CONFIG_PATH. We need to tell pkg-config about this path for our build
    ENV.prepend_path "PKG_CONFIG_PATH", "/usr/local/lib/pkgconfig"
    ENV.prepend_path "LIBRARY_PATH", "/usr/local/lib"
    system "make"
    bin.install "adbfs"
  end

  def post_install
    File.write opt_prefix/"homebrew.adbfs-mac.sh", <<~EOS
      #!/bin/bash
      /bin/mkdir /tmp/adbfs; #{opt_bin}/adbfs /tmp/adbfs -d
    EOS
    system "/bin/chmod", "555", opt_prefix/"homebrew.adbfs-mac.sh"
  end

  service do
    run [opt_prefix/"homebrew.adbfs-mac.sh"]
    keep_alive true
  end

  test do
    system bin/"adbfs", "-V"
  end
end
