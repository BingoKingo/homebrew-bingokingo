cask "macontent10-assetpack-0297-alchemydrumselectronicai" do
  version "a152bbc514a015040f27fb8bb63a7786-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0297_AlchemyDrumsElectronicAI.pkg"
  name "MAContent10_AssetPack_0297_AlchemyDrumsElectronicAI"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0297_AlchemyDrumsElectronicAI.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0297_AlchemyDrumsElectronicAI.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0297_AlchemyDrumsElectronicAI"
end
