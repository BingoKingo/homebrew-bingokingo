class AdbfsMac < Formula
  desc "Mount Android phones with adb rootlessly (require adb, macfuse)"
  homepage "https://github.com/spion/adbfs-rootless/"
  url "https://github.com/spion/adbfs-rootless/archive/master.tar.gz"
  version "master"
  head "https://github.com/spion/adbfs-rootless.git", branch: "master"

  depends_on "pkg-config" => :build
  depends_on :macos

  def install
    # macFUSE puts pkg-config into /usr/local/lib/pkgconfig, which is not included in
    # homebrew's default PKG_CONFIG_PATH. We need to tell pkg-config about this path for our build
    ENV.prepend_path "LIBRARY_PATH", "/usr/local/lib"
    ENV.prepend_path "PKG_CONFIG_PATH", "/usr/local/lib/pkgconfig"
    ENV["DYLD_LIBRARY_PATH"] = "/usr/local/lib"
    system "make", "prefix=#{prefix}"
    bin.install "adbfs"
  end

  def post_install
    File.write opt_prefix/"homebrew.adbfs-mac.sh", <<~EOS
      #!/bin/bash
      /bin/mkdir -p /tmp/fuse/adb; export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/lib; #{opt_bin}/adbfs /tmp/fuse/adb -d
    EOS
    system "/bin/chmod", "555", opt_prefix/"homebrew.adbfs-mac.sh"
  end

  service do
    run [opt_prefix/"homebrew.adbfs-mac.sh"]
    keep_alive true
  end

  def caveats
    <<~EOS
      If library not loaded, run the following command before:
        export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/lib
    EOS
  end

  test do
    system bin/"adbfs", "-V"
  end
end
