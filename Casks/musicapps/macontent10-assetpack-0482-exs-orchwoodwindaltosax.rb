cask "macontent10-assetpack-0482-exs-orchwoodwindaltosax" do
  version "1a7ee0c40f9a420a2c89831ffaad82aa-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0482_EXS_OrchWoodwindAltoSax.pkg"
  name "MAContent10_AssetPack_0482_EXS_OrchWoodwindAltoSax"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0482_EXS_OrchWoodwindAltoSax.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0482_EXS_OrchWoodwindAltoSax.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0482_EXS_OrchWoodwindAltoSax"
end
