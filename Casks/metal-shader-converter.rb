cask "metal-shader-converter" do
  version "3.0_beta_1"
  sha256 "a0982d1dde9ee3991b8a93ba9411990a8f4860b49ec42f0fb99f83a45b4a6b9a"

  url "https://download.developer.apple.com/Developer_Tools/Metal_Shader_Converter_#{version}/Metal_Shader_Converter_#{version}.pkg",
      referer:    "https://developer.apple.com/",
      user_agent: :browser,
      cookies:    {
        "ADCDownloadAuth" => ENV.fetch("ADC_DOWNLOAD_AUTH", nil).to_s,
      }
  name "Metal Shader Converter"
  homepage "https://developer.apple.com/download/all/"

  pkg "Metal_Shader_Converter_#{version}.pkg"

  uninstall script:  {
              executable: "uninstall.tool",
              input:      ["Yes"],
              sudo:       true,
            },
            pkgutil: "com.apple.metal"

  caveats do
    <<~EOS
      [L] Log in to https://developer.apple.com/download/ in your browser,
      get the value of the cookie `ADCDownloadAuth` from F12 Developer Tools,
      and paste it in your terminal before installation
           export ADC_DOWNLOAD_AUTH="Value"
    EOS
  end
end
