cask "macontent10-assetpack-0464-exs-worldeurometaldrumping" do
  version "f963db198815f062e028d3918d4accf7-21"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0464_EXS_WorldEuroMetalDrumPing.pkg"
  name "MAContent10_AssetPack_0464_EXS_WorldEuroMetalDrumPing"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0464_EXS_WorldEuroMetalDrumPing.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0464_EXS_WorldEuroMetalDrumPing.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0464_EXS_WorldEuroMetalDrumPing"
end
