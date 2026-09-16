cask "determinate-nix" do
  version "3.22.2"
  sha256 "2874f09c2192dd1ff2498fd2d36ba3cf4809b5739d5d859679f783a5ed2d066f"

  url "https://determinate-pkg20240826203520431200000001.s3.dualstack.us-east-2.amazonaws.com/v#{version}/Determinate.pkg-Universal",
      verified: "determinate-pkg20240826203520431200000001.s3.dualstack.us-east-2.amazonaws.com/"
  name "Determinate Nix Installer"
  homepage "https://determinate.systems/"

  livecheck do
    url "https://github.com/DeterminateSystems/nix-installer"
    strategy :github_latest
  end

  depends_on :macos

  pkg "Determinate.pkg"

  uninstall script:  {
              executable: "/nix/nix-installer",
              args:       ["uninstall"],
              input:      ["Y"],
              sudo:       true,
            },
            pkgutil: "systems.determinate.Determinate"
end
