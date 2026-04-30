cask "macontent10-assetpack-0487-exs-orchwoodwindflutesolo" do
  version "c650e328df4f574bf647372deb34cfaa-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0487_EXS_OrchWoodwindFluteSolo.pkg"
  name "MAContent10_AssetPack_0487_EXS_OrchWoodwindFluteSolo"
  desc "IsMandatory"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0487_EXS_OrchWoodwindFluteSolo.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0487_EXS_OrchWoodwindFluteSolo.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0487_EXS_OrchWoodwindFluteSolo"
end
