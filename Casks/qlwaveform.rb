cask "qlwaveform" do
  version "1.0"
  sha256 "7242bd893c1b1f1a0e90e29304b1ca81767f9f2e995aaf85fe031799682c0780"

  url "https://github.com/seagirl/QLWaveForm/releases/download/v#{version}/QLWaveForm.qlgenerator.zip"
  name "QLWaveForm"
  desc "QuickLook plugin to view waveforms of audio files"
  homepage "https://github.com/seagirl/QLWaveForm/"

  qlplugin "QLWaveForm.qlgenerator"
end
