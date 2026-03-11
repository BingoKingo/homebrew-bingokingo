class Pathins < Formula
  include Language::Python::Virtualenv

  desc "Quadratic font curve path inspector"
  homepage "https://github.com/source-foundry/path-inspector/"
  url "https://files.pythonhosted.org/packages/56/8a/2c1abc0a7fb196dfa1cc4499a0e8702a7204dec95c3b5f6855a28217cd87/pathins-0.5.4.tar.gz"
  sha256 "4563a2b15c566a880834f2a39aabc941fbce80dbeaf79b526f29b472dd0146bf"
  license "Apache-2.0"
  head "https://github.com/source-foundry/path-inspector.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "4ad513ee607bbada75954a4e04933bd616fe96c58e8a9cbca43f11581acbc579"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f8be65b1e63b828b3f714a54f692452679d6d4e7a1e820f15d8d4d4a2844b48a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "47cdf5a9caf407d095cfd67e90a57a1704b3d73d38c773e039e3286a07d32e0a"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "51cedea4c7532074da869a203c070c20e574af1b5a5082e9ac403fca2d32665f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "53065dfc26a9b6de9d6e75dbc2555b569da0682b713adb182a9e7b2fbb308184"
  end

  depends_on "cython"
  depends_on "fonttools"
  depends_on "python@3.14"

  resource "cython" do
    url "https://files.pythonhosted.org/packages/91/85/7574c9cd44b69a27210444b6650f6477f56c75fee1b70d7672d3e4166167/cython-3.2.4.tar.gz"
    sha256 "84226ecd313b233da27dc2eb3601b4f222b8209c3a7216d8733b031da1dc64e6"
  end

  resource "fonttools" do
    url "https://files.pythonhosted.org/packages/5a/96/686339e0fda8142b7ebed39af53f4a5694602a729662f42a6209e3be91d0/fonttools-4.62.0.tar.gz"
    sha256 "0dc477c12b8076b4eb9af2e440421b0433ffa9e1dcb39e0640a6c94665ed1098"
  end

  resource "skia-pathops" do
    url "https://files.pythonhosted.org/packages/4a/f6/ab37d6fa21f25965d4ad059745c76f13ddfb92a2c06a842a42ad77961c24/skia_pathops-0.9.2.tar.gz"
    sha256 "4b6d8459f6f4a69282cb26fca0c2bb0b321cc58a9bf9cc6579a52a391edc0319"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/pathins -h")
    assert_match "usage", output
    assert_match "Quadratic font curve path inspector", output
    assert_match "positional arguments", output
    assert_match "options", output
    version_output = shell_output("#{bin}/pathins -v")
    assert_match "pathins v#{version}", version_output
  end
end
