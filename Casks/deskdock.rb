cask "deskdock" do
  arch arm: "aarch64", intel: "x86"

  version "1.3.1"
  sha256 "6cc120dd52fa6c756301dffb944012feb056d6afbfe6bad318a259df2f7dbeb7"

  url "https://files.fdmobileinventions.com/DeskDockServer/#{version}/DeskDockServer_Mac_#{arch}_#{version}.zip"
  name "DeskDock Server"
  desc "DeskDockServer application for Android DeskDock to connect"
  homepage "https://www.fdmobileinventions.com/deskdock-server/"

  livecheck do
    skip
  end

  app "DeskDockServer_#{version}.app", target: "DeskDockServer.app"

  caveats <<~EOS
    For security reasons, #{token} must be installed to /Applications.
  EOS
end
