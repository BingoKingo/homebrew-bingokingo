cask "font-misans-devanagari" do
  version :latest
  sha256 :no_check

  url "https://hyperos.mi.com/font-download/MiSans_Devanagari.zip"
  name "MiSans Devanagari VF"
  homepage "https://hyperos.mi.com/font/en/details/devanagari/"

  font "MiSans Devanagari/MiSans Devanagari VF.ttf"

  # No zap stanza required
end
