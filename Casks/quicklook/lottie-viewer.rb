cask "lottie-viewer" do
  version "1.7.0"
  sha256 "4ede1e53192d5854e48df5702ba47a4ad98ae9bb67635b8ebce26b16ec35e2c5"

  url "https://github.com/mkj-is/LottieViewerMac/releases/download/#{version}/Lottie.Preview.app.zip"
  name "LottieViewer"
  desc "Lottie animations Viewer"
  homepage "https://github.com/mkj-is/LottieViewerMac/"

  depends_on macos: ">=:sonoma"

  app "Lottie Preview.app"

  zap trash: [
    "~/Library/Application Scripts/dev.mkj.LottieViewer",
    "~/Library/Application Scripts/dev.mkj.LottieViewer.Preview",
    "~/Library/Containers/dev.mkj.LottieViewer",
    "~/Library/Containers/dev.mkj.LottieViewer.Preview",
  ]
end
