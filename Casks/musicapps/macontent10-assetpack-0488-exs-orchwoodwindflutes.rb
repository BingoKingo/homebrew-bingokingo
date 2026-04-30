cask "macontent10-assetpack-0488-exs-orchwoodwindflutes" do
  version "e8cc6bd194c90b1a44b3b330ae49dcbf-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0488_EXS_OrchWoodwindFlutes.pkg"
  name "MAContent10_AssetPack_0488_EXS_OrchWoodwindFlutes"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0488_EXS_OrchWoodwindFlutes.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0488_EXS_OrchWoodwindFlutes.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0488_EXS_OrchWoodwindFlutes"
end
