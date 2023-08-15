cask "deskdockserver" do
  arch arm: "aarch64", intel: "x86"

  version "1.3.1"
  sha256 arm:   "6cc120dd52fa6c756301dffb944012feb056d6afbfe6bad318a259df2f7dbeb7",
         intel: "cfd7f4a1ebf779e04e9453fbfbd59e2087c34679150f12f77865e76bfe704c51"

  url "https://files.fdmobileinventions.com/DeskDockServer/#{version}/DeskDockServer_Mac_#{arch}_#{version}.zip"
  name "DeskDock Server"
  desc "Application for Android DeskDock to connect"
  homepage "https://www.fdmobileinventions.com/deskdock-server/"

  livecheck do
    skip
  end

  app "DeskDockServer_#{version}.app", target: "DeskDockServer.app"

  caveats <<~EOS
    For security reasons, #{token} must be installed to /Applications.
  EOS
end
