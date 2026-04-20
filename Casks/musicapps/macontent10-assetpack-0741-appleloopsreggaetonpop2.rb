cask "macontent10-assetpack-0741-appleloopsreggaetonpop2" do
  version "b31c2b207cec9616d144e9de5cb67918"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0741_AppleLoopsReggaetonPop2.pkg"
  name "MAContent10_AssetPack_0741_AppleLoopsReggaetonPop2"
  desc "ContainsAppleLoops, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0741_AppleLoopsReggaetonPop2.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0741_AppleLoopsReggaetonPop2.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0741_AppleLoopsReggaetonPop2"
end
