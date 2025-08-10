cask "font-misans-gurmukhi" do
  version "1.000"
  sha256 "54bcc86185ca2cda83f05128dd06e23eb1826dfc1b1ca6f65258c13344ba54a2"

  url "https://hyperos.mi.com/font-download/MiSans_Gurmukhi.zip"
  name "MiSans Gurmukhi VF"
  homepage "https://hyperos.mi.com/font/en/details/gurmukhi/"

  font "MiSans Gurmukhi/MiSans Gurmukhi VF.ttf", target: "MiSansGurmukhi.ttf"
end
