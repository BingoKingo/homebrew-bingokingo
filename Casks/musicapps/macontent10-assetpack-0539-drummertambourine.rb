cask "macontent10-assetpack-0539-drummertambourine" do
  version "31ad7a924a69ca5e54976a65f51e6956-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0539_DrummerTambourine.pkg"
  name "MAContent10_AssetPack_0539_DrummerTambourine"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0539_DrummerTambourine.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0539_DrummerTambourine.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0539_DrummerTambourine"
end
