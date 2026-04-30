cask "macontent10-assetpack-0963-exs-electronicdrumkitshardwellheavyindustry" do
  version "997f4e4ceaf4f7fe31a5c1f3352fecb8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0963_EXS_ElectronicDrumkitsHardwellHeavyIndustry.pkg"
  name "MAContent10_AssetPack_0963_EXS_ElectronicDrumkitsHardwellHeavyIndustry"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0963_EXS_ElectronicDrumkitsHardwellHeavyIndustry.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0963_EXS_ElectronicDrumkitsHardwellHeavyIndustry.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0963_EXS_ElectronicDrumkitsHardwellHeavyIndustry"
end
