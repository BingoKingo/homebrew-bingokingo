cask "macontent10-assetpack-0138-alchemyguitarspluckedforgottenharp" do
  version "7b64f91a5d5dcb4fb9f08d957c2d6df4-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0138_AlchemyGuitarsPluckedForgottenHarp.pkg"
  name "MAContent10_AssetPack_0138_AlchemyGuitarsPluckedForgottenHarp"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0138_AlchemyGuitarsPluckedForgottenHarp.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0138_AlchemyGuitarsPluckedForgottenHarp.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0138_AlchemyGuitarsPluckedForgottenHarp"
end
