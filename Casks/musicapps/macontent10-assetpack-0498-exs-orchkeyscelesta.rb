cask "macontent10-assetpack-0498-exs-orchkeyscelesta" do
  version "2f962f2ad31adf344d7cbb5a193c03db-5"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0498_EXS_OrchKeysCelesta.pkg"
  name "MAContent10_AssetPack_0498_EXS_OrchKeysCelesta"
  desc "MissingDownloadOnly"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0498_EXS_OrchKeysCelesta.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0498_EXS_OrchKeysCelesta.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0498_EXS_OrchKeysCelesta"
end
