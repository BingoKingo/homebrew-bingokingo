class Sidejitserver < Formula
  include Language::Python::Virtualenv
  desc "iOS 17 JIT enabler"
  homepage "https://github.com/nythepegasus/SideJITServer/"
  url "https://files.pythonhosted.org/packages/1a/70/f954194855d5a9871526fa9e92dc4201f59ce68e517be54c3e9f4c3f043c/sidejitserver-1.4.2.tar.gz"
  sha256 "12b09bd1c970920b3ccdebfb83303ef7698c8f2a16356a26d9396445c1dff611"
  license "GPL-3.0-or-later"
  head "https://github.com/nythepegasus/SideJITServer.git", branch: "main"

  # depends_on "chardet"
  depends_on "cmake" => :build
  # depends_on "fastapi"
  # depends_on "ipython"
  depends_on "python-setuptools" => :build
  depends_on "rust" => :build
  depends_on "libusb"
  depends_on "maturin"
  depends_on "openssl"
  # depends_on "pygments"
  depends_on "python-packaging"
  depends_on "python@3.13"
  depends_on "pyyaml"
  depends_on "rich-cli"
  # depends_on "uvicorn"
  # depends_on "xonsh"

  resource "aiofiles" do
    url "https://files.pythonhosted.org/packages/0b/03/a88171e277e8caa88a4c77808c20ebb04ba74cc4681bf1e9416c862de237/aiofiles-24.1.0.tar.gz"
    sha256 "22a075c9e5a3810f0c2e48f3008c94d68c65d763b9b03857924c99e57355166c"
  end

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5/annotated_types-0.7.0.tar.gz"
    sha256 "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/95/7d/4c1bd541d4dffa1b52bd83fb8527089e097a106fc90b467a7313b105f840/anyio-4.9.0.tar.gz"
    sha256 "673c0c244e15788651a4ff38710fea9675823028a6f08a5eda409e0c9840a028"
  end

  resource "apple-compress" do
    url "https://files.pythonhosted.org/packages/91/14/cdb0bdb6147a019d2d8a1e144910c6a8d257d0e58f63bbd105bda0fce7dc/apple_compress-0.2.3.tar.gz"
    sha256 "a1c855cec8bd73210ae9522c53a841ca515ded2f0c9d5b4e728d0d93fee46a29"
  end

  resource "arrow" do
    url "https://files.pythonhosted.org/packages/2e/00/0f6e8fcdb23ea632c866620cc872729ff43ed91d284c866b515c6342b173/arrow-1.3.0.tar.gz"
    sha256 "d4540617648cb5f895730f1ad8c82a65f2dad0166f57b75f3ca54759c4d67a85"
  end

  resource "asn1" do
    url "https://files.pythonhosted.org/packages/00/35/9d0709bf09340ddb1796dfc52d1b1ef2f18e690b5cbf32b7be02c702532c/asn1-2.8.0.tar.gz"
    sha256 "adf77ddc2707cf420c0eae3b99ee30e913afcf0936467d42669820ce6b7d150a"
  end

  resource "asttokens" do
    url "https://files.pythonhosted.org/packages/4a/e7/82da0a03e7ba5141f05cce0d302e6eed121ae055e0456ca228bf693984bc/asttokens-3.0.0.tar.gz"
    sha256 "0dcd8baa8d62b0c1d118b399b2ddba3c4aff271d0d7a9e0d4c1681c79035bbc7"
  end

  resource "blessed" do
    url "https://files.pythonhosted.org/packages/0c/5e/3cada2f7514ee2a76bb8168c71f9b65d056840ebb711962e1ec08eeaa7b0/blessed-1.21.0.tar.gz"
    sha256 "ece8bbc4758ab9176452f4e3a719d70088eb5739798cd5582c9e05f2a28337ec"
  end

  resource "bpylist2" do
    url "https://files.pythonhosted.org/packages/ca/34/eb90ff6be953f6e4df08d4e8c0b761bea144242b6d711e922113411cc631/bpylist2-4.1.1.tar.gz"
    sha256 "0cc63284aee42f5c7e0ec87f8f59cdd35aaed05ad12d866b1868ea0c0caaafe1"
  end

  resource "cached-property" do
    url "https://files.pythonhosted.org/packages/76/4b/3d870836119dbe9a5e3c9a61af8cc1a8b69d75aea564572e385882d5aefb/cached_property-2.0.1.tar.gz"
    sha256 "484d617105e3ee0e4f1f58725e72a8ef9e93deee462222dbd51cd91230897641"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/f3/0d/f7b6ab21ec75897ed80c17d79b15951a719226b9fababf1e40ea74d69079/chardet-5.2.0.tar.gz"
    sha256 "1b3b6ff479a8c414bc3fa2c0852995695c4a026dcd6d0633b2dd092ca39c1cf7"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/60/6c/8ca2efa64cf75a977a0d7fac081354553ebe483345c734fb6b6515d96bbc/click-8.2.1.tar.gz"
    sha256 "27c491cc05d968d271d5a1db13e3b5a184636d9d930f148c50b038f0d0646202"
  end

  resource "coloredlogs" do
    url "https://files.pythonhosted.org/packages/cc/c7/eed8f27100517e8c0e6b923d5f0845d0cb99763da6fdee00478f91db7325/coloredlogs-15.0.1.tar.gz"
    sha256 "7c991aa71a4577af2f82600d8f8f3a89f936baeaf9b50a9c197da014e5bf16b0"
  end

  resource "construct" do
    url "https://files.pythonhosted.org/packages/02/77/8c84b98eca70d245a2a956452f21d57930d22ab88cbeed9290ca630cf03f/construct-2.10.70.tar.gz"
    sha256 "4d2472f9684731e58cc9c56c463be63baa1447d674e0d66aeb5627b22f512c29"
  end

  resource "daemonize" do
    url "https://files.pythonhosted.org/packages/8c/20/96f7dbc23812cfe4cf479c87af3e4305d0d115fd1fffec32ddeee7b9c82b/daemonize-2.5.0.tar.gz"
    sha256 "dd026e4ff8d22cb016ed2130bc738b7d4b1da597ef93c074d2adb9e4dea08bc3"
  end

  resource "decorator" do
    url "https://files.pythonhosted.org/packages/43/fa/6d96a0978d19e17b68d634497769987b16c8f4cd0a7a05048bec693caa6b/decorator-5.2.1.tar.gz"
    sha256 "65f266143752f734b0a7cc83c46f4618af75b8c5911b00ccb61d0ac9b6da0360"
  end

  resource "developer-disk-image" do
    url "https://files.pythonhosted.org/packages/a6/49/0d5202f86232302c3f2ffaf097e8f352f0e7b18ef44851227666ce187327/developer_disk_image-0.0.4.tar.gz"
    sha256 "babeb2c8d496d960c8ff9d625277a2959fd6c114eca12e7b4d12be1ab68251ab"
  end

  resource "dnspython" do
    url "https://files.pythonhosted.org/packages/b5/4a/263763cb2ba3816dd94b08ad3a33d5fdae34ecb856678773cc40a3605829/dnspython-2.7.0.tar.gz"
    sha256 "ce9c432eda0dc91cf618a5cedf1a4e142651196bbcd2c80e89ed5a907e5cfaf1"
  end

  resource "editor" do
    url "https://files.pythonhosted.org/packages/2a/92/734a4ab345914259cb6146fd36512608ea42be16195375c379046f33283d/editor-1.6.6.tar.gz"
    sha256 "bb6989e872638cd119db9a4fce284cd8e13c553886a1c044c6b8d8a160c871f8"
  end

  resource "email-validator" do
    url "https://files.pythonhosted.org/packages/48/ce/13508a1ec3f8bb981ae4ca79ea40384becc868bfae97fd1c942bb3a001b1/email_validator-2.2.0.tar.gz"
    sha256 "cb690f344c617a714f22e66ae771445a1ceb46821152df8e165c5f9a364582b7"
  end

  resource "enum-compat" do
    url "https://files.pythonhosted.org/packages/41/46/8ed2368976d934652d8f33f1fdd86f5580fab45e890c90a848e83097a093/enum-compat-0.0.3.tar.gz"
    sha256 "3677daabed56a6f724451d585662253d8fb4e5569845aafa8bb0da36b1a8751e"
  end

  resource "executing" do
    url "https://files.pythonhosted.org/packages/91/50/a9d80c47ff289c611ff12e63f7c5d13942c65d68125160cefd768c73e6e4/executing-2.2.0.tar.gz"
    sha256 "5d108c028108fe2551d1a7b2e8b713341e2cb4fc0aa7dcf966fa4327a5226755"
  end

  resource "fastapi" do
    url "https://files.pythonhosted.org/packages/78/d7/6c8b3bfe33eeffa208183ec037fee0cce9f7f024089ab1c5d12ef04bd27c/fastapi-0.116.1.tar.gz"
    sha256 "ed52cbf946abfd70c5a0dccb24673f0670deeb517a88b3544d03c2a6bf283143"
  end

  resource "fastapi-cli" do
    url "https://files.pythonhosted.org/packages/fe/73/82a5831fbbf8ed75905bacf5b2d9d3dfd6f04d6968b29fe6f72a5ae9ceb1/fastapi_cli-0.0.7.tar.gz"
    sha256 "02b3b65956f526412515907a0793c9094abd4bfb5457b389f645b0ea6ba3605e"
  end

  resource "gpxpy" do
    url "https://files.pythonhosted.org/packages/20/ad/6f1a34e702c72cb495bb258396f237ded76c00f9fe67054a44d778d24ed9/gpxpy-1.6.2.tar.gz"
    sha256 "a72c484b97ec42b80834353b029cc8ee1b79f0ffca1179b2210bb3baf26c01ae"
  end

  resource "hexdump" do
    url "https://files.pythonhosted.org/packages/55/b3/279b1d57fa3681725d0db8820405cdcb4e62a9239c205e4ceac4391c78e4/hexdump-3.3.zip"
    sha256 "d781a43b0c16ace3f9366aade73e8ad3a7bd5137d58f0b45ab2d3f54876f20db"
  end

  resource "httptools" do
    url "https://files.pythonhosted.org/packages/a7/9a/ce5e1f7e131522e6d3426e8e7a490b3a01f39a6696602e1c4f33f9e94277/httptools-0.6.4.tar.gz"
    sha256 "4e93eee4add6493b59a5c514da98c939b244fce4a0d8879cd3f466562f4b7d5c"
  end

  resource "humanfriendly" do
    url "https://files.pythonhosted.org/packages/cc/3f/2c29224acb2e2df4d2046e4c73ee2662023c58ff5b113c4c1adac0886c43/humanfriendly-10.0.tar.gz"
    sha256 "6b0b831ce8f15f7300721aa49829fc4e83921a9a301cc7f606be6686a2288ddc"
  end

  resource "hyperframe" do
    url "https://files.pythonhosted.org/packages/02/e7/94f8232d4a74cc99514c13a9f995811485a6903d48e5d952771ef6322e30/hyperframe-6.1.0.tar.gz"
    sha256 "f630908a00854a7adeabd6382b43923a4c4cd4b821fcb527e6ab9e15382a3b08"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f1/70/7703c29685631f5a7590aa73f1f1d3fa9a380e654b86af429e0934a32f7d/idna-3.10.tar.gz"
    sha256 "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"
  end

  resource "ifaddr" do
    url "https://files.pythonhosted.org/packages/e8/ac/fb4c578f4a3256561548cd825646680edcadb9440f3f68add95ade1eb791/ifaddr-0.2.0.tar.gz"
    sha256 "cc0cbfcaabf765d44595825fb96a99bb12c79716b73b44330ea38ee2b0c4aed4"
  end

  resource "inquirer3" do
    url "https://files.pythonhosted.org/packages/a1/4c/12a087bac2a235d3f134daa6186199e82abf512a0961d0012cdd1c74f737/inquirer3-0.6.1.tar.gz"
    sha256 "aca0e26922e0ba38c83bce65a54b3ed1c5f91c4c9fb72068c96a885e2749babc"
  end

  resource "ipsw-parser" do
    url "https://files.pythonhosted.org/packages/91/b3/520a75b11bcc564192dd953c1cdc6500b08dd6428d3cddd6bd0c22fe8ee5/ipsw_parser-1.3.9.tar.gz"
    sha256 "071166f81648c22ef1db61e02b1728bc2f8a7bc04ce3ca1123db84dd54e2349d"
  end

  resource "ipython" do
    url "https://files.pythonhosted.org/packages/01/35/6f90fdddff7a08b7b715fccbd2427b5212c9525cd043d26fdc45bee0708d/ipython-8.31.0.tar.gz"
    sha256 "b6a2274606bec6166405ff05e54932ed6e5cfecaca1fc05f2cacde7bb074d70b"
  end

  resource "itsdangerous" do
    url "https://files.pythonhosted.org/packages/9c/cb/8ac0172223afbccb63986cc25049b154ecfb5e85932587206f42317be31d/itsdangerous-2.2.0.tar.gz"
    sha256 "e0050c0b7da1eea53ffaf149c0cfbb5c6e2e2b69c4bef22c81fa6eb73e5f6173"
  end

  resource "jedi" do
    url "https://files.pythonhosted.org/packages/72/3a/79a912fbd4d8dd6fbb02bf69afd3bb72cf0c729bb3063c6f4498603db17a/jedi-0.19.2.tar.gz"
    sha256 "4770dc3de41bde3966b02eb84fbcf557fb33cce26ad23da12c742fb50ecb11f0"
  end

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/df/bf/f7da0350254c0ed7c72f3e33cef02e048281fec7ecec5f032d4aac52226b/jinja2-3.1.6.tar.gz"
    sha256 "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d"
  end

  resource "la-panic" do
    url "https://files.pythonhosted.org/packages/85/28/757e1ccd939162caa27c8a6173d490deb986c38a7fd73fe2f264f6d7485d/la-panic-0.5.0.tar.gz"
    sha256 "5239025d1e96aaed1fbd1c4a5d35572fd70cf42ddd68839ff1e4f1d21e3e279b"
  end

  resource "loguru" do
    url "https://files.pythonhosted.org/packages/3a/05/a1dae3dffd1116099471c643b8924f5aa6524411dc6c63fdae648c4f1aca/loguru-0.7.3.tar.gz"
    sha256 "19480589e77d47b8d85b2c827ad95d49bf31b0dcde16593892eb51dd18706eb6"
  end

  resource "lzfse" do
    url "https://files.pythonhosted.org/packages/11/c6/a57f4134fa1afb7e658c58a2401838c811445a9fdc657008b4850d4e47d7/lzfse-0.4.2.tar.gz"
    sha256 "c6895f8ca13eedd2e18b6e0c987c9468115030898409bc44a7aa8d4f4a42ceab"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/38/71/3b932df36c1a044d397a1f92d1cf91ee0a503d91e470cbd670aa66b07ed0/markdown-it-py-3.0.0.tar.gz"
    sha256 "e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb"
  end

  resource "markupsafe" do
    url "https://files.pythonhosted.org/packages/b2/97/5d42485e71dfc078108a86d6de8fa46db44a1a9295e89c5d6d4a06e23a62/markupsafe-3.0.2.tar.gz"
    sha256 "ee55d3edf80167e48ea11a923c7386f4669df67d7994554387f84e7d8b0a2bf0"
  end

  resource "matplotlib-inline" do
    url "https://files.pythonhosted.org/packages/99/5b/a36a337438a14116b16480db471ad061c36c3694df7c2084a0da7ba538b7/matplotlib_inline-0.1.7.tar.gz"
    sha256 "8423b23ec666be3d16e16b60bdd8ac4e86e840ebd1dd11a30b9f117f2fa0ab90"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "nest-asyncio" do
    url "https://files.pythonhosted.org/packages/83/f8/51569ac65d696c8ecbee95938f89d4abf00f47d58d48f6fbabfe8f0baefe/nest_asyncio-1.6.0.tar.gz"
    sha256 "6f172d5449aca15afd6c646851f4e31e02c598d553a667e38cafa997cfec55fe"
  end

  resource "opack2" do
    url "https://files.pythonhosted.org/packages/b3/ac/8e7d6698282a2130c99fab2fffa3cb1910688ffee16ec36e3d1f71375adf/opack2-0.0.1.tar.gz"
    sha256 "0deb0b5d7094253f631db201f3493094a5821404f736ab0234ba805ee93d57b2"
  end

  resource "orjson" do
    url "https://files.pythonhosted.org/packages/ae/f9/5dea21763eeff8c1590076918a446ea3d6140743e0e36f58f369928ed0f4/orjson-3.10.15.tar.gz"
    sha256 "05ca7fe452a2e9d8d9d706a2984c95b9c2ebc5db417ce0b7a49b91d50642a23e"
  end

  resource "parameter-decorators" do
    url "https://files.pythonhosted.org/packages/40/b9/03b5e409930cb4cff0f25f6f3199145f4319a88d5f9be7ee17882359f72d/parameter_decorators-0.0.2.tar.gz"
    sha256 "499ec96e71394705be9e3eeb28542aab4875694042516c31051d5dcb0488028e"
  end

  resource "parso" do
    url "https://files.pythonhosted.org/packages/66/94/68e2e17afaa9169cf6412ab0f28623903be73d1b32e208d9e8e541bb086d/parso-0.8.4.tar.gz"
    sha256 "eb3a7b58240fb99099a345571deecc0f9540ea5f4dd2fe14c2a99d6b281ab92d"
  end

  resource "pdm-backend" do
    url "https://files.pythonhosted.org/packages/d9/bf/d75d568521cef171ae9138d9ab55c169a98ee803853ca87b7096e4636d5b/pdm_backend-2.4.3.tar.gz"
    sha256 "dbd9047a7ac10d11a5227e97163b617ad5d665050476ff63867d971758200728"
  end

  resource "pexpect" do
    url "https://files.pythonhosted.org/packages/42/92/cc564bf6381ff43ce1f4d06852fc19a2f11d180f23dc32d9588bee2f149d/pexpect-4.9.0.tar.gz"
    sha256 "ee7d41123f3c9911050ea2c2dac107568dc43b2d3b0c7557a33212c398ead30f"
  end

  resource "plumbum" do
    url "https://files.pythonhosted.org/packages/f0/5d/49ba324ad4ae5b1a4caefafbce7a1648540129344481f2ed4ef6bb68d451/plumbum-1.9.0.tar.gz"
    sha256 "e640062b72642c3873bd5bdc3effed75ba4d3c70ef6b6a7b907357a84d909219"
  end

  resource "prompt-toolkit" do
    url "https://files.pythonhosted.org/packages/bb/6e/9d084c929dfe9e3bfe0c6a47e31f78a25c54627d64a66e884a8bf5474f1c/prompt_toolkit-3.0.51.tar.gz"
    sha256 "931a162e3b27fc90c86f1b48bb1fb2c528c2761475e57c9c06de13311c7b54ed"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/2a/80/336820c1ad9286a4ded7e845b2eccfcb27851ab8ac6abece774a6ff4d3de/psutil-7.0.0.tar.gz"
    sha256 "7be9c3eba38beccb6495ea33afd982a44074b78f28c434a1f51cc07fd315c456"
  end

  resource "ptyprocess" do
    url "https://files.pythonhosted.org/packages/20/e5/16ff212c1e452235a90aeb09066144d0c5a6a8c0834397e03f5224495c4e/ptyprocess-0.7.0.tar.gz"
    sha256 "5c5d0a3b48ceee0b48485e0c26037c0acd7d29765ca3fbb5cb3831d347423220"
  end

  resource "pure-eval" do
    url "https://files.pythonhosted.org/packages/cd/05/0a34433a064256a578f1783a10da6df098ceaa4a57bbeaa96a6c0352786b/pure_eval-0.2.3.tar.gz"
    sha256 "5f4e983f40564c576c7c8635ae88db5956bb2229d7e9237d03b3c0b0190eaf42"
  end

  resource "pycrashreport" do
    url "https://files.pythonhosted.org/packages/7a/a8/d7c613321fd51054df00930264acfc20a188fc9d92d4ff52b8c83e7e7233/pycrashreport-1.2.6.tar.gz"
    sha256 "7d4aa523c34c63357dcf352044e57c83f6417d716bc5212cc4af8713573a4a55"
  end

  resource "pycryptodome" do
    url "https://files.pythonhosted.org/packages/8e/a6/8452177684d5e906854776276ddd34eca30d1b1e15aa1ee9cefc289a33f5/pycryptodome-3.23.0.tar.gz"
    sha256 "447700a657182d60338bab09fdb27518f8856aecd80ae4c6bdddb67ff5da44ef"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/b7/ae/d5220c5c52b158b1de7ca89fc5edb72f304a70a4c540c84c8844bf4008de/pydantic-2.10.6.tar.gz"
    sha256 "ca5daa827cce33de7a42be142548b0096bf05a7e7b365aebfa5f8eeec7128236"
  end

  resource "pydantic-extra-types" do
    url "https://files.pythonhosted.org/packages/23/ed/69f3f3de12c02ebd58b2f66ffb73d0f5a1b10b322227897499753cebe818/pydantic_extra_types-2.10.2.tar.gz"
    sha256 "934d59ab7a02ff788759c3a97bc896f5cfdc91e62e4f88ea4669067a73f14b98"
  end

  resource "pydantic-settings" do
    url "https://files.pythonhosted.org/packages/73/7b/c58a586cd7d9ac66d2ee4ba60ca2d241fa837c02bca9bea80a9a8c3d22a9/pydantic_settings-2.7.1.tar.gz"
    sha256 "10c9caad35e64bfb3c2fbf70a078c0e25cc92499782e5200747f942a065dec93"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/fc/01/f3e5ac5e7c25833db5eb555f7b7ab24cd6f8c322d3a3ad2d67a952dc0abc/pydantic_core-2.27.2.tar.gz"
    sha256 "eb026e5a4c1fee05726072337ff51d1efb6f59090b7da90d30ea58625b1ffb39"
  end

  resource "pykdebugparser" do
    url "https://files.pythonhosted.org/packages/15/83/5c4b37587a073149285f700978597bcd6317f0991460fa2053d37c28f9dd/pykdebugparser-1.2.4.tar.gz"
    sha256 "338acf59c228600bce05cf3cbaf39439faa9bc61011906513099993da66ed567"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/b0/77/a5b8c569bf593b0140bde72ea885a803b82086995367bf2037de0159d924/pygments-2.19.2.tar.gz"
    sha256 "636cb2477cec7f8952536970bc533bc43743542f70392ae026374600add5b887"
  end

  resource "pygnuutils" do
    url "https://files.pythonhosted.org/packages/03/20/6a828fe03d6586241b824ee06c7da854ea351716006a62fd2548eaa5710b/pygnuutils-0.1.1.tar.gz"
    sha256 "51ab4f27deb59102b7a04192f7585ff2b3a9de03739982f0b19d3cd4d16bea76"
  end

  resource "pyimg4" do
    url "https://files.pythonhosted.org/packages/de/4e/92d5b9c1b95d042c58cebd429eaa8fcd19c09c6e3126f759a9203698419d/pyimg4-0.8.6.tar.gz"
    sha256 "7609940e023f395cbe8f39ffefb053d6168a001cad320627e641bf247c709d22"
  end

  resource "pylzss" do
    url "https://files.pythonhosted.org/packages/7d/dc/9ae75ede398b7adf538f2d1dca0f96c645c4e96789f8039340a0ed6a8a8f/pylzss-0.3.4.tar.gz"
    sha256 "16818631742488e53a34fda0d402d80edb2b812e11877801e21a9e5ce9b9db1c"
  end

  resource "pymobiledevice3" do
    url "https://files.pythonhosted.org/packages/5c/1e/1a939e9f57e195a7c8a5d5772c956e657a11c4f41a32c1458ed802461993/pymobiledevice3-4.18.5.tar.gz"
    sha256 "e4d5fde083bc92be91780d292fb79a40de83f9df42beae67093a151c90720de6"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/66/c0/0c8b6ad9f17a802ee498c46e004a0eb49bc148f2fd230864601a86dcf6db/python-dateutil-2.9.0.post0.tar.gz"
    sha256 "37dd54208da7e1cd875388217d5e00ebd4179249f90fb72437e91a35459a0ad3"
  end

  resource "python-dotenv" do
    url "https://files.pythonhosted.org/packages/f6/b0/4bc07ccd3572a2f9df7e6782f52b0c6c90dcbb803ac4a167702d7d0dfe1e/python_dotenv-1.1.1.tar.gz"
    sha256 "a8a6399716257f45be6a007360200409fce5cda2661e3dec71d23dc15f6189ab"
  end

  resource "python-multipart" do
    url "https://files.pythonhosted.org/packages/f3/87/f44d7c9f274c7ee665a29b885ec97089ec5dc034c7f3fafa03da9e39a09e/python_multipart-0.0.20.tar.gz"
    sha256 "8dd0cab45b8e23064ae09147625994d090fa46f5b0d1e13af944c331a7fa9d13"
  end

  resource "python-pcapng" do
    url "https://files.pythonhosted.org/packages/3c/2f/72534730a81205cd3ca32d65b4760c927e6ffc69a3d06ff3d1edda64ae3e/python-pcapng-2.1.1.tar.gz"
    sha256 "6477e72513165954e56d5836ebbd43ac7f8d28c4640f78d63d6506d1692ddc74"
  end

  resource "pytun-pmd3" do
    url "https://files.pythonhosted.org/packages/c9/ff/35162ed0deebed8b28174907ee651bd70a668c25dc4977ed8cf005ef8c48/pytun_pmd3-2.2.2.tar.gz"
    sha256 "344fd838219b6e33ffad781090f129d4e3ab39de9385b5e048273f17696f215a"
  end

  resource "pyusb" do
    url "https://files.pythonhosted.org/packages/00/6b/ce3727395e52b7b76dfcf0c665e37d223b680b9becc60710d4bc08b7b7cb/pyusb-1.3.1.tar.gz"
    sha256 "3af070b607467c1c164f49d5b0caabe8ac78dbed9298d703a8dbf9df4052d17e"
  end

  resource "qh3" do
    url "https://files.pythonhosted.org/packages/3c/45/9e3104a3d0670f551cb36d2f165a90756be40bc7e8b5e721df67581f6e5b/qh3-1.5.3.tar.gz"
    sha256 "ad873abae5c87a01763f17ae06c3aa77bd4bf3f8e4d4529174f9b2f3854d383f"
  end

  resource "readchar" do
    url "https://files.pythonhosted.org/packages/dd/f8/8657b8cbb4ebeabfbdf991ac40eca8a1d1bd012011bd44ad1ed10f5cb494/readchar-4.2.1.tar.gz"
    sha256 "91ce3faf07688de14d800592951e5575e9c7a3213738ed01d394dcc949b79adb"
  end

  resource "remotezip2" do
    url "https://files.pythonhosted.org/packages/3f/47/94335875a4d5339f64943c1a68900f59a91ad987ab8fcd8e5201839e7cc5/remotezip2-0.0.2.tar.gz"
    sha256 "db38fb14d0c297af6da8756808bb25f9d3b2c23c7639a14f7a74794b2fc9a261"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896afe06353c2a2913/requests-2.32.3.tar.gz"
    sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
  end

  resource "rich-toolkit" do
    url "https://files.pythonhosted.org/packages/5b/8a/71cfbf6bf6257ea785d1f030c22468f763eea1b3e5417620f2ba9abd6dca/rich_toolkit-0.13.2.tar.gz"
    sha256 "fea92557530de7c28f121cbed572ad93d9e0ddc60c3ca643f1b831f2f56b95d3"
  end

  resource "runs" do
    url "https://files.pythonhosted.org/packages/26/6d/b9aace390f62db5d7d2c77eafce3d42774f27f1829d24fa9b6f598b3ef71/runs-1.2.2.tar.gz"
    sha256 "9dc1815e2895cfb3a48317b173b9f1eac9ba5549b36a847b5cc60c3bf82ecef1"
  end

  resource "pymobiledevice3" do
    url "https://files.pythonhosted.org/packages/5c/1e/1a939e9f57e195a7c8a5d5772c956e657a11c4f41a32c1458ed802461993/pymobiledevice3-4.18.5.tar.gz"
    sha256 "e4d5fde083bc92be91780d292fb79a40de83f9df42beae67093a151c90720de6"
  end

  resource "shellingham" do
    url "https://files.pythonhosted.org/packages/58/15/8b3609fd3830ef7b27b655beb4b4e9c62313a4e8da8c676e142cc210d58e/shellingham-1.5.4.tar.gz"
    sha256 "8dbca0739d487e5bd35ab3ca4b36e11c4078f3a234bfce294b0a0291363404de"
  end

  resource "sniffio" do
    url "https://files.pythonhosted.org/packages/a2/87/a6771e1546d97e7e041b6ae58d80074f81b7d5121207425c964ddf5cfdbd/sniffio-1.3.1.tar.gz"
    sha256 "f4324edc670a0f49750a81b895f35c3adb843cca46f0530f79fc1babb23789dc"
  end

  resource "srptools" do
    url "https://files.pythonhosted.org/packages/a1/8a/d62af55a56d56216e96563bc9c29c2d16d957317742c2e5bd4e79a524b06/srptools-1.0.1.tar.gz"
    sha256 "7fa4337256a1542e8f5bb4bed19e1d9aea98fe5ff9baf76693342a1dd6ac7c96"
  end

  resource "starlette" do
    url "https://files.pythonhosted.org/packages/ff/fb/2984a686808b89a6781526129a4b51266f678b2d2b97ab2d325e56116df8/starlette-0.45.3.tar.gz"
    sha256 "2cbcba2a75806f8a41c722141486f37c28e30a0921c5f6fe4346cb0dcee1302f"
  end

  resource "stack-data" do
    url "https://files.pythonhosted.org/packages/28/e3/55dcc2cfbc3ca9c29519eb6884dd1415ecb53b0e934862d3559ddcb7e20b/stack_data-0.6.3.tar.gz"
    sha256 "836a778de4fec4dcd1dcd89ed8abff8a221f58308462e1c4aa2a3cf30148f0b9"
  end

  resource "termcolor" do
    url "https://files.pythonhosted.org/packages/ca/6c/3d75c196ac07ac8749600b60b03f4f6094d54e132c4d94ebac6ee0e0add0/termcolor-3.1.0.tar.gz"
    sha256 "6a6dd7fbee581909eeec6a756cff1d7f7c376063b14e4a298dc4980309e55970"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d/tqdm-4.67.1.tar.gz"
    sha256 "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2"
  end

  resource "traitlets" do
    url "https://files.pythonhosted.org/packages/eb/79/72064e6a701c2183016abbbfedaba506d81e30e232a68c9f0d6f6fcd1574/traitlets-5.14.3.tar.gz"
    sha256 "9ed0579d3502c94b4b3732ac120375cda96f923114522847de4b3bb98b96b6b7"
  end

  resource "typer" do
    url "https://files.pythonhosted.org/packages/c5/8c/7d682431efca5fd290017663ea4588bf6f2c6aad085c7f108c5dbc316e70/typer-0.16.0.tar.gz"
    sha256 "af377ffaee1dbe37ae9440cb4e8f11686ea5ce4e9bae01b84ae7c63b87f1dd3b"
  end

  resource "types-python-dateutil" do
    url "https://files.pythonhosted.org/packages/c9/95/6bdde7607da2e1e99ec1c1672a759d42f26644bbacf939916e086db34870/types_python_dateutil-2.9.0.20250708.tar.gz"
    sha256 "ccdbd75dab2d6c9696c350579f34cffe2c281e4c5f27a585b2a2438dd1d5c8ab"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/df/db/f35a00659bc03fec321ba8bce9420de607a1d37f8342eee1863174c69557/typing_extensions-4.12.2.tar.gz"
    sha256 "1a7ead55c7e559dd4dee8856e3a88b41225abfe1ce8df57b7c13915fe121ffb8"
  end

  resource "ujson" do
    url "https://files.pythonhosted.org/packages/f0/00/3110fd566786bfa542adb7932d62035e0c0ef662a8ff6544b6643b3d6fd7/ujson-5.10.0.tar.gz"
    sha256 "b3cd8f3c5d8c7738257f1018880444f7b7d9b66232c64649f562d7ba86ad4bc1"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/aa/63/e53da845320b757bf29ef6a9062f5c669fe997973f966045cb019c3f4b66/urllib3-2.3.0.tar.gz"
    sha256 "f8c5449b3cf0861679ce7e0503c7b44b5ec981bec0d1d3795a07f1ba96f0204d"
  end

  resource "uvloop" do
    url "https://files.pythonhosted.org/packages/af/c0/854216d09d33c543f12a44b393c402e89a920b1a0a7dc634c42de91b9cf6/uvloop-0.21.0.tar.gz"
    sha256 "3bf12b0fda68447806a7ad847bfa591613177275d35b6724b1ee573faa3704e3"
  end

  resource "uvicorn" do
    url "https://files.pythonhosted.org/packages/4b/4d/938bd85e5bf2edeec766267a5015ad969730bb91e31b44021dfe8b22df6c/uvicorn-0.34.0.tar.gz"
    sha256 "404051050cd7e905de2c9a7e61790943440b3416f49cb409f965d9dcd0fa73e9"
  end

  resource "watchfiles" do
    url "https://files.pythonhosted.org/packages/2a/9a/d451fcc97d029f5812e898fd30a53fd8c15c7bbd058fd75cfc6beb9bd761/watchfiles-1.1.0.tar.gz"
    sha256 "693ed7ec72cbfcee399e92c895362b6e66d63dac6b91e2c11ae03d10d503e575"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/6c/63/53559446a878410fc5a5974feb13d31d78d752eb18aeba59c7fef1af7598/wcwidth-0.2.13.tar.gz"
    sha256 "72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5"
  end

  resource "websockets" do
    url "https://files.pythonhosted.org/packages/21/e6/26d09fab466b7ca9c7737474c52be4f76a40301b08362eb2dbc19dcc16c1/websockets-15.0.1.tar.gz"
    sha256 "82544de02076bafba038ce055ee6412d68da13ab47f0c60cab827346de828dee"
  end

  resource "wsproto" do
    url "https://files.pythonhosted.org/packages/c9/4a/44d3c295350d776427904d73c189e10aeae66d7f555bb2feee16d1e4ba5a/wsproto-1.2.0.tar.gz"
    sha256 "ad565f26ecb92588a3e43bc3d96164de84cd9902482b130d0ddbaa9664a85065"
  end

  resource "xmod" do
    url "https://files.pythonhosted.org/packages/72/b2/e3edc608823348e628a919e1d7129e641997afadd946febdd704aecc5881/xmod-1.8.1.tar.gz"
    sha256 "38c76486b9d672c546d57d8035df0beb7f4a9b088bc3fb2de5431ae821444377"
  end

  resource "xonsh" do
    url "https://files.pythonhosted.org/packages/ea/eb/8f544caca583c5f9f0ae7d852769fdb8ed5f63b67646a3c66a2d19357d56/xonsh-0.19.9.tar.gz"
    sha256 "4cab4c4d7a98aab7477a296f12bc008beccf3d090c6944f0b3375d80a574c37d"
  end

  resource "zeroconf" do
    url "https://files.pythonhosted.org/packages/24/7d/02e8c583b57692eee495e60c7a4dd862635a9702067d69c6dd1c907cb589/zeroconf-0.132.2.tar.gz"
    sha256 "9ad8bc6e3f168fe8c164634c762d3265c775643defff10e26273623a12d73ae1"
  end

  def install
    virtualenv_install_with_resources(using: "python@3.13")
  end

  test do
    system bin/"sidejitserver", "--version"
  end
end
