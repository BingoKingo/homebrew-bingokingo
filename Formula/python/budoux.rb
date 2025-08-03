class Budoux < Formula
  include Language::Python::Virtualenv
  desc "Small, standalone, and language-neutral line break organizer"
  homepage "https://github.com/google/budoux/"
  url "https://files.pythonhosted.org/packages/75/58/5ac689c097f592072a6ad5f650d48b60db05c702355a2603682555c8be0e/budoux-0.7.0.tar.gz"
  sha256 "1cb6f4ba1b5b100883147c1fb16ceacdb3d09adf077c82421788c2e170f792ba"
  license "Apache-2.0"
  head "https://github.com/google/budoux.git", branch: "main"

  depends_on "python@3.13"

  resource "importlib-resources" do
    url "https://files.pythonhosted.org/packages/cf/8c/f834fbf984f691b4f7ff60f50b514cc3de5cc08abfc3295564dd89c5e2e7/importlib_resources-6.5.2.tar.gz"
    sha256 "185f87adef5bcc288449d98fb4fba07cea78bc036455dd44c5fc4a2fe78fed2c"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"budoux", "-h"
  end
end
