cask "macontent10-assetpack-0374-exs-guitarsacousticsteelstring" do
  version "af89f20564dfa5e8d164c18b46283de7-3"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0374_EXS_GuitarsAcousticSteelString.pkg"
  name "MAContent10_AssetPack_0374_EXS_GuitarsAcousticSteelString"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0374_EXS_GuitarsAcousticSteelString.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0374_EXS_GuitarsAcousticSteelString.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0374_EXS_GuitarsAcousticSteelString"
end
