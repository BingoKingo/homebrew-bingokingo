cask "macontent10-assetpack-0489-exs-orchwoodwindoboesolo" do
  version "f2d2e1cff919b2852af3814b8f3cbffc-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0489_EXS_OrchWoodwindOboeSolo.pkg"
  name "MAContent10_AssetPack_0489_EXS_OrchWoodwindOboeSolo"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0489_EXS_OrchWoodwindOboeSolo.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0489_EXS_OrchWoodwindOboeSolo.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0489_EXS_OrchWoodwindOboeSolo"
end
