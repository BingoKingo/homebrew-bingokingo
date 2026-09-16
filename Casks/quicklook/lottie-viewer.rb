cask "lottie-viewer" do
  version "1.7.4"
  sha256 "b7ffcd3fd735841874d2e0cfeac154a4987eeb1500a33ddbfcb0e8fb6e872acf"

  url "https://github.com/mkj-is/LottieViewerMac/releases/download/#{version}/LottieViewer.zip"
  name "LottieViewer"
  desc "Lottie animations Viewer"
  homepage "https://github.com/mkj-is/LottieViewerMac/"

  depends_on macos: :sonoma

  app "LottieViewer.app"

  zap trash: [
    "~/Library/Application Scripts/dev.mkj.LottieViewer",
    "~/Library/Application Scripts/dev.mkj.LottieViewer.Preview",
    "~/Library/Containers/dev.mkj.LottieViewer",
    "~/Library/Containers/dev.mkj.LottieViewer.Preview",
  ]
end
