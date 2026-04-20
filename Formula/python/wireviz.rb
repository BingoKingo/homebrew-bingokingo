class Wireviz < Formula
  include Language::Python::Virtualenv

  desc "Easily document cables and wiring harnesses"
  homepage "https://github.com/wireviz/WireViz/"
  url "https://files.pythonhosted.org/packages/68/31/26e518535ae54f540dae0e83e583240d4bae9a883a6213d751b7b0c00304/wireviz-0.4.1.tar.gz"
  sha256 "0e25ad8c2e3a269a7dd4a7f45e4e8d304db7e0432b1843a620acfa6be70570e1"
  license "GPL-3.0-or-later"
  head "https://github.com/wireviz/WireViz.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any,                 arm64_tahoe:   "3e05e788ce13e7b2e9d90df9d2815b0b2c2ca840d11cb93494f2801bfab12919"
    sha256 cellar: :any,                 arm64_sequoia: "8661b7fc824f206ac8d2ed3415a09a7600fa4c0a627f877d915802a1b1efa11e"
    sha256 cellar: :any,                 arm64_sonoma:  "f2585a800a0f2e06bdb954be173928c799f637147c747d414448ab42f51a1bd6"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "140369ea0ef849c354a5eed98c48425f9a3f9aa7c43d363cdd8ba2a555b17fba"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a6b6efb2a2f03b543621f7827e46104b1eca1607cd14a4a1de5c09fd7bf50821"
  end

  depends_on "autoconf" => :build
  depends_on "graphviz"
  depends_on "libyaml"
  depends_on "pillow"
  depends_on "python@3.14"
  depends_on "zlib"

  pypi_packages extra_packages: %w[pillow]

  resource "click" do
    url "https://files.pythonhosted.org/packages/3d/fa/656b739db8587d7b5dfa22e22ed02566950fbfbcdc20311993483657a5c0/click-8.3.1.tar.gz"
    sha256 "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
  end

  resource "graphviz" do
    url "https://files.pythonhosted.org/packages/f8/b3/3ac91e9be6b761a4b30d66ff165e54439dcd48b83f4e20d644867215f6ca/graphviz-0.21.tar.gz"
    sha256 "20743e7183be82aaaa8ad6c93f8893c923bd6658a04c32ee115edb3c8a835f78"
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
