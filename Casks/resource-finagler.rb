cask "resource-finagler" do
  version :latest
  sha256 :no_check

  url "https://markdouma.com/developer/ResourceFinagler.zip"
  name "Resource Finagler"
  desc "Developer tool for Apple Font Suitcase"
  homepage "https://markdouma.com/"

  app "Resource Finagler.app"

  zap trash: [
    "~/Library/Preferences/com.markdouma.ResourceFinagler.plist",
    "~/Library/Saved Application State/com.markdouma.ResourceFinagler.savedState",
  ]
end
