cask "macontent10-assetpack-0273-alchemyvocalsfxnnoisesmisc" do
  version "88a4fb672e3159a23ea99ef48c51f70f-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0273_AlchemyVocalsFXNNoisesMisc.pkg"
  name "MAContent10_AssetPack_0273_AlchemyVocalsFXNNoisesMisc"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0273_AlchemyVocalsFXNNoisesMisc.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0273_AlchemyVocalsFXNNoisesMisc.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0273_AlchemyVocalsFXNNoisesMisc"
end
