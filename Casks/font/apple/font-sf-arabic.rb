cask "font-sf-arabic" do
  version "20.0d1e1,20.0d1e2,1736100"
  sha256 "643e04537a5db4e2b350de8619aa34462af99549da0d5a4725e44febc7172833"

  # url "https://devimages-cdn.apple.com/design/resources/download/SF-Arabic.dmg"
  # sha256 "2760c62d502b77012c49517c2ea392ec2d4c647fe060985c927df48d105197b9"
  url "https://api.github.com/repos/BingoKingo/homebrew-private/releases/assets/280250053",
      verified: "github.com/",
      header:   ["Accept: application/octet-stream",
                 "Authorization: Bearer #{ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", nil)}",
                 "X-GitHub-Api-Version: 2022-11-28"]
  name "San Francisco Arabic"
  name "SF Arabic"
  homepage "https://developer.apple.com/fonts/"

  font "SF-Arabic.ttc"
  # No zap stanza required
end
