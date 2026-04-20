cask "macontent10-assetpack-0609-alchemysettingscinematic" do
  version "be076ec1c89a559a840a009119d64301"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0609_AlchemySettingsCinematic.pkg"
  name "MAContent10_AssetPack_0609_AlchemySettingsCinematic"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0609_AlchemySettingsCinematic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0609_AlchemySettingsCinematic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0609_AlchemySettingsCinematic"
end
