cask "vrmquicklook" do
  version "0.1.1"
  sha256 "e8cd1d9547a1596fff2549b0015f573891385889088ba10197da41289a7904ef"

  url "https://github.com/magicien/VRMQuickLook/releases/download/v#{version}/VRMQuickLook_v#{version}.zip"
  name "VRMQuickLook"
  desc "QuickLook plugin for VRM files"
  homepage "https://github.com/magicien/VRMQuickLook/"

  livecheck do
    url :url
    strategy :github_latest
  end

  qlplugin "VRMQuickLook_v#{version}/VRMQuickLook.qlgenerator"
end
