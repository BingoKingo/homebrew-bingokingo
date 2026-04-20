cask "macontent10-assetpack-0526-drummerportland" do
  version "aec7df90fc5c2cecea3a62fc0ec2d368-41"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0526_DrummerPortland.pkg"
  name "MAContent10_AssetPack_0526_DrummerPortland"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0526_DrummerPortland.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0526_DrummerPortland.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0526_DrummerPortland"
end
