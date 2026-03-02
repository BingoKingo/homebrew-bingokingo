cask "determinate-nix" do
  version "3.16.3"
  sha256 "9b39c499a3f12f1151008dbac58adbfb270c4437125db2720fec38bc2a4c3a1f"

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
