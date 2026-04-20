cask "macontent10-assetpack-0199-alchemysynthsanalog1974" do
  version "ae8fd123ede1c0d779c24d9bb8df1518"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0199_AlchemySynthsAnalog1974.pkg"
  name "MAContent10_AssetPack_0199_AlchemySynthsAnalog1974"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0199_AlchemySynthsAnalog1974.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0199_AlchemySynthsAnalog1974.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0199_AlchemySynthsAnalog1974"
end
