cask "macontent10-appleloopslegacyworld" do
  version "ac12b97c35de9bf4c5348716063a224d-69"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/MAContent10_AppleLoopsLegacyWorld.pkg"
  name "JamPackWorldMusicAppleLoopsPackage"
  desc "ContainsAppleLoops, MissingDownloadOnly, NeverUpdateLegacy"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2013/MAContent10_AppleLoopsLegacyWorld.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AppleLoopsLegacyWorld.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AppleLoopsLegacyWorld"
end
