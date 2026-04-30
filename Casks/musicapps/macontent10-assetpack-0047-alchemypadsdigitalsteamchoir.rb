cask "macontent10-assetpack-0047-alchemypadsdigitalsteamchoir" do
  version "015cf338779da1ec33507de8beb43b86-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0047_AlchemyPadsDigitalSteamChoir.pkg"
  name "MAContent10_AssetPack_0047_AlchemyPadsDigitalSteamChoir"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0047_AlchemyPadsDigitalSteamChoir.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0047_AlchemyPadsDigitalSteamChoir.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0047_AlchemyPadsDigitalSteamChoir"
end
