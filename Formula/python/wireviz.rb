class Wireviz < Formula
  include Language::Python::Virtualenv
  desc "Easily document cables and wiring harnesses"
  homepage "https://github.com/wireviz/WireViz/"
  url "https://files.pythonhosted.org/packages/68/31/26e518535ae54f540dae0e83e583240d4bae9a883a6213d751b7b0c00304/wireviz-0.4.1.tar.gz"
  sha256 "0e25ad8c2e3a269a7dd4a7f45e4e8d304db7e0432b1843a620acfa6be70570e1"
  license "GPL-3.0-or-later"
  head "https://github.com/wireviz/WireViz.git", branch: "master"

  depends_on "graphviz"
  depends_on "libyaml"
  depends_on "pillow"
  depends_on "python@3.13"

  resource "click" do
    url "https://files.pythonhosted.org/packages/60/6c/8ca2efa64cf75a977a0d7fac081354553ebe483345c734fb6b6515d96bbc/click-8.2.1.tar.gz"
    sha256 "27c491cc05d968d271d5a1db13e3b5a184636d9d930f148c50b038f0d0646202"
  end

  resource "graphviz" do
    url "https://files.pythonhosted.org/packages/f8/b3/3ac91e9be6b761a4b30d66ff165e54439dcd48b83f4e20d644867215f6ca/graphviz-0.21.tar.gz"
    sha256 "20743e7183be82aaaa8ad6c93f8893c923bd6658a04c32ee115edb3c8a835f78"
  end

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/f3/0d/d0d6dea55cd152ce3d6767bb38a8fc10e33796ba4ba210cbab9354b6d238/pillow-11.3.0.tar.gz"
    sha256 "3828ee7586cd0b2091b6209e5ad53e20d0649bbe87164a459d0676e035e8f523"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17/pyyaml-6.0.2.tar.gz"
    sha256 "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"wireviz", "-h"
  end
end
