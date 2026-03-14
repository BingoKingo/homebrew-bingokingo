class Magiskboot < Formula
  desc "Android magisk boot image modification tool"
  homepage "https://topjohnwu.github.io/Magisk/tools.html"
  url "https://github.com/topjohnwu/Magisk/archive/refs/tags/v30.7.tar.gz"
  sha256 "9a908fc13a60bbb95c848c9e8cfbb5bd4e49fda98ee6932907c4a517fbc95437"
  license "GPL-3.0-or-later"
  head "https://github.com/topjohnwu/Magisk.git", branch: "master"

  depends_on "python@3.14" => :build
  depends_on "rust" => :build

  resource "cxx-rs" do
    url "https://github.com/topjohnwu/cxx/archive/refs/heads/master.tar.gz"
  end

  def install
    temp_android_home = buildpath/"temp_android_home"
    temp_android_home.mkpath
    ENV["ANDROID_HOME"] = temp_android_home
    llvm_prefix = Formula["llvm"].opt_prefix
    ENV["DYLD_FALLBACK_LIBRARY_PATH"] = "#{llvm_prefix}/lib:#{ENV.fetch("DYLD_FALLBACK_LIBRARY_PATH", "")}"
    system "python3", "build.py", "ndk"
    rust_toolchain = temp_android_home/"ndk/magisk/toolchains/rust"
    if rust_toolchain.exist?
      ENV["PATH"] = "#{rust_toolchain}/bin:#{ENV["PATH"]}"
      ENV["RUSTUP_TOOLCHAIN"] = rust_toolchain.to_s
    end

    cxx_rs_dir = buildpath/"native/src/external/cxx-rs"
    cxx_rs_dir.mkpath

    resource("cxx-rs").stage do
      cp_r ".", cxx_rs_dir
    end

    rust_lib_dir = temp_android_home/"ndk/magisk/toolchains/rust/lib"
    rust_lib_dir.mkpath
    llvm_lib = llvm_prefix/"lib/libLLVM.dylib"
    cp llvm_lib, rust_lib_dir if llvm_lib.exist?

    system "python3", "build.py", "native", "magiskboot"
    magiskboot_path = Dir["native/out/**/magiskboot"].first
    bin.install magiskboot_path
  end

  test do
    system bin/"magiskboot", "--help"
  end
end
