cask "dotthzql" do
  version "0.2.0"
  sha256 "ca3b6a54efff28b81c4c39cd4c136fdd3e0841afb41dbcf6ec2ebfe1dde6bb2d"

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
