cask "macontent10-assetpack-0145-alchemyguitarspluckedharp" do
  version "848330b883a3587dcad3f8bb37c52059-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0145_AlchemyGuitarsPluckedHarp.pkg"
  name "MAContent10_AssetPack_0145_AlchemyGuitarsPluckedHarp"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0145_AlchemyGuitarsPluckedHarp.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0145_AlchemyGuitarsPluckedHarp.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0145_AlchemyGuitarsPluckedHarp"
end
