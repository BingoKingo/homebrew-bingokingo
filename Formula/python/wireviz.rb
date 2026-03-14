class Wireviz < Formula
  include Language::Python::Virtualenv

  desc "Easily document cables and wiring harnesses"
  homepage "https://github.com/wireviz/WireViz/"
  url "https://files.pythonhosted.org/packages/68/31/26e518535ae54f540dae0e83e583240d4bae9a883a6213d751b7b0c00304/wireviz-0.4.1.tar.gz"
  sha256 "0e25ad8c2e3a269a7dd4a7f45e4e8d304db7e0432b1843a620acfa6be70570e1"
  license "GPL-3.0-or-later"
  head "https://github.com/wireviz/WireViz.git", branch: "master"

  depends_on "autoconf" => :build
  depends_on "graphviz"
  depends_on "libyaml"
  depends_on "pillow"
  depends_on "python@3.14"
  depends_on "zlib"

  resource "click" do
    url "https://files.pythonhosted.org/packages/3d/fa/656b739db8587d7b5dfa22e22ed02566950fbfbcdc20311993483657a5c0/click-8.3.1.tar.gz"
    sha256 "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
  end

  resource "graphviz" do
    url "https://files.pythonhosted.org/packages/f8/b3/3ac91e9be6b761a4b30d66ff165e54439dcd48b83f4e20d644867215f6ca/graphviz-0.21.tar.gz"
    sha256 "20743e7183be82aaaa8ad6c93f8893c923bd6658a04c32ee115edb3c8a835f78"
  end

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/1f/42/5c74462b4fd957fcd7b13b04fb3205ff8349236ea74c7c375766d6c82288/pillow-12.1.1.tar.gz"
    sha256 "9ad8fa5937ab05218e2b6a4cff30295ad35afd2f83ac592e68c0d871bb0fdbc4"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/wireviz -h")
    assert_match "Usage", output
    assert_match "Parses the provided FILE and generates the specified outputs.", output
    assert_match "Options", output
    version_output = shell_output("#{bin}/wireviz -V")
    assert_match "WireViz #{version}", version_output
  end
end
