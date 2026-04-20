cask "macontent10-assetpack-0401-exs-texturesdronesopeningchannel" do
  version "a830f0baf525039149ce00f7990baa81"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0401_EXS_TexturesDronesOpeningChannel.pkg"
  name "MAContent10_AssetPack_0401_EXS_TexturesDronesOpeningChannel"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0401_EXS_TexturesDronesOpeningChannel.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0401_EXS_TexturesDronesOpeningChannel.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0401_EXS_TexturesDronesOpeningChannel"
end
