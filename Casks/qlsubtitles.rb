cask "qlsubtitles" do
  version "1.2.0"
  sha256 "0931efb9b048d3f71305c85782fd9fffb4cd1a8cbe2161a443e43b59f0e81142"

  url "https://github.com/riccoyu/QLSubtitles/releases/download/v#{version}/Quick.Look.Subtitles.zip"
  name "QLSubtitles"
  desc "Quick Look preview for subtitle files such as srt, vtt or ass files"
  homepage "https://github.com/riccoyu/QLSubtitles/"

  depends_on macos: ">= :big_sur"

  app "Quick Look Subtitles.app"

  zap trash: [
    "~/Library/Application Scripts/com.github.riccoyu.QLSubtitles",
    "~/Library/Application Scripts/com.github.riccoyu.QLSubtitles.PreviewSubtitles",
    "~/Library/Containers/com.github.riccoyu.QLSubtitles",
    "~/Library/Containers/com.github.riccoyu.QLSubtitles.PreviewSubtitles",
  ]
end
