cask "macontent10-assetpack-0210-alchemysynthsanalogambercheesehorror" do
  version "dcae1de970920d6678e0d4a3eb864338-2"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0210_AlchemySynthsAnalogAmberCheeseHorror.pkg"
  name "MAContent10_AssetPack_0210_AlchemySynthsAnalogAmberCheeseHorror"
  desc "ContainsAlchemyFiles, MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0210_AlchemySynthsAnalogAmberCheeseHorror.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0210_AlchemySynthsAnalogAmberCheeseHorror.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0210_AlchemySynthsAnalogAmberCheeseHorror"
end
