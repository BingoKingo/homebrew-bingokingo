cask "resource-finagler" do
  version "1e6a9-5e95a5b80b34b"
  sha256 :no_check

  url "https://markdouma.com/developer/ResourceFinagler.zip"
  name "Resource Finagler"
  desc "Developer tool for Apple Font Suitcase"
  homepage "https://markdouma.com/"

  livecheck do
    url "https://markdouma.com/developer/ResourceFinagler.zip"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  app "Resource Finagler.app"

  zap trash: [
    "~/Library/Preferences/com.markdouma.ResourceFinagler.plist",
    "~/Library/Saved Application State/com.markdouma.ResourceFinagler.savedState",
  ]
end
