cask "ml-apc0010-tosinabasi" do
  version "ca77dfea95ff64ea76db71639ae91a1a"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_apc0010_tosinabasi/ml_apc0010_tosinabasi.aar"
  name "TosinAbasi"
  desc "ProducerPack"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_apc0010_tosinabasi/ml_apc0010_tosinabasi.aar"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  preflight do
    require "fileutils"
    target_dir = File.expand_path("~/Music/Logic Pro Library.bundle")
    FileUtils.mkdir_p(target_dir)
    system "aa", "extract", "-i", File.join(staged_path, "ml_apc0010_tosinabasi.aar").to_s, "-d",
           target_dir
  end

  zap trash: [
    "~/Music/Logic Pro Library.bundle/Apple Loops/Tosin Abasi",
    "~/Music/Logic Pro Library.bundle/Application Support/Package Definitions/ml_apc0010_tosinabasi.plist",
  ]
end
