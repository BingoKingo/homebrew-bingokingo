cask "qlcodec" do
  version "1.1"

  on_ventura :or_older do
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

    url "https://github.com/Oil3/QLCodec/releases/download/QLC-#{version}-universalBinary/QLcodec-Legacy-2.92-BigSur.zip"
  end
  on_sonoma :or_newer do
    sha256 "cebb6546df248cc67dfccb355c973cd499afa21238db11664974847c58cb0463"

    url "https://github.com/Oil3/QLCodec/releases/download/QLC-#{version}-universalBinary/QLC-extraMkvTypesSupport.zip"
  end

  name "QLCodec"
  desc "QuickLook extension for unsupported video and audio formats"
  homepage "https://github.com/Oil3/QLCodec/"

  app "QLC.app"

  zap trash: [
    "~/Library/Application Scripts/com.oil3.QLC",
    "~/Library/Application Scripts/com.oil3.QLC.QLC-icons",
    "~/Library/Application Scripts/com.oil3.QLC.QLC-quicklook",
    "~/Library/Containers/com.oil3.QLC",
    "~/Library/Containers/com.oil3.QLC.QLC-icons",
    "~/Library/Containers/com.oil3.QLC.QLC-quicklook",
  ]
end
