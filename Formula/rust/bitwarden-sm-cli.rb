class BitwardenSmCli < Formula
  desc "Bitwarden Secrets Manager CLI"
  homepage "https://bitwarden.com/help/secrets-manager-cli/"
  url "https://github.com/bitwarden/sdk-sm/archive/refs/tags/dotnet-v1.0.0.tar.gz"
  sha256 "a673b529f86778f903c600fa519f2547d746957394cd825730961d27a3f06144"
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
