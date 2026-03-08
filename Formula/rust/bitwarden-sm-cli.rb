class BitwardenSmCli < Formula
  desc "Bitwarden Secrets Manager CLI"
  homepage "https://bitwarden.com/help/secrets-manager-cli/"
  url "https://github.com/bitwarden/sdk-sm/archive/refs/tags/bws-v2.0.0.tar.gz"
  sha256 "60ab649d847a3e7d3529e87d2919dab010abcd5df3457aad1c50240cbd2e7162"
  head "https://github.com/bitwarden/sdk-sm.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "60a6eb771722b49e1686132242c647af7001f72057353d65e663ec45b0baa9e6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2ad24f47687b3f6b5f84724752a479217d1e8142745c5e7a5b1f135c2bd1107e"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "9cda33b6031bb0057c0cfd6d57f377cad6c07527b03b6e2cc69979c4667f622e"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "5cb55298bcb662702de90c88cd1248af08ecef76f014d20da414ab104f4a4f6c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5f5443fccd7c1e72a4fcf8cb1b9e2df7e8117397a0247c8eaeed6e5d281128dc"
  end

  depends_on "rust" => :build
  depends_on "python@3.13"

  def install
    cd "crates/bws" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    output = shell_output("#{bin}/bws -h")
    assert_match "Bitwarden Secrets CLI", output
    assert_match "Usage", output
    assert_match "Commands", output
    assert_match "Options", output
    version_output = shell_output("#{bin}/bws -V")
    assert_match "bws #{version}", version_output
  end
end
