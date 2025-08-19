cask "device-support-for-xcode" do
  version "15,08259686A,1950A4"
  sha256 "6060a89f336d246384cfc396afd772dd07c80ebcb2c8b5eced6826ace8ad08b5"

  url "https://developer.apple.com/services-account/download?path=/Developer_ToolsDevice_Support_for_macOS_#{version.csv.first}_beta/#{version.csv.second}_MobileDevice_DeviceSupport_LuckMobileDeviceSeed#{version.csv.third}.dmg",
      referer:    "https://developer.apple.com/",
      user_agent: :browser,
      cookies:    {
        "ADCDownloadAuth" => ENV.fetch("ADC_DOWNLOAD_AUTH", nil).to_s,
      }
  name "Device Support for Xcode"
  homepage "https://developer.apple.com/download/all/"

  pkg "DeviceSupport.pkg"

  uninstall script:  {
              executable: "uninstall.tool",
              input:      ["Yes"],
              sudo:       true,
            },
            pkgutil: ["com.apple.pkg.CoreTypes.#{version.csv.third}",
                      "com.apple.pkg.MobileDevice"]

  caveats do
    <<~EOS
      [L] Log in to https://developer.apple.com/download/ in your browser,
      get the value of the cookie `ADCDownloadAuth` from F12 Developer Tools,
      and paste it in your terminal before installation
           export ADC_DOWNLOAD_AUTH="Value"
    EOS
  end
end
