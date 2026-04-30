cask "ml-0038-vintagebreaks" do
  version "3cfca25860bfb02037508f16a31f3f1f"
  sha256 :no_check

  url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_0038_vintagebreaks/ml_0038_vintagebreaks.aar"
  name "VintageBreaks"
  desc "BreakbeatPack"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "https://audiocontentdownload.apple.com/universal/ContentPacks_3/ml_0038_vintagebreaks/ml_0038_vintagebreaks.aar"
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
    system "aa", "extract", "-i", File.join(staged_path, "ml_0038_vintagebreaks.aar").to_s, "-d",
           target_dir
  end

  zap trash: [
    "～/Music/Logic Pro Library.bundle/Apple Loops/Vintage Breaks",
    "～/Music/Logic Pro Library.bundle/Application Support/Package Definitions/ml_0038_vintagebreaks.plist",
  ]
end
