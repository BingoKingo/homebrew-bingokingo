cask "macontent10-assetpack-0506-exs-choirgospeleffects" do
  version "5e80a27648418f8e19f0ecfcc1e2620b-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0506_EXS_ChoirGospelEffects.pkg"
  name "MAContent10_AssetPack_0506_EXS_ChoirGospelEffects"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0506_EXS_ChoirGospelEffects.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0506_EXS_ChoirGospelEffects.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0506_EXS_ChoirGospelEffects"
end
