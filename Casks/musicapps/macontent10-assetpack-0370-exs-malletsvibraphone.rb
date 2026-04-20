cask "macontent10-assetpack-0370-exs-malletsvibraphone" do
  version "c4256f3821f0dbe4abf20030ce63e223-4"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0370_EXS_MalletsVibraphone.pkg"
  name "MAContent10_AssetPack_0370_EXS_MalletsVibraphone"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0370_EXS_MalletsVibraphone.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0370_EXS_MalletsVibraphone.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0370_EXS_MalletsVibraphone"
end
