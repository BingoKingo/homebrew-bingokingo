cask "metal-shader-converter" do
  version "3.1_beta_1"
  sha256 "4fb9ab1022c1a2977979577d5510958dd52ae769d8cf7bf4757f4b2f09b853bd"

  url "https://download.developer.apple.com/Developer_Tools/Metal_Shader_Converter_#{version}/Metal_Shader_Converter_#{version}.pkg",
      referer:    "https://developer.apple.com/",
      user_agent: :browser,
      cookies:    {
        "ADCDownloadAuth" => ENV.fetch("ADC_DOWNLOAD_AUTH", nil).to_s,
      }
  name "Metal Shader Converter"
  homepage "https://developer.apple.com/download/all/"

  pkg "Metal_Shader_Converter_#{version}.pkg"

  uninstall pkgutil: "com.apple.metal"

  caveats do
    <<~EOS
      [L] Log in to https://developer.apple.com/download/ in your browser,
      get the value of the cookie `ADCDownloadAuth` from F12 Developer Tools,
      and paste it in your terminal before installation
           export ADC_DOWNLOAD_AUTH="Value"
    EOS
  end
end
