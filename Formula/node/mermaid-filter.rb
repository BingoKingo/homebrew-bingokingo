class MermaidFilter < Formula
  desc "Pandoc filter for mermaid in markdown docs"
  homepage "https://github.com/raghur/mermaid-filter"
  url "https://registry.npmjs.org/mermaid-filter/-/mermaid-filter-1.4.7.tgz"
  sha256 "61c60f8aa7cf669d11232c2623d484a71ce85864183b35bed8096f37aabefd51"
  license "BSD-2-Clause"
  head "https://github.com/raghur/mermaid-filter", branch: "master"

  depends_on "node"

  def install
    system "npm", "i", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system libexec/"bin/mermaid-filter"
  end
end
