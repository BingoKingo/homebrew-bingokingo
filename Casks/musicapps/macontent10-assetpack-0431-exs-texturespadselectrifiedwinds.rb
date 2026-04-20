cask "macontent10-assetpack-0431-exs-texturespadselectrifiedwinds" do
  version "ce0ea78353c2603fa421d260ee16aefb"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0431_EXS_TexturesPadsElectrifiedWinds.pkg"
  name "MAContent10_AssetPack_0431_EXS_TexturesPadsElectrifiedWinds"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0431_EXS_TexturesPadsElectrifiedWinds.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0431_EXS_TexturesPadsElectrifiedWinds.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0431_EXS_TexturesPadsElectrifiedWinds"
end
