cask "font-tools-for-xcode" do
  version "26.1"
  sha256 "1015029d4cb006d024573de0f96a7f2ee8274607dc61ad8ae4e96ae74f82cf2f"

  url "https://download.developer.apple.com/Developer_Tools/Font_Tools_for_Xcode_#{version}/Font_Tools_for_Xcode_#{version}.dmg",
      referer:    "https://developer.apple.com/",
      user_agent: :browser,
      cookies:    {
        "ADCDownloadAuth" => ENV.fetch("ADC_DOWNLOAD_AUTH", nil).to_s,
      }
  name "Font Tools for Xcode"
  homepage "https://developer.apple.com/download/all/"

  pkg "macOS Font Tools.pkg"

  uninstall pkgutil: ["com.apple.pkg.FontCommandLineTools",
                      "com.apple.pkg.FontToolboxFramework",
                      "com.apple.pkg.FontToolsApplications"]

  caveats do
    <<~EOS
      [L] Log in to https://developer.apple.com/download/ in your browser,
      get the value of the cookie `ADCDownloadAuth` from F12 Developer Tools,
      and paste it in your terminal before installation
           export ADC_DOWNLOAD_AUTH="Value"
    EOS
  end
end
