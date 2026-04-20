cask "macontent10-assetpack-0515-drummerseventiesplexistadium" do
  version "1b242b5a892eb8a8a8a3008e0b2e3b59-202"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0515_DrummerSeventiesPlexiStadium.pkg"
  name "MAContent10_AssetPack_0515_DrummerSeventiesPlexiStadium"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0515_DrummerSeventiesPlexiStadium.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0515_DrummerSeventiesPlexiStadium.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0515_DrummerSeventiesPlexiStadium"
end
