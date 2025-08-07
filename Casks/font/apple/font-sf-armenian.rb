cask "font-sf-armenian" do
  version "19.0d5e1,20.0d1e1,359120"
  sha256 "92a9243f2282f58beb736e3cab56068a5f1c95ba956e52fbaa96a1c43613126e"

  # url "https://devimages-cdn.apple.com/design/resources/download/SF-Armenian.dmg"
  # sha256 "ffd715ae93d7c215be3f434b84624184779bb50b2bb3d66b8fd42880c65fadad"
  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/280250024",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "San Francisco Armenian"
  name "SF Armenian"
  homepage "https://developer.apple.com/fonts/"

  font "SF-Armenian.ttc"
  # No zap stanza required
end
