class Fontmake < Formula
  include Language::Python::Virtualenv

  desc "Compile fonts from sources (UFO, Glyphs) to binary (OpenType, TrueType)"
  homepage "https://github.com/googlefonts/fontmake/"
  url "https://files.pythonhosted.org/packages/af/a1/ba8c1e2c143a98d9adb1537201c27ed37c949243a2441e44a33c76a42f0e/fontmake-3.11.1.tar.gz"
  sha256 "a3b958a2f6d0b978a803a5643f04c27c88c5ed9dc5af999752408aa94053d082"
  license "Apache-2.0"
  head "https://github.com/googlefonts/fontmake.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "libffi" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "python@3.14"
  uses_from_macos "libxml2"
  uses_from_macos "libxslt"

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/6b/5c/685e6633917e101e5dcb62b9dd76946cbb57c26e133bae9e0cd36033c0a9/attrs-25.4.0.tar.gz"
    sha256 "16d5969b87f0859ef33a48b35d55ac1be6e42ae49d5e853b597db70c35c57e11"
  end

  resource "booleanoperations" do
    url "https://files.pythonhosted.org/packages/b4/6e/63c0dba783d3811cdfe675883cafa4dec03fdd9d77b5743c58da01890dfe/booleanoperations-0.10.0.tar.gz"
    sha256 "6d719f560d2a1dd676c812b844ecceb693c96791c76579089ab7d0f5db5cedbe"
  end

  resource "cffsubr" do
    url "https://files.pythonhosted.org/packages/57/09/5987a51eeb193c700f48984502c4e7de863b2e55f3b91b66543d6f7b3b58/cffsubr-0.4.0.tar.gz"
    sha256 "2c321b6807bd95856d921ed9dce8506495cf49fc7a89a63cb942e8bece13addd"
    patch :DATA
  end

  resource "compreffor" do
    url "https://files.pythonhosted.org/packages/67/77/57ce491ad29073f4b8cfa6226d8b7cba310327d71a7e7db4e2e000b08ed8/compreffor-0.6.0.tar.gz"
    sha256 "7ea034a50c59cc78732f1480040eac2bb36f826ce2eb607c3029b5d38ab11ba8"
  end

  resource "fontmath" do
    url "https://files.pythonhosted.org/packages/69/a5/9abc6de47d7fe4bb7ec7bd3bf67aceb7fcdf7164083d7dfb1e1beb5b0f39/fontmath-0.10.0.tar.gz"
    sha256 "7b0b39336d83d7fc03fb9dc3c662ef7d26b2c15355a34c643d1cfbd03f89fb74"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/5a/96/686339e0fda8142b7ebed39af53f4a5694602a729662f42a6209e3be91d0/fonttools-4.62.0.tar.gz"
    sha256 "0dc477c12b8076b4eb9af2e440421b0433ffa9e1dcb39e0640a6c94665ed1098"
  end

  resource "glyphslib" do
    url "https://files.pythonhosted.org/packages/7e/86/069a2c8c26787af2b4f591f25f830a8c0978d758fc03764a4c89401641b9/glyphslib-6.13.0.tar.gz"
    sha256 "7527baa1310be6c41d504ced6efec37423cccaa8ad950f8db675e54456324a1f"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/aa/88/262177de60548e5a2bfc46ad28232c9e9cbde697bd94132aeb80364675cb/lxml-6.0.2.tar.gz"
    sha256 "cd79f3367bd74b317dda655dc8fcfa304d9eb6e4fb06b7168c5cf27f96e0cd62"
  end

  resource "openstep-plist" do
    url "https://files.pythonhosted.org/packages/c6/c4/8ab312ec6060ba89c8c60f90e9cdecdf8f53d4a9b743293074a65708f7b0/openstep_plist-0.5.2.tar.gz"
    sha256 "2a0d70ff7a03cce64a727062b64bb2f5c9af9fd4a636aaa4339b6aaa2cf65195"
  end

  resource "pyclipper" do
    url "https://files.pythonhosted.org/packages/f6/21/3c06205bb407e1f79b73b7b4dfb3950bd9537c4f625a68ab5cc41177f5bc/pyclipper-1.4.0.tar.gz"
    sha256 "9882bd889f27da78add4dd6f881d25697efc740bf840274e749988d25496c8e1"
  end

  resource "ufo2ft" do
    url "https://files.pythonhosted.org/packages/12/dd/e012f600a8cbbe89ba94388a8a2f2d78409f42c082aba8a0c01e433f6b2f/ufo2ft-3.7.0.tar.gz"
    sha256 "e467db380d42774d4a6016a13879987d76f921c5d62cc3cc78960da019f1e80e"
  end

  resource "ufolib2" do
    url "https://files.pythonhosted.org/packages/f7/32/4df1cf042ec48d0179d011067ba76051bb2f8462a5477bb33127f9391b41/ufolib2-0.18.1.tar.gz"
    sha256 "7de0efcc361c573f2537ee7ceabdb3bc64b19b61304cfa25e828caa7db8ae1a4"
  end

  resource "unicodedata2" do
    url "https://files.pythonhosted.org/packages/44/cb/520721a715da85530e21c71953b9b9a85a44e0d80d3b34bf9303c422d208/unicodedata2-17.0.1.tar.gz"
    sha256 "d79943d153f5f6bfbe3f55a5ec611985184bda37fcedb3ecc75322d82ae6ad3b"
  end

  def install
    ENV["CMAKE_POLICY_VERSION_MINIMUM"] = "3.5"
    ENV["SKBUILD_CMAKE_ARGS"] = "-DCMAKE_OSX_ARCHITECTURES=#{Hardware::CPU.arch}"
    ENV["CMAKE_GENERATOR"] = "Ninja"
    ENV["SKBUILD_NINJA_EXECUTABLE"] = Formula["ninja"].opt_bin/"ninja"
    ENV["NINJA_EXECUTABLE"] = Formula["ninja"].opt_bin/"ninja"
    ENV.prepend_path "PATH", Formula["ninja"].opt_bin
    virtualenv_install_with_resources
  end

  test do
    system bin/"fontmake", "-h"
  end
end
__END__
diff --git a/setup.cfg b/setup.cfg
index 8bfd5a1..40d30c6 100644
--- a/setup.cfg
+++ b/setup.cfg
@@ -2,3 +2,8 @@
 tag_build = 
 tag_date = 0
 
+[metadata]
+name = cffsubr
+version = 0.4.0
+
+[options]
