# [R] Removed officially https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/mermaid-cli.rb, see https://github.com/Homebrew/homebrew-core/issues/100192
class MermaidCli < Formula
  desc "Command-line interface (CLI) for mermaid"
  homepage "https://github.com/mermaid-js/mermaid-cli"
  url "https://registry.npmjs.org/@mermaid-js/mermaid-cli/-/mermaid-cli-11.4.2.tgz"
  sha256 "5a46e845cd6cd05ac9ba5172acdadbe3daa878d8af4a15213b374fa5de96f0de"
  license "MIT"
  head "https://github.com/mermaid-js/mermaid-cli", branch: "master"

  depends_on "node"

  def install
    system "npm", "i", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
    bin.install_symlink "mmdc" => "mermaid"
  end

  test do
    (testpath/"test.mmd").write <<~EOS
      sequenceDiagram
          participant Alice
          participant Bob
          Alice->>John: Hello John, how are you?
          loop Healthcheck
              John->>John: Fight against hypochondria
          end
          Note right of John: Rational thoughts <br/>prevail!
          John-->>Alice: Great!
          John->>Bob: How about you?
          Bob-->>John: Jolly good!
    EOS

    (testpath/"puppeteer-config.json").write <<~EOS
      {
        "args": ["--no-sandbox"]
      }
    EOS

    system bin/"mmdc", "-p", "puppeteer-config.json", "-i", "#{testpath}/test.mmd", "-o", "#{testpath}/out.svg"
    assert_predicate testpath/"out.svg", :exist?
  end
end
