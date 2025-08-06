cask "font-misans-latin" do
  version "4.007"

  url "https://hyperos.mi.com/font-download/MiSans_Latin.zip"
  name "MiSans Latin VF"
  homepage "https://hyperos.mi.com/font/en/details/latin/"
  if sha256 == "d24091ccd409a4152ffcc12cd659c16df9cdcdb4c702d8ae355b321e711f0004"
    font "MiSans Latin/可变字体/MiSansLatinVF.ttf"
  elsif sha256 == "501235d00ecd18b8e1f2fe972c96c4e30e0c073f3298d533094d3b653345a245"
    font "MiSans Latin/MiSans Latin VF.ttf"
  end

  # No zap stanza required
end
