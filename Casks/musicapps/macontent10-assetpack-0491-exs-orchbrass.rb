cask "macontent10-assetpack-0491-exs-orchbrass" do
  version "54151c569dd0845676d6c05c81e90c93-24"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0491_EXS_OrchBrass.pkg"
  name "MAContent10_AssetPack_0491_EXS_OrchBrass"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0491_EXS_OrchBrass.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0491_EXS_OrchBrass.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0491_EXS_OrchBrass"
end
