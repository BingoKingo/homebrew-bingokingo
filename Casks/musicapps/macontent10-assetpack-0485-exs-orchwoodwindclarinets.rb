cask "macontent10-assetpack-0485-exs-orchwoodwindclarinets" do
  version "8deaf0a0571f48e8b1c60be18b694987-8"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0485_EXS_OrchWoodwindClarinets.pkg"
  name "MAContent10_AssetPack_0485_EXS_OrchWoodwindClarinets"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0485_EXS_OrchWoodwindClarinets.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0485_EXS_OrchWoodwindClarinets.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0485_EXS_OrchWoodwindClarinets"
end
