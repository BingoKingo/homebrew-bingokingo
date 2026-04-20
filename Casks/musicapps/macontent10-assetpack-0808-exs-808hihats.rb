cask "macontent10-assetpack-0808-exs-808hihats" do
  version "94ecb24bd4ce34bcea25412d2bd41331"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0808_EXS_808HiHats.pkg"
  name "MAContent10_AssetPack_0808_EXS_808HiHats"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/MAContent10_AssetPack_0808_EXS_808HiHats.pkg"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "MAContent10_AssetPack_0808_EXS_808HiHats.pkg"

  uninstall pkgutil: "com.apple.pkg.MAContent10_AssetPack_0808_EXS_808HiHats"
end
