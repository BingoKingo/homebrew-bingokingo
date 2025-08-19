cask "http-live-streaming-tools" do
  on_sonoma :or_older do
    version "1.23.14b"
    sha256 "6f0fd1b8629928816c33919f83f7f6d660fbc53a46ecd34559ad7f6121a80d96"

    url "https://download.developer.apple.com/QuickTime/http_live_streaming_tools/HTTPLiveStreamingTools#{version}.dmg",
        referer:    "https://developer.apple.com/",
        user_agent: :browser,
        cookies:    {
          "ADCDownloadAuth" => ENV.fetch("ADC_DOWNLOAD_AUTH", nil).to_s,
        }
  end
  on_sequoia :or_newer do
    version "1.25.36b"
    sha256 "529a4efb1e366b245d80b67344335a813b7cfbf2041fe0ee3055a26eaef10cac"

    url "https://download.developer.apple.com/macOS/HTTP_Live_Streaming_Tools_for_macOS_Sequoia_and_later/HTTPLiveStreamingTools#{version}.dmg",
        referer: "https://developer.apple.com/",
        cookies: {
          "ADCDownloadAuthCookie" => "",
        }
  end

  name "Http Live Streaming Tools for macOS"
  homepage "https://developer.apple.com/download/all/"

  pkg "HTTP Live Streaming Tools - #{version}.pkg"

  uninstall script:  {
              executable: "uninstall.tool",
              input:      ["Yes"],
              sudo:       true,
            },
            pkgutil: "com.apple.pkg.httpLiveStreamingTools"

  caveats do
    <<~EOS
      [L] Log in to https://developer.apple.com/download/ in your browser,
      get the value of the cookie `ADCDownloadAuth` from F12 Developer Tools,
      and paste it in your terminal before installation
           export ADC_DOWNLOAD_AUTH="Value"
    EOS
  end
end
