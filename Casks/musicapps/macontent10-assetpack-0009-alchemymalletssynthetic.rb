cask "macontent10-assetpack-0009-alchemymalletssynthetic" do
  version "14ce408a2e146eb58c7b4522ccfa2724-16"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0009_AlchemyMalletsSynthetic.pkg"
  name "MAContent10_AssetPack_0009_AlchemyMalletsSynthetic"
  desc "ContainsAlchemyFiles"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0009_AlchemyMalletsSynthetic.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0009_AlchemyMalletsSynthetic.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0009_AlchemyMalletsSynthetic"
end
