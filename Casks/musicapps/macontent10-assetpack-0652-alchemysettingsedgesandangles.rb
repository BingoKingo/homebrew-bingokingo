cask "macontent10-assetpack-0652-alchemysettingsedgesandangles" do
  version "f495ebc2bca5fdaba7cf1f9b0ed86020"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0652_AlchemySettingsEdgesAndAngles.pkg"
  name "MAContent10_AssetPack_0652_AlchemySettingsEdgesAndAngles"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0652_AlchemySettingsEdgesAndAngles.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0652_AlchemySettingsEdgesAndAngles.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0652_AlchemySettingsEdgesAndAngles"
end
