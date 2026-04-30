cask "workflow-extensions-sdk" do
  version "1.0.3"
  sha256 "fbd245c2d1439a93b86284cce2b6bb028fddea90d76aa4960d48502fa05c376a"

  url "https://download.developer.apple.com/Developer_Tools/Workflow_Extensions_SDK_#{version}/Workflow_Extensions_SDK_#{version}.dmg",
      referer:    "https://developer.apple.com/",
      user_agent: :browser,
      cookies:    {
        "ADCDownloadAuth" => ENV.fetch("ADC_DOWNLOAD_AUTH", nil).to_s,
      }
  name "Workflow Extensions SDK"
  homepage "https://developer.apple.com/download/all/"

  pkg "WorkflowExtensionsSDK.pkg"

  uninstall pkgutil: "com.apple.pkg.WorkflowExtensionsSDK"

  caveats do
    <<~EOS
      [L] Log in to https://developer.apple.com/download/ in your browser,
      get the value of the cookie `ADCDownloadAuth` from F12 Developer Tools,
      and paste it in your terminal before installation
           export ADC_DOWNLOAD_AUTH="Value"
    EOS
  end
end
