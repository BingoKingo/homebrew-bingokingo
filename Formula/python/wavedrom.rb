class Wavedrom < Formula
  include Language::Python::Virtualenv
  desc "Digital timing diagram rendering engine"
  homepage "https://wavedrom.com/"
  url "https://files.pythonhosted.org/packages/be/71/6739e3abac630540aaeaaece4584c39f88b5f8658ce6ca517efec455e3de/wavedrom-2.0.3.post3.tar.gz"
  sha256 "327b4d5dca593c81257c202fea516f7a908747fb11527c359f034f5b7af7f47b"
  license "MIT"
  head "https://github.com/wavedrom/wavedrom.git", branch: "trunk"

  depends_on "libyaml"
  depends_on "python@3.13"
  depends_on "six"

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17/pyyaml-6.0.2.tar.gz"
    sha256 "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "svgwrite" do
    url "https://files.pythonhosted.org/packages/16/c1/263d4e93b543390d86d8eb4fc23d9ce8a8d6efd146f9427364109004fa9b/svgwrite-1.4.3.zip"
    sha256 "a8fbdfd4443302a6619a7f76bc937fc683daf2628d9b737c891ec08b8ce524c3"
  end

  def install
    virtualenv_install_with_resources
    bin.install_symlink "wavedrompy" => "wavedrom"
  end

  test do
    system bin/"wavedrompy", "-h"
  end
end
