cask "macontent10-appleloopslegacy1" do
  version "a23d0cc0a5d427dce64dde2129a4e5ba-54"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/MAContent10_AppleLoopsLegacy1.pkg"
  name "JamPack1AppleLoopsPackage"
  desc "ContainsAppleLoops, MissingDownloadOnly, NeverUpdateLegacy"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/MAContent10_AppleLoopsLegacy1.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AppleLoopsLegacy1.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AppleLoopsLegacy1"
end
