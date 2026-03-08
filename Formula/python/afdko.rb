class Afdko < Formula
  include Language::Python::Virtualenv

  desc "Adobe Font Development Kit for OpenType"
  homepage "https://adobe-type-tools.github.io/afdko/"
  url "https://files.pythonhosted.org/packages/c8/50/7e9cee87780b86843fbcb29d349e819cf2f8eb2363e08792ffc915b95705/afdko-4.0.2.tar.gz"
  sha256 "e1a31e871e83dd022635b852297c433c8e9c9d9d4f0c0f634e8d55dde28ad930"
  license "Apache-2.0"
  head "https://github.com/adobe-type-tools/afdko.git", branch: "develop"

  depends_on "cmake" => :build
  depends_on "brotli"
  depends_on "python@3.13"
  depends_on "util-linux" if OS.linux?
  uses_from_macos "libxml2"
  uses_from_macos "libxslt"

  resource "booleanoperations" do
    url "https://files.pythonhosted.org/packages/b4/6e/63c0dba783d3811cdfe675883cafa4dec03fdd9d77b5743c58da01890dfe/booleanoperations-0.10.0.tar.gz"
    sha256 "6d719f560d2a1dd676c812b844ecceb693c96791c76579089ab7d0f5db5cedbe"
  end

  resource "brotli" do
    url "https://files.pythonhosted.org/packages/f7/16/c92ca344d646e71a43b8bb353f0a6490d7f6e06210f8554c8f874e454285/brotli-1.2.0.tar.gz"
    sha256 "e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a"
  end

  resource "defcon" do
    url "https://files.pythonhosted.org/packages/5e/3e/57b2af543863048d6d6e648cd0b6257b742031971275be4ba9d5d6f055cc/defcon-0.12.2.tar.gz"
    sha256 "25dfe7fd0152ccf292cb190d1928a47d588899c20b046854293e039e1c93e5e0"
  end

  resource "fontmath" do
    url "https://files.pythonhosted.org/packages/69/a5/9abc6de47d7fe4bb7ec7bd3bf67aceb7fcdf7164083d7dfb1e1beb5b0f39/fontmath-0.10.0.tar.gz"
    sha256 "7b0b39336d83d7fc03fb9dc3c662ef7d26b2c15355a34c643d1cfbd03f89fb74"
  end

  resource "fontparts" do
    url "https://files.pythonhosted.org/packages/1b/69/fe36adb1587aa6cddba72a3843089de7fd403312ed0372fef30f7a25c2b3/fontparts-0.14.1.tar.gz"
    sha256 "b38c74326da2192958e41515b52549cb5335e9bd471aae464a386752b8846cb5"
  end

  resource "fontpens" do
    url "https://files.pythonhosted.org/packages/e8/25/ad6b67e7c1e00798ceac95f0cb3abfb82f83f6373e553caf4976855c534f/fontPens-0.2.4.zip"
    sha256 "a6d9a14573b3450f3313d69523f9006028c21fc7aef5d35333b87aab7f2b41fd"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/ec/ca/cf17b88a8df95691275a3d77dc0a5ad9907f328ae53acbe6795da1b2f5ed/fonttools-4.61.1.tar.gz"
    sha256 "6675329885c44657f826ef01d9e4fb33b9158e9d93c537d84ad8399539bc6f69"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/aa/88/262177de60548e5a2bfc46ad28232c9e9cbde697bd94132aeb80364675cb/lxml-6.0.2.tar.gz"
    sha256 "cd79f3367bd74b317dda655dc8fcfa304d9eb6e4fb06b7168c5cf27f96e0cd62"
  end

  resource "mutatormath" do
    url "https://files.pythonhosted.org/packages/44/02/d1ddbbc5698db8ad2a0d1f8a23d52305e66166b6fea5ada5e146dd3a709a/MutatorMath-3.0.1.zip"
    sha256 "8127c1ffad1646f11a953752296c43f5d88cbd5293fff03f093d916b0bc13864"
  end

  resource "pyclipper" do
    url "https://files.pythonhosted.org/packages/f6/21/3c06205bb407e1f79b73b7b4dfb3950bd9537c4f625a68ab5cc41177f5bc/pyclipper-1.4.0.tar.gz"
    sha256 "9882bd889f27da78add4dd6f881d25697efc740bf840274e749988d25496c8e1"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/09/a9/6ba95a270c6f1fbcd8dac228323f2777d886cb206987444e4bce66338dd4/tqdm-4.67.3.tar.gz"
    sha256 "7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb"
  end

  resource "ufonormalizer" do
    url "https://files.pythonhosted.org/packages/f2/67/557823860d2bc7a340ce4772261e35c969e2243621ec32fae62801a4ba6a/ufonormalizer-0.6.3.tar.gz"
    sha256 "c3271097aba9d290594b75c2b432cf681088b74fe3eb334ca4319324e2bddd4e"
  end

  resource "ufoprocessor" do
    url "https://files.pythonhosted.org/packages/73/86/7564e3b6ff396372c4eb444181c5446f19a8bfa83cdb9f8ee1c8f1fa0de0/ufoprocessor-1.14.1.tar.gz"
    sha256 "fd38d3cc359b94171ba8d3fdc1e4defde2206acef4f97d75b48503bb8ac03b01"
  end

  resource "wheel" do
    url "https://files.pythonhosted.org/packages/8a/98/2d9906746cdc6a6ef809ae6338005b3f21bb568bea3165cfc6a243fdc25c/wheel-0.45.1.tar.gz"
    sha256 "661e1abd9198507b1409a20c02106d9670b2576e916d58f520316666abca6729"
  end

  resource "zopfli" do
    url "https://files.pythonhosted.org/packages/0a/4d/a8cc1768b2eda3c0c7470bf8059dcb94ef96d45dd91fc6edd29430d44072/zopfli-0.4.1.tar.gz"
    sha256 "07a5cdc5d1aaa6c288c5d9f5a5383042ba743641abf8e2fd898dcad622d8a38e"
  end

  def install
    ENV["CMAKE_POLICY_VERSION_MINIMUM"] = "3.5"
    virtualenv_install_with_resources
  end
end
