cask "kernel-debug-kit" do
  version "26.4,25E5233c"
  sha256 "25989a9d2c56ffcdfcdf34b631e007ef23dac599ba44d4c775df561fa3372052"

  url "https://download.developer.apple.com/macOS/Kernel_Debug_Kit_#{version.csv.first}_build_#{version.csv.second}/Kernel_Debug_Kit_#{version.csv.first}_build_#{version.csv.second}.dmg",
      referer:    "https://developer.apple.com/",
      user_agent: :browser,
      cookies:    {
        "ADCDownloadAuth" => ENV.fetch("ADC_DOWNLOAD_AUTH", nil).to_s,
      }
  name "Kernel Debug Kit"
  homepage "https://developer.apple.com/download/all/"

  livecheck do
    url "https://raw.githubusercontent.com/dortania/KdkSupportPkg/refs/heads/gh-pages/manifest.json"
    strategy :json do |json|
      json.filter_map do |item|
        version = item["version"]
        build = item["build"]
        "#{version},#{build}" if version && build
      end
    end
  end

  pkg "KernelDebugKit.pkg"

  uninstall pkgutil: ["com.apple.pkg.KDK.#{version.csv.second}",
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
