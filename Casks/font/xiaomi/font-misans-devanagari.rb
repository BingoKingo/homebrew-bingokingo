cask "font-misans-devanagari" do
  version "1.000"
  sha256 "ce4066354951ddf234f5a0517078e034eb3dc5a710d72de7e47e7815731e78f8"

  url "https://hyperos.mi.com/font-download/MiSans_Devanagari.zip"
  name "MiSans Devanagari VF"
  homepage "https://hyperos.mi.com/font/en/details/devanagari/"

  font "MiSans Devanagari/MiSans Devanagari VF.ttf", target: "MiSansDevanagari.ttf"
end
