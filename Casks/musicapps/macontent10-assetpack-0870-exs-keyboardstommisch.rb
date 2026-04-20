cask "macontent10-assetpack-0870-exs-keyboardstommisch" do
  version "84694e3f22d50067919f79ca80d210bc-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0870_EXS_KeyboardsTomMisch.pkg"
  name "MAContent10_AssetPack_0870_EXS_KeyboardsTomMisch"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0870_EXS_KeyboardsTomMisch.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0870_EXS_KeyboardsTomMisch.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0870_EXS_KeyboardsTomMisch"
end
