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
    url "https://files.pythonhosted.org/packages/57/d9/9eae7bc4ba3a38ab7426522fb08e12df54aec27595d7bcd1bc0670aec873/booleanOperations-0.9.0.zip"
    sha256 "8cfa821c32ad374fa120d6b2e0b444ebeac57c91e6631528645fa19ac2a281b8"
  end

  resource "brotli" do
    url "https://files.pythonhosted.org/packages/2f/c2/f9e977608bdf958650638c3f1e28f85a1b075f075ebbe77db8555463787b/Brotli-1.1.0.tar.gz"
    sha256 "81de08ac11bcb85841e440c13611c00b67d3bf82698314928d0b676362546724"
  end

  resource "defcon" do
    url "https://files.pythonhosted.org/packages/5e/3e/57b2af543863048d6d6e648cd0b6257b742031971275be4ba9d5d6f055cc/defcon-0.12.2.tar.gz"
    sha256 "25dfe7fd0152ccf292cb190d1928a47d588899c20b046854293e039e1c93e5e0"
  end

  resource "fontmath" do
    url "https://files.pythonhosted.org/packages/0d/ee/c23438eb01ee4b43beb79c148088589661a3eb1c6549ec82baebea059c99/fontmath-0.9.4.zip"
    sha256 "1fd9190c9d784e1305c3c49771b91d910f246a4b7c44ede219c99a07ed7aeda4"
  end

  resource "fontparts" do
    url "https://files.pythonhosted.org/packages/a1/a4/031524c01e24b7cbcf6f3b5a18fbfc403cdfd61d55b7e5cdaaaf1616b3e8/fontparts-0.13.2.tar.gz"
    sha256 "16fbf2eab51692dadd77e7fcab5aacca9552c9661db04c254854fbed91874e32"
  end

  resource "fontpens" do
    url "https://files.pythonhosted.org/packages/e8/25/ad6b67e7c1e00798ceac95f0cb3abfb82f83f6373e553caf4976855c534f/fontPens-0.2.4.zip"
    sha256 "a6d9a14573b3450f3313d69523f9006028c21fc7aef5d35333b87aab7f2b41fd"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/8a/27/ec3c723bfdf86f34c5c82bf6305df3e0f0d8ea798d2d3a7cb0c0a866d286/fonttools-4.59.0.tar.gz"
    sha256 "be392ec3529e2f57faa28709d60723a763904f71a2b63aabe14fee6648fe3b14"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/c5/ed/60eb6fa2923602fba988d9ca7c5cdbd7cf25faa795162ed538b527a35411/lxml-6.0.0.tar.gz"
    sha256 "032e65120339d44cdc3efc326c9f660f5f7205f3a535c1fdbf898b29ea01fb72"
  end

  resource "mutatormath" do
    url "https://files.pythonhosted.org/packages/44/02/d1ddbbc5698db8ad2a0d1f8a23d52305e66166b6fea5ada5e146dd3a709a/MutatorMath-3.0.1.zip"
    sha256 "8127c1ffad1646f11a953752296c43f5d88cbd5293fff03f093d916b0bc13864"
  end

  resource "pyclipper" do
    url "https://files.pythonhosted.org/packages/4a/b2/550fe500e49c464d73fabcb8cb04d47e4885d6ca4cfc1f5b0a125a95b19a/pyclipper-1.3.0.post6.tar.gz"
    sha256 "42bff0102fa7a7f2abdd795a2594654d62b786d0c6cd67b72d469114fdeb608c"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d/tqdm-4.67.1.tar.gz"
    sha256 "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2"
  end

  resource "ufonormalizer" do
    url "https://files.pythonhosted.org/packages/23/37/a5e2128599ae94f23b9f598a6656554fe2385d6e8ed5717d14afa7b78acb/ufonormalizer-0.6.2.zip"
    sha256 "4c5715bb948381f2c641af82b94938ad242d9b5365dd1c5b7ce3d75556a26c3a"
  end

  resource "ufoprocessor" do
    url "https://files.pythonhosted.org/packages/7e/53/16268853919e6030b110adc4e9c7f14eb93e58a9b957ee2d11a53059c175/ufoprocessor-1.13.3.tar.gz"
    sha256 "fca5c257713f446dc3f90af26a71f37f378d53690ee2e93e14117da3fb790785"
  end

  resource "wheel" do
    url "https://files.pythonhosted.org/packages/8a/98/2d9906746cdc6a6ef809ae6338005b3f21bb568bea3165cfc6a243fdc25c/wheel-0.45.1.tar.gz"
    sha256 "661e1abd9198507b1409a20c02106d9670b2576e916d58f520316666abca6729"
  end

  resource "zopfli" do
    url "https://files.pythonhosted.org/packages/5e/7c/a8f6696e694709e2abcbccd27d05ef761e9b6efae217e11d977471555b62/zopfli-0.2.3.post1.tar.gz"
    sha256 "96484dc0f48be1c5d7ae9f38ed1ce41e3675fd506b27c11a6607f14b49101e99"
  end

  def install
    ENV["CMAKE_POLICY_VERSION_MINIMUM"] = "3.5"
    virtualenv_install_with_resources
  end
end
