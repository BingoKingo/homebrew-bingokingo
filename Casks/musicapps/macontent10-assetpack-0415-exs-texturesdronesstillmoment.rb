cask "macontent10-assetpack-0415-exs-texturesdronesstillmoment" do
  version "210a646d359ebc8e32884f3112f8d405"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0415_EXS_TexturesDronesStillMoment.pkg"
  name "MAContent10_AssetPack_0415_EXS_TexturesDronesStillMoment"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0415_EXS_TexturesDronesStillMoment.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0415_EXS_TexturesDronesStillMoment.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0415_EXS_TexturesDronesStillMoment"
end
