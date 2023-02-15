cask "opengithub" do
  version "0.2.10"
  url "https://github.com/Watson1978/OpenGithub/releases/download/v#{version}/OpenGithub.zip"
      verified: "github.com/Watson1978/OpenGithub/"
  name "OpenGithub"
  desc "Xcode extension to open the file on GitHub"
  homepage "https://github.com/Watson1978/OpenGithub"

  livecheck do
    url "https://github.com/Watson1978/OpenGithub/releases"
    regex(%r{href=["']?[^"' >]*?/tree/v?(\d+(?:[.-]\d+)+)?(?:[._-]+?(\d+(?:\.\d+)*))?["' >]}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map do |match|
        (match.length > 1) ? "#{match[0]},#{match[1]}" : match[0]
      end
    end
  end

  app "OpenGithub.app"

  zap trash: [
    "~/Library/Application Scripts/jp.cat-soft.OpenGithub",
    "~/Library/Application Scripts/jp.cat-soft.OpenGithub.OpenGithubExtension",
    "~/Library/Caches/com.fespinozacast.LinkedIdeas",
    "~/Library/Containers/jp.cat-soft.OpenGithub.OpenGithub",
    "~/Library/Containers/jp.cat-soft.OpenGithub.OpenGithubExtension",
    "~/Library/Preferences/jp.cat-soft.OpenGithub.OpenGithub.plist",
    "~/Library/Preferences/jp.cat-soft.OpenGithub.OpenGithubExtension.plist",
  ]
end
