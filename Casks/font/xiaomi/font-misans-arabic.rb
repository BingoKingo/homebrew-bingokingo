cask "font-misans-arabic" do
  version :latest
  sha256 :no_check

  url "https://hyperos.mi.com/font-download/MiSans_Arabic.zip"
  name "MiSans Arabic VF"
  homepage "https://hyperos.mi.com/font/en/details/arabic/"

  font "MiSana Arabic/MiSansArabicVF.ttf"

  # No zap stanza required
end
