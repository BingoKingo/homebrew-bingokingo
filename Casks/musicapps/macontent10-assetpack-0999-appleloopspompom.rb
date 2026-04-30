cask "macontent10-assetpack-0999-appleloopspompom" do
  version "cd1bb964af918c671798853e0cd55400"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0999_AppleLoopsPomPom.pkg"
  name "MAContent10_AssetPack_0999_AppleLoopsPomPom"
  desc "ContainsAppleLoops"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0999_AppleLoopsPomPom.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0999_AppleLoopsPomPom.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0999_AppleLoopsPomPom"
end
