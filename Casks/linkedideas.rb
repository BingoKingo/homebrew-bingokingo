cask "linkedideas" do
  version "0.6.6"
  url "https://github.com/fespinoza/LinkedIdeas/releases/download/v#{version}/LinkedIdeas.app.zip"
      verified: "github.com/fespinoza/LinkedIdeas/"
  name "LinkedIdeas"
  desc "Treat ideas as links of concepts"
  homepage "http://fespinoza.github.io/LinkedIdeas"

  livecheck do
    url "https://github.com/fespinoza/LinkedIdeas/releases?q=prerelease%3Afalse"
    regex(%r{href=["']?[^"' >]*?/tree/v?(\d+(?:[._-]\d+)+)(?:[._-]build(\d+))?(?:[._-]+?(\d+(?:\.\d+)*))?["' >]}i)
    strategy :page_match do |page, regex|
      page.scan(regex).map do |match|
        (match.length > 1) ? "#{match[0]},#{match[1]}" : match[0]
      end
    end
  end

  app "LinkedIdeas.app"

  zap trash: [
    "~/Library/Application Support/LinkedIdeas",
    "~/Library/Caches/com.fespinozacast.LinkedIdeas",
    "~/Library/HTTPStorages/com.fespinozacast.LinkedIdeas",
    "~/Library/Preferences/com.fespinozacast.LinkedIdeas.plist",
  ]
end
