cask "macontent10-assetpack-0207-alchemysynthsanalogfatndirty" do
  version "a2d7dfccee841d0157127d274e0f5866-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0207_AlchemySynthsAnalogFatNDirty.pkg"
  name "MAContent10_AssetPack_0207_AlchemySynthsAnalogFatNDirty"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0207_AlchemySynthsAnalogFatNDirty.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0207_AlchemySynthsAnalogFatNDirty.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0207_AlchemySynthsAnalogFatNDirty"
end
