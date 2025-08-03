class Html2text < Formula
  include Language::Python::Virtualenv
  desc "Convert HTML to Markdown-formatted text"
  homepage "https://alir3z4.github.io/html2text/"
  url "https://files.pythonhosted.org/packages/f8/27/e158d86ba1e82967cc2f790b0cb02030d4a8bef58e0c79a8590e9678107f/html2text-2025.4.15.tar.gz"
  sha256 "948a645f8f0bc3abe7fd587019a2197a12436cd73d0d4908af95bfc8da337588"
  license "GPL-3.0-or-later"
  head "https://github.com/Alir3z4/html2text.git", branch: "master"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"html2text", "-help"
  end
end
