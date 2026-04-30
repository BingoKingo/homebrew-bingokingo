cask "macontent10-assetpack-0267-alchemyvocalsfxnnoisessinglesamples" do
  version "91e7deb4354268c3df928ba87dd807f9"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0267_AlchemyVocalsFXNNoisesSingleSamples.pkg"
  name "MAContent10_AssetPack_0267_AlchemyVocalsFXNNoisesSingleSamples"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0267_AlchemyVocalsFXNNoisesSingleSamples.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0267_AlchemyVocalsFXNNoisesSingleSamples.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0267_AlchemyVocalsFXNNoisesSingleSamples"
end
