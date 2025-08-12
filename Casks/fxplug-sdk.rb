cask "fxplug-sdk" do
  version "4.3.3"
  sha256 "4fbcdf6f7e8ace29f953a75ef982109ae37a82d12822be2dee525f96b4f590b2"

  url "https://download.developer.apple.com/Developer_Tools/FxPlug_SDK_#{version}/FxPlug_SDK_#{version}.dmg",
      referer:    "https://developer.apple.com/",
      user_agent: :browser,
      cookies:    {
        "ADCDownloadAuth" => ENV.fetch("ADC_DOWNLOAD_AUTH", nil).to_s,
      }
  name "FxPlug SDK"
  homepage "https://developer.apple.com/download/all/"

  pkg "FxPlugSDK.pkg"

  uninstall script:  {
              executable: "uninstall.tool",
              input:      ["Yes"],
              sudo:       true,
            },
            pkgutil: "com.apple.pkg.FxPlugSDK"

  caveats do
    <<~EOS
      \033[1m[L]\033[0m Log in to https://developer.apple.com/download/ in your browser,
      get the value of the cookie `ADCDownloadAuth` from F12 Developer Tools,
      and paste it in your terminal before installation
           export ADC_DOWNLOAD_AUTH="Value"
    EOS
  end
end
