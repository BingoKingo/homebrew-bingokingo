class BitwardenSmCli < Formula
  desc "Bitwarden Secrets Manager CLI"
  homepage "https://bitwarden.com/help/secrets-manager-cli/"
  url "https://github.com/bitwarden/sdk-sm/archive/refs/tags/bws-v2.0.0.tar.gz"
  sha256 "60ab649d847a3e7d3529e87d2919dab010abcd5df3457aad1c50240cbd2e7162"
  head "https://github.com/bitwarden/sdk-sm.git", branch: "main"

  depends_on "rust" => :build
  depends_on "python@3.13"

  def install
    cd "crates/bws" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    system bin/"bws", "-h"
  end
end
