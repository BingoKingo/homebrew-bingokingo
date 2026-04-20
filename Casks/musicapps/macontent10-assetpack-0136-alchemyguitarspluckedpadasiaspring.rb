cask "macontent10-assetpack-0136-alchemyguitarspluckedpadasiaspring" do
  version "534b330e003c7b62c80d9c3e4dc9388f-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0136_AlchemyGuitarsPluckedPadAsiaSpring.pkg"
  name "MAContent10_AssetPack_0136_AlchemyGuitarsPluckedPadAsiaSpring"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0136_AlchemyGuitarsPluckedPadAsiaSpring.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0136_AlchemyGuitarsPluckedPadAsiaSpring.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0136_AlchemyGuitarsPluckedPadAsiaSpring"
end
