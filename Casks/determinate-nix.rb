cask "determinate-nix" do
  version "3.17.0"
  sha256 "4cf11d764d6eb9baef1b2d696c03da4caefac0ff34ce413716808dc35bf5b4be"

  url "https://determinate-pkg20240826203520431200000001.s3.dualstack.us-east-2.amazonaws.com/v#{version}/Determinate.pkg-Universal",
      verified: "determinate-pkg20240826203520431200000001.s3.dualstack.us-east-2.amazonaws.com/"
  name "Determinate Nix Installer"
  homepage "https://determinate.systems/"

  livecheck do
    url "https://github.com/DeterminateSystems/nix-installer"
    strategy :github_latest
  end

  pkg "Determinate.pkg"

  uninstall script:  {
              executable: "/nix/nix-installer",
              args:       ["uninstall"],
              input:      ["Y"],
              sudo:       true,
            },
            pkgutil: "systems.determinate.Determinate"
end
