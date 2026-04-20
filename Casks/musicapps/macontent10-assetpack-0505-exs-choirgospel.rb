cask "macontent10-assetpack-0505-exs-choirgospel" do
  version "70daf9402255db24182638bbc4f0e6ec-7"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0505_EXS_ChoirGospel.pkg"
  name "MAContent10_AssetPack_0505_EXS_ChoirGospel"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0505_EXS_ChoirGospel.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0505_EXS_ChoirGospel.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0505_EXS_ChoirGospel"
end
