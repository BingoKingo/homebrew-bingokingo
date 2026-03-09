class PandocEqnos < Formula
  include Language::Python::Virtualenv

  desc "Pandoc filter for numbering equations and equation references"
  homepage "https://github.com/tomduck/pandoc-eqnos/"
  url "https://files.pythonhosted.org/packages/1e/4d/8958ccf9e6383c1a0b91dd6584711c130884a4f5ae3b85565613274ff4f0/pandoc-eqnos-2.5.0.tar.gz"
  sha256 "f0cc9250743342cef234cab27e0006a524bf155ecaf9897adf07396d32da94c7"
  license "GPL-3.0-or-later"
  head "https://github.com/tomduck/pandoc-eqnos.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "8e08f8f911822f89e4bf87c8feee44d1aac67272db3f4e8e77a8a239d7ff4fb4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c8d708c5e3d7f044ada1dc14eba8320fe205ec750391ed51bab4e2e4aed8f836"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "cb169c80583e9ff06779fa4155603d56cce4ea9c016abb88a916ab35d1bf4e52"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "19edeb8b50c42250895ad492200f7de69596d3b404882881fbff7e29e05c6dc6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "712c4617f2dc843f6f16128f0e1f4e78a6f63154faa147688281b65d19aa1a87"
  end
  deprecate! date: "2020-12-06", because: :unmaintained
  depends_on "python@3.14"

  resource "pandoc-xnos" do
    url "https://files.pythonhosted.org/packages/f8/67/2f775963c0959f43821c4242e66143d42f39a01ac8e0c17f7d67ed126df7/pandoc-xnos-2.5.0.tar.gz"
    sha256 "7c18738c899e4ecec573dc6565abd8d43281fc894d41b82743d51df3dde250ae"
  end

  resource "pandocfilters" do
    url "https://files.pythonhosted.org/packages/70/6f/3dd4940bbe001c06a65f88e36bad298bc7a0de5036115639926b0c5c0458/pandocfilters-1.5.1.tar.gz"
    sha256 "002b4a555ee4ebc03f8b66307e287fa492e4a77b4ea14d3f934328297bb4939e"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/90/c7/6dc0a455d111f68ee43f27793971cf03fe29b6ef972042549db29eec39a2/psutil-5.9.8.tar.gz"
    sha256 "6be126e3225486dff286a8fb9a06246a5253f4c7c53b475ea5f5ac934e64194c"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/pandoc-eqnos -h")
    assert_match "usage", output
    assert_match "Pandoc equations numbers filter.", output
    assert_match "positional arguments", output
    assert_match "options", output
    version_output = shell_output("#{bin}/pandoc-eqnos --version")
    assert_match "pandoc-eqnos #{version}", version_output
  end
end
