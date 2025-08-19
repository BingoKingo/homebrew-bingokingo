cask "font-tools-for-xcode" do
  version "26.beta.3"
  sha256 "321e41326473c77e8790b855ff2fe1721a90f8993ff35b4b05cf2135cc45f5f9"

  url "https://download.developer.apple.com/Developer_Tools/Font_Tools_for_Xcode_#{version.dots_to_underscores}/Font_Tools_for_Xcode_#{version.dots_to_underscores}.dmg",
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
