cask "macontent10-assetpack-0483-exs-orchwoodwindbasson" do
  version "bba90cefce5b45f3f0d109e0cd810fcc-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0483_EXS_OrchWoodwindBasson.pkg"
  name "MAContent10_AssetPack_0483_EXS_OrchWoodwindBasson"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0483_EXS_OrchWoodwindBasson.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0483_EXS_OrchWoodwindBasson.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0483_EXS_OrchWoodwindBasson"
end
