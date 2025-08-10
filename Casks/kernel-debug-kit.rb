cask "kernel-debug-kit" do
  version "26.0,25A5279m"
  sha256 "eb2e2b7dd534282c45c2d295e8b9a68f82cc6e5d52984949ca9be0685ca90cb1"

  url "https://download.developer.apple.com/macOS/Kernel_Debug_Kit_#{version.csv.first}_build_#{version.csv.second}/Kernel_Debug_Kit_#{version.csv.first}_build_#{version.csv.second}.dmg",
      referer:    "https://developer.apple.com/",
      user_agent: :browser,
      cookies:    {
        "ADCDownloadAuth" => ENV.fetch("ADC_DOWNLOAD_AUTH", nil).to_s,
      }
  name "Kernel Debug Kit"
  homepage "https://developer.apple.com/download/all/"

  pkg "KernelDebugKit.pkg"

  uninstall script:  {
              executable: "uninstall.tool",
              input:      ["Yes"],
              sudo:       true,
            },
            pkgutil: ["com.apple.pkg.KDK.#{version.csv.second}",
                      "com.apple.pkg.KDK_SDK.#{version.csv.second}"]

  caveats do
    <<~EOS
           [L] Log in to https://developer.apple.com/download/ in your browser,
      get the value of the cookie `ADCDownloadAuth` from F12 Developer Tools,
      and paste it in your terminal before installation
           export ADC_DOWNLOAD_AUTH="Value"
    EOS
  end
end
