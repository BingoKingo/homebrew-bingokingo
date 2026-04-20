cask "macontent10-assetpack-0046-alchemypadsdigitalguitarpad" do
  version "f1bc49be2efd89368fe6e5ebc956a436-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0046_AlchemyPadsDigitalGuitarPad.pkg"
  name "MAContent10_AssetPack_0046_AlchemyPadsDigitalGuitarPad"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0046_AlchemyPadsDigitalGuitarPad.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0046_AlchemyPadsDigitalGuitarPad.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0046_AlchemyPadsDigitalGuitarPad"
end
