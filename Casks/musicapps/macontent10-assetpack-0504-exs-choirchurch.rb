cask "macontent10-assetpack-0504-exs-choirchurch" do
  version "a6c96f3b639dc2c01e541ebd13aeebdb-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0504_EXS_ChoirChurch.pkg"
  name "MAContent10_AssetPack_0504_EXS_ChoirChurch"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0504_EXS_ChoirChurch.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0504_EXS_ChoirChurch.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0504_EXS_ChoirChurch"
end
