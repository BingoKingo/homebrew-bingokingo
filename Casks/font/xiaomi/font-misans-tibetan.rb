cask "font-misans-tibetan" do
  version "1.600"

  url "https://hyperos.mi.com/font-download/MiSans_Tibetan.zip"
  name "MiSans Tibetan VF"
  homepage "https://hyperos.mi.com/font/en/details/tibetan/"
  if sha256 == "168fc3be3c6ec9fe53550da63201691c99f329402c6fb85cf8aa4adbc14b964d"
    font "MiSans Tibetan/可变字体/MiSansTibetanVF.ttf"
  elsif sha256 == "96ae675ee6b594daffc3bc6bef9a415d6516e70abefe25ed6d5988dfcd64d5eb"
    font "MiSans Tibetan/MiSansTibetanVF.ttf"
  end

  # No zap stanza required
end
