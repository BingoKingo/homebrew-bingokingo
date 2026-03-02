cask "fxplug-sdk" do
  version "4.3.4"
  sha256 "47f43137cf7ddff275b22c9f41a0545258ca574f77f9fbce9b40e8055b1c565b"

  url "https://download.developer.apple.com/Developer_Tools/FxPlug_SDK_#{version}/FxPlug_SDK_#{version}.dmg",
      referer:    "https://developer.apple.com/",
      user_agent: :browser,
      cookies:    {
        "ADCDownloadAuth" => ENV.fetch("ADC_DOWNLOAD_AUTH", nil).to_s,
      }
  name "FxPlug SDK"
  homepage "https://developer.apple.com/download/all/"

  pkg "FxPlugSDK.pkg"

  uninstall pkgutil: "com.apple.pkg.FxPlugSDK"

  caveats do
    <<~EOS
      [L] Log in to https://developer.apple.com/download/ in your browser,
      get the value of the cookie `ADCDownloadAuth` from F12 Developer Tools,
      and paste it in your terminal before installation
           export ADC_DOWNLOAD_AUTH="Value"
    EOS
  end
end
