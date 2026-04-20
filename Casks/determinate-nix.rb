cask "determinate-nix" do
  version "3.17.3"
  sha256 "8cc2c4e9ab0aaa49a9f859a3cd94689055ff5bcfe3155dce1ac0b9e66ab1216d"

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
