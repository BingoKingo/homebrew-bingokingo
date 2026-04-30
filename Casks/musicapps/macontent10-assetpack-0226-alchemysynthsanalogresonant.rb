cask "macontent10-assetpack-0226-alchemysynthsanalogresonant" do
  version "32d17f9fc92a45a74896c61fac1d3994-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0226_AlchemySynthsAnalogResonant.pkg"
  name "MAContent10_AssetPack_0226_AlchemySynthsAnalogResonant"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0226_AlchemySynthsAnalogResonant.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0226_AlchemySynthsAnalogResonant.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0226_AlchemySynthsAnalogResonant"
end
