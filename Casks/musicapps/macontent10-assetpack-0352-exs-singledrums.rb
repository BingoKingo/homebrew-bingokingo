cask "macontent10-assetpack-0352-exs-singledrums" do
  version "8cb583965ffc92ebd7af980e8930e965-15"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0352_EXS_SingleDrums.pkg"
  name "MAContent10_AssetPack_0352_EXS_SingleDrums"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0352_EXS_SingleDrums.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0352_EXS_SingleDrums.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0352_EXS_SingleDrums"
end
