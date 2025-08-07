# [O] This repository has been archived by the owner on Feb 24, 2023. It is now read-only.
cask "ql-ansilove" do
  version "1.0-beta"
  sha256 "7f01e90c7856dac2d93c87876f0739baa61702a58d50aedb24142e6091ac4c67"

  url "https://github.com/ansilove/QLAnsilove/releases/download/v#{version}/QLAnsilove-#{version}.zip"
  name "QLAnsilove"
  desc "Quick Look plugin for text-mode art"
  homepage "https://github.com/ansilove/QLAnsilove"

  qlplugin "QLAnsilove.qlgenerator"
end
