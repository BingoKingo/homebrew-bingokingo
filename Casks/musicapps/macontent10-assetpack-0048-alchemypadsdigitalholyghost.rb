cask "macontent10-assetpack-0048-alchemypadsdigitalholyghost" do
  version "8aa010df677902cba43a9c0b2e98ad7b-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0048_AlchemyPadsDigitalHolyGhost.pkg"
  name "MAContent10_AssetPack_0048_AlchemyPadsDigitalHolyGhost"
  desc "ContainsAlchemyFiles, IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0048_AlchemyPadsDigitalHolyGhost.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0048_AlchemyPadsDigitalHolyGhost.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0048_AlchemyPadsDigitalHolyGhost"
end
