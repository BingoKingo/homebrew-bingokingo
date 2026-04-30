cask "macontent10-assetpack-0494-exs-orchpercglockenspiel" do
  version "29774e32eaa1489ca00c9afd2f2b7744-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0494_EXS_OrchPercGlockenspiel.pkg"
  name "MAContent10_AssetPack_0494_EXS_OrchPercGlockenspiel"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0494_EXS_OrchPercGlockenspiel.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0494_EXS_OrchPercGlockenspiel.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0494_EXS_OrchPercGlockenspiel"
end
