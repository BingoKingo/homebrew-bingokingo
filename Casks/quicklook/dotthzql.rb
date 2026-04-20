cask "dotthzql" do
  version "0.3.0"
  sha256 "1733ab5d66fdcbe6b735d0a7907a7de4ffdfe8144464b8127527d935d48590d7"

  url "https://github.com/hacknus/DotTHzQL/releases/download/#{version}/DotTHzQL-aarch64-apple-darwin.app.zip"
  name "DotTHzQL"
  desc "Quicklook plugin for dotTHz file structures and renders/previews imaging scans"
  homepage "https://github.com/hacknus/DotTHzQL/"

  # depends_on "hdf5"

  app "DotTHzQL.app"

  postflight do
    system_command "xattr",
                   args: [
                     "-c", "#{appdir}/DotTHzQL.app"
                   ]
  end

  zap trash: [
    "~/Library/Application Scripts/ch.unibe.DotTHzQL",
    "~/Library/Application Scripts/ch.unibe.DotTHzQL.DotTHzQLExtension",
    "~/Library/Containers/ch.unibe.DotTHzQL",
    "~/Library/Containers/ch.unibe.DotTHzQL.DotTHzQLExtension",
  ]

  caveats do
    <<~EOS
      Prerequisites:
      brew install hdf5
    EOS
  end
end
