cask "dicompreview" do
  version "0.1.0"
  sha256 "72c5c3c93b2d03e1c31f9276205d914bf55d9cd7cc7b17d608933604a518b277"

  url "https://github.com/neuralink/DicomPreview/releases/download/v#{version}/DicomPreview-#{version}.zip"
  name "DicomPreview"
  desc "QuickLook Application for viewing DICOMs"
  homepage "https://github.com/neuralink/DicomPreview/"

  container nested: "DicomPreview.dmg"

  app "DicomPreview.app"

  zap trash: [
    "~/Library/Application Scripts/com.neuralink.DicomPreview",
    "~/Library/Containers/com.neuralink.DicomPreview",
  ]
end
