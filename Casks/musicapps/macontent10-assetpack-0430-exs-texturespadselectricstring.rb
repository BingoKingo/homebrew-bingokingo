cask "macontent10-assetpack-0430-exs-texturespadselectricstring" do
  version "d44fc9b35ba946f20df8c3758df1345e"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0430_EXS_TexturesPadsElectricString.pkg"
  name "MAContent10_AssetPack_0430_EXS_TexturesPadsElectricString"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0430_EXS_TexturesPadsElectricString.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0430_EXS_TexturesPadsElectricString.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0430_EXS_TexturesPadsElectricString"
end
