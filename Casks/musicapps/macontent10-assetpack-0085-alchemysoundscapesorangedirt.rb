cask "macontent10-assetpack-0085-alchemysoundscapesorangedirt" do
  version "df2f1aefbb36902f51bb7580d6624ffd-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0085_AlchemySoundscapesOrangeDirt.pkg"
  name "MAContent10_AssetPack_0085_AlchemySoundscapesOrangeDirt"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0085_AlchemySoundscapesOrangeDirt.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0085_AlchemySoundscapesOrangeDirt.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0085_AlchemySoundscapesOrangeDirt"
end
