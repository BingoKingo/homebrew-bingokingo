cask "advanced-video-quality-tool" do
  version "1.0"
  sha256 :no_check

  url "https://download.developer.apple.com/Developer_Tools/Advanced_Video_Quality_Tool/AdvancedVideoQualityTool.dmg",
      referer:    "https://developer.apple.com/",
      user_agent: :browser,
      cookies:    {
        "ADCDownloadAuth" => ENV.fetch("ADC_DOWNLOAD_AUTH", nil).to_s,
      }
  # linux version
  # url "https://download.developer.apple.com/Developer_Tools/Advanced_Video_Quality_Tool/AdvancedVideoQualityTool_linux.dmg",
  #     referer: "https://developer.apple.com/"
  # sha256 "6fe42f46a9c47bcdccb25a7c09e70053ccdec3dbeb329a380886dfcf3bd99432"
  name "Advanced Video Quality Tool"
  homepage "https://developer.apple.com/download/all/"

  pkg "AVQT.pkg"

  uninstall pkgutil: "com.apple.pkg.AVQT"

  caveats do
    <<~EOS
      [L] Log in to https://developer.apple.com/download/ in your browser,
      get the value of the cookie `ADCDownloadAuth` from F12 Developer Tools,
      and paste it in your terminal before installation
           export ADC_DOWNLOAD_AUTH="Value"
    EOS
  end
end
