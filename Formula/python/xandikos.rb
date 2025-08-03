class Xandikos < Formula
  include Language::Python::Virtualenv
  desc "CalDAV/CardDAV server backed by Git"
  homepage "https://www.xandikos.org/"
  url "https://files.pythonhosted.org/packages/56/4e/281268da325c7f45307df5827827e02cc2846896b8dc2fb3dd4b19578d68/xandikos-0.2.12.tar.gz"
  sha256 "593f6fe4dbaefd3e98e385c0b0b7685177c0c77d2ae524c8ebf7c679932ecf74"
  license "GPL-3.0-or-later"
  head "https://github.com/jelmer/xandikos.git", branch: "master"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "python-setuptools" => :build
  depends_on "dbus"
  depends_on "patchelf"
  depends_on "python@3.13"
  depends_on "six"

  resource "aiohappyeyeballs" do
    url "https://files.pythonhosted.org/packages/26/30/f84a107a9c4331c14b2b586036f40965c128aa4fee4dda5d3d51cb14ad54/aiohappyeyeballs-2.6.1.tar.gz"
    sha256 "c3f9d0113123803ccadfdf3f0faa505bc78e6a72d1cc4806cbd719826e943558"
  end

  resource "aiohttp" do
    url "https://files.pythonhosted.org/packages/e6/0b/e39ad954107ebf213a2325038a3e7a506be3d98e1435e1f82086eec4cde2/aiohttp-3.12.14.tar.gz"
    sha256 "6e06e120e34d93100de448fd941522e11dafa78ef1a893c179901b7d66aa29f2"
  end

  resource "aiosignal" do
    url "https://files.pythonhosted.org/packages/61/62/06741b579156360248d1ec624842ad0edf697050bbaf7c3e46394e106ad1/aiosignal-1.4.0.tar.gz"
    sha256 "f47eecd9468083c2029cc99945502cb7708b082c232f9aca65da147157b251c7"
  end

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/5a/b0/1367933a8532ee6ff8d63537de4f1177af4bff9f3e829baf7331f595bb24/attrs-25.3.0.tar.gz"
    sha256 "75d7cefc7fb576747b2c81b4442d4d4a1ce0900973527c011d1030fd3bf4af1b"
  end

  # "python-dbus"?
  # resource "dbus-python" do
  #   url "https://files.pythonhosted.org/packages/ff/24/63118050c7dd7be04b1ccd60eab53fef00abe844442e1b6dec92dae505d6/dbus-python-1.4.0.tar.gz"
  #   sha256 "991666e498f60dbf3e49b8b7678f5559b8a65034fdf61aae62cdecdb7d89c770"
  # end

  resource "defusedxml" do
    url "https://files.pythonhosted.org/packages/0f/d5/c66da9b79e5bdb124974bfe172b4daf3c984ebd9c2a06e2b8a4dc7331c72/defusedxml-0.7.1.tar.gz"
    sha256 "1bb3032db185915b62d7c6209c5a8792be6a32ab2fedacc84e01b52c51aa3e69"
  end

  resource "dulwich" do
    url "https://files.pythonhosted.org/packages/1b/d1/456dd15150702523d7a6cb7a4efc227b6c53226215a60e0c569e7a496979/dulwich-0.23.2.tar.gz"
    sha256 "a152ebb0e95bc0f23768be563f80ff1e719bf5c4f5c2696be4fa8ab625a39879"
  end

  resource "frozenlist" do
    url "https://files.pythonhosted.org/packages/79/b1/b64018016eeb087db503b038296fd782586432b9c077fc5c7839e9cb6ef6/frozenlist-1.7.0.tar.gz"
    sha256 "2e310d81923c2437ea8670467121cc3e9b0f76d3043cc1d2331d56c7fb7a3a8f"
  end

  resource "icalendar" do
    url "https://files.pythonhosted.org/packages/08/13/e5899c916dcf1343ea65823eb7278d3e1a1d679f383f6409380594b5f322/icalendar-6.3.1.tar.gz"
    sha256 "a697ce7b678072941e519f2745704fc29d78ef92a2dc53d9108ba6a04aeba466"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f1/70/7703c29685631f5a7590aa73f1f1d3fa9a380e654b86af429e0934a32f7d/idna-3.10.tar.gz"
    sha256 "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"
  end

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/af/92/b3130cbbf5591acf9ade8708c365f3238046ac7cb8ccba6e81abccb0ccff/jinja2-3.1.5.tar.gz"
    sha256 "8fefff8dc3034e27bb80d67c671eb8a9bc424c0ef4c0826edbff304cceff43bb"
  end

  resource "markupsafe" do
    url "https://files.pythonhosted.org/packages/b2/97/5d42485e71dfc078108a86d6de8fa46db44a1a9295e89c5d6d4a06e23a62/markupsafe-3.0.2.tar.gz"
    sha256 "ee55d3edf80167e48ea11a923c7386f4669df67d7994554387f84e7d8b0a2bf0"
  end

  resource "multidict" do
    url "https://files.pythonhosted.org/packages/3d/2c/5dad12e82fbdf7470f29bff2171484bf07cb3b16ada60a6589af8f376440/multidict-6.6.3.tar.gz"
    sha256 "798a9eb12dab0a6c2e29c1de6f3468af5cb2da6053a20dfa3344907eed0937cc"
  end

  resource "prometheus-client" do
    url "https://files.pythonhosted.org/packages/62/14/7d0f567991f3a9af8d1cd4f619040c93b68f09a02b6d0b6ab1b2d1ded5fe/prometheus_client-0.21.1.tar.gz"
    sha256 "252505a722ac04b0456be05c05f75f45d760c2911ffc45f2a06bcaed9f3ae3fb"
  end

  resource "propcache" do
    url "https://files.pythonhosted.org/packages/a6/16/43264e4a779dd8588c21a70f0709665ee8f611211bdd2c87d952cfa7c776/propcache-0.3.2.tar.gz"
    sha256 "20d7d62e4e7ef05f221e0db2856b979540686342e7dd9973b815599c7057e168"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/66/c0/0c8b6ad9f17a802ee498c46e004a0eb49bc148f2fd230864601a86dcf6db/python-dateutil-2.9.0.post0.tar.gz"
    sha256 "37dd54208da7e1cd875388217d5e00ebd4179249f90fb72437e91a35459a0ad3"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/f8/bf/abbd3cdfb8fbc7fb3d4d38d320f2441b1e7cbe29be4f23797b4a2b5d8aac/pytz-2025.2.tar.gz"
    sha256 "360b9e3dbb49a209c21ad61809c7fb453643e048b38924c765813546746e81c3"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "tzdata" do
    url "https://files.pythonhosted.org/packages/95/32/1a225d6164441be760d75c2c42e2780dc0873fe382da3e98a2e1e48361e5/tzdata-2025.2.tar.gz"
    sha256 "b60a638fcc0daffadf82fe0f57e53d06bdec2f36c4df66280ae79bce6bd6f2b9"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/15/22/9ee70a2574a4f4599c47dd506532914ce044817c7752a79b6a51286319bc/urllib3-2.5.0.tar.gz"
    sha256 "3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbff92760"
  end

  resource "yarl" do
    url "https://files.pythonhosted.org/packages/3c/fb/efaa23fa4e45537b827620f04cf8f3cd658b76642205162e072703a5b963/yarl-1.20.1.tar.gz"
    sha256 "d017a4997ee50c91fd5466cef416231bb82177b93b029906cefc542ce14c35ac"
  end

  resource "vobject" do
    url "https://files.pythonhosted.org/packages/d0/8a/15c34b3d27c43fc81a467d0f66577afc5542326804c42f30557e31c3259e/vobject-0.9.9.tar.gz"
    sha256 "ac44e5d7e2079d84c1d52c50a615b9bec4b1ba958608c4c7fe40cbf33247b38e"
  end

  resource "wheel" do
    url "https://files.pythonhosted.org/packages/8a/98/2d9906746cdc6a6ef809ae6338005b3f21bb568bea3165cfc6a243fdc25c/wheel-0.45.1.tar.gz"
    sha256 "661e1abd9198507b1409a20c02106d9670b2576e916d58f520316666abca6729"
  end

  # "python-avahi"?
  resource "zeroconf" do
    url "https://files.pythonhosted.org/packages/d2/20/e8c3df9312cbd16175b51d180d3fc160411c259e8326f1629135323e8d80/zeroconf-0.140.1.tar.gz"
    sha256 "477d396cb712247aa5859e59249aabdad3fab1139097794e70b2e4b1625047bf"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"xandikos", "--defaults", "-d", "dav"
  end
end
