cask "kernel-debug-kit" do
  version "26.5,25F71"
  sha256 "90ed319cd1ba6e23d1eefcee89fa1b10743f4cf60b85208ae52aa9f45543c7aa"

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

  depends_on :macos

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
