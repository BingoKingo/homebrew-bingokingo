cask "linkedideas" do
  version "0.6.6"
  sha256 "8c9cb3dfe010aef48bc5bd9c7531a5e91470342f2d9809c688e5c1a049a894ca"

  url "https://github.com/fespinoza/LinkedIdeas/releases/download/v#{version}/LinkedIdeas.app.zip",
      verified: "github.com/fespinoza/LinkedIdeas/"
  name "LinkedIdeas"
  desc "Treat ideas as links of concepts"
  homepage "https://fespinoza.github.io/LinkedIdeas/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "LinkedIdeas.app"

  zap trash: [
    "~/Library/Application Support/LinkedIdeas",
    "~/Library/Caches/com.fespinozacast.LinkedIdeas",
    "~/Library/HTTPStorages/com.fespinozacast.LinkedIdeas",
    "~/Library/Preferences/com.fespinozacast.LinkedIdeas.plist",
  ]
end
