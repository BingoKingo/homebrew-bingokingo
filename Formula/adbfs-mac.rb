class AdbfsMac < Formula
  desc "Mount Android phones with adb rootlessly (require adb, macfuse)"
  homepage "https://github.com/spion/adbfs-rootless/"
  head "https://github.com/spion/adbfs-rootless.git", branch: "master"
  license "BSD"

  depends_on "pkg-config" => :build
  depends_on :macos

  def install
    # macFUSE puts pkg-config into /usr/local/lib/pkgconfig, which is not included in
    # homebrew's default PKG_CONFIG_PATH. We need to tell pkg-config about this path for our build
    ENV.prepend_path "LIBRARY_PATH", "/usr/local/lib"
    ENV.prepend_path "PKG_CONFIG_PATH", "/usr/local/lib/pkgconfig"
    ENV["DYLD_LIBRARY_PATH"] = "/usr/local/lib"
    system "make", "prefix=#{prefix}"
    # No LC_RPATH's found ,solved: https://github.com/macos-fuse-t/fuse-t/issues/6
    # MachO::Tools.add_rpath("/usr/local/lib/libfuse-t.dylib", rpath)
    system "install_name_tool", "-add_rpath", "/usr/local/lib", "adbfs"
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
      `adb` should be installed first,
      try `brew install android-platform-tools`
      or `brew install android-studio` and export PATH.
    EOS
  end

  test do
    system bin/"adbfs", "-V"
  end
end
