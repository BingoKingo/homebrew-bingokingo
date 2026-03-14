class Sidejitserver < Formula
  include Language::Python::Virtualenv

  desc "iOS 17 JIT enabler"
  homepage "https://github.com/nythepegasus/SideJITServer/"
  url "https://files.pythonhosted.org/packages/1a/70/f954194855d5a9871526fa9e92dc4201f59ce68e517be54c3e9f4c3f043c/sidejitserver-1.4.2.tar.gz"
  sha256 "12b09bd1c970920b3ccdebfb83303ef7698c8f2a16356a26d9396445c1dff611"
  license "GPL-3.0-or-later"
  head "https://github.com/nythepegasus/SideJITServer.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "maturin" => :build
  depends_on "python-setuptools" => :build
  depends_on "rust" => :build
  depends_on "certifi"
  depends_on "cffi"
  depends_on "fastapi"
  depends_on "ipython"
  depends_on "libusb"
  depends_on "libyaml"
  depends_on "openssl@3"
  depends_on "pillow"
  depends_on "pycparser"
  depends_on "pygments"
  depends_on "python-packaging"
  depends_on "python@3.14"
  depends_on "rich-cli"
  depends_on "uvicorn"
  depends_on "xonsh"

  pypi_packages exclude_packages: "qh3",
                extra_packages:   %w[lzfse pdm-backend]

  resource "aiofiles" do
    url "https://files.pythonhosted.org/packages/0b/03/a88171e277e8caa88a4c77808c20ebb04ba74cc4681bf1e9416c862de237/aiofiles-24.1.0.tar.gz"
    sha256 "22a075c9e5a3810f0c2e48f3008c94d68c65d763b9b03857924c99e57355166c"
  end

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5/annotated_types-0.7.0.tar.gz"
    sha256 "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/96/f0/5eb65b2bb0d09ac6776f2eb54adee6abe8228ea05b20a5ad0e4945de8aac/anyio-4.12.1.tar.gz"
    sha256 "41cfcc3a4c85d3f05c932da7c26d0201ac36f72abd4435ba90d0464a3ffed703"
  end

  resource "apple-compress" do
    url "https://files.pythonhosted.org/packages/91/14/cdb0bdb6147a019d2d8a1e144910c6a8d257d0e58f63bbd105bda0fce7dc/apple_compress-0.2.3.tar.gz"
    sha256 "a1c855cec8bd73210ae9522c53a841ca515ded2f0c9d5b4e728d0d93fee46a29"
  end

  resource "arrow" do
    url "https://files.pythonhosted.org/packages/b9/33/032cdc44182491aa708d06a68b62434140d8c50820a087fac7af37703357/arrow-1.4.0.tar.gz"
    sha256 "ed0cc050e98001b8779e84d461b0098c4ac597e88704a655582b21d116e526d7"
  end

  resource "asn1" do
    url "https://files.pythonhosted.org/packages/00/35/9d0709bf09340ddb1796dfc52d1b1ef2f18e690b5cbf32b7be02c702532c/asn1-2.8.0.tar.gz"
    sha256 "adf77ddc2707cf420c0eae3b99ee30e913afcf0936467d42669820ce6b7d150a"
  end

  resource "asttokens" do
    url "https://files.pythonhosted.org/packages/be/a5/8e3f9b6771b0b408517c82d97aed8f2036509bc247d46114925e32fe33f0/asttokens-3.0.1.tar.gz"
    sha256 "71a4ee5de0bde6a31d64f6b13f2293ac190344478f081c3d1bccfcf5eacb0cb7"
  end

  resource "blessed" do
    url "https://files.pythonhosted.org/packages/68/5c/92dc10a25a4eafb4b9bef5dad522a0b7d5d5b55d2d76f9a6721b2e49ca2c/blessed-1.33.0.tar.gz"
    sha256 "c732a1043042d84f411423a1a7b74643e1dd3a2271bd6e5955682dd4a321b0ef"
  end

  resource "bpylist2" do
    url "https://files.pythonhosted.org/packages/ca/34/eb90ff6be953f6e4df08d4e8c0b761bea144242b6d711e922113411cc631/bpylist2-4.1.1.tar.gz"
    sha256 "0cc63284aee42f5c7e0ec87f8f59cdd35aaed05ad12d866b1868ea0c0caaafe1"
  end

  resource "cached-property" do
    url "https://files.pythonhosted.org/packages/76/4b/3d870836119dbe9a5e3c9a61af8cc1a8b69d75aea564572e385882d5aefb/cached_property-2.0.1.tar.gz"
    sha256 "484d617105e3ee0e4f1f58725e72a8ef9e93deee462222dbd51cd91230897641"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/af/2d/7bf41579a8986e348fa033a31cdd0e4121114f6bce2457e8876010b092dd/certifi-2026.2.25.tar.gz"
    sha256 "e887ab5cee78ea814d3472169153c2d12cd43b14bd03329a39a9c6e2e80bfba7"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/eb/56/b1ba7935a17738ae8453301356628e8147c79dbb825bcbc73dc7401f9846/cffi-2.0.0.tar.gz"
    sha256 "44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/1d/35/02daf95b9cd686320bb622eb148792655c9412dbb9b67abb5694e5910a24/charset_normalizer-3.4.5.tar.gz"
    sha256 "95adae7b6c42a6c5b5b559b1a99149f090a57128155daeea91732c8d970d8644"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/3d/fa/656b739db8587d7b5dfa22e22ed02566950fbfbcdc20311993483657a5c0/click-8.3.1.tar.gz"
    sha256 "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
  end

  resource "coloredlogs" do
    url "https://files.pythonhosted.org/packages/cc/c7/eed8f27100517e8c0e6b923d5f0845d0cb99763da6fdee00478f91db7325/coloredlogs-15.0.1.tar.gz"
    sha256 "7c991aa71a4577af2f82600d8f8f3a89f936baeaf9b50a9c197da014e5bf16b0"
  end

  resource "construct" do
    url "https://files.pythonhosted.org/packages/02/77/8c84b98eca70d245a2a956452f21d57930d22ab88cbeed9290ca630cf03f/construct-2.10.70.tar.gz"
    sha256 "4d2472f9684731e58cc9c56c463be63baa1447d674e0d66aeb5627b22f512c29"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/60/04/ee2a9e8542e4fa2773b81771ff8349ff19cdd56b7258a0cc442639052edb/cryptography-46.0.5.tar.gz"
    sha256 "abace499247268e3757271b2f1e244b36b06f8515cf27c4d49468fc9eb16e93d"
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
    url "https://files.pythonhosted.org/packages/1d/2c/9862a8437947bb78f32858cbf0e7f01add855001912266a7f85dcbef25e5/developer_disk_image-0.2.0.tar.gz"
    sha256 "db568b22ec339d8b56b29ae9b420230eae322fe69be74cd99fd0effb0ef2e28f"
  end

  resource "dnspython" do
    url "https://files.pythonhosted.org/packages/8c/8b/57666417c0f90f08bcafa776861060426765fdb422eb10212086fb811d26/dnspython-2.8.0.tar.gz"
    sha256 "181d3c6996452cb1189c4046c61599b84a5a86e099562ffde77d26984ff26d0f"
  end

  resource "editor" do
    url "https://files.pythonhosted.org/packages/d9/4f/00e0b75d86bb1e6a943c08942619e3f31de54a0dce3b33b14ae3c2af2dc0/editor-1.7.0.tar.gz"
    sha256 "979b25e3f7e0386af4478e7392ecb99e6c16a42db7c4336d6b16658fa0449fb3"
  end

  resource "email-validator" do
    url "https://files.pythonhosted.org/packages/f5/22/900cb125c76b7aaa450ce02fd727f452243f2e91a61af068b40adba60ea9/email_validator-2.3.0.tar.gz"
    sha256 "9fc05c37f2f6cf439ff414f8fc46d917929974a82244c20eb10231ba60c54426"
  end

  resource "enum-compat" do
    url "https://files.pythonhosted.org/packages/41/46/8ed2368976d934652d8f33f1fdd86f5580fab45e890c90a848e83097a093/enum-compat-0.0.3.tar.gz"
    sha256 "3677daabed56a6f724451d585662253d8fb4e5569845aafa8bb0da36b1a8751e"
  end

  resource "executing" do
    url "https://files.pythonhosted.org/packages/cc/28/c14e053b6762b1044f34a13aab6859bbf40456d37d23aa286ac24cfd9a5d/executing-2.2.1.tar.gz"
    sha256 "3632cc370565f6648cc328b32435bd120a1e4ebb20c77e3fdde9a13cd1e533c4"
  end

  resource "fastapi" do
    url "https://files.pythonhosted.org/packages/e7/7b/f8e0211e9380f7195ba3f3d40c292594fd81ba8ec4629e3854c353aaca45/fastapi-0.135.1.tar.gz"
    sha256 "d04115b508d936d254cea545b7312ecaa58a7b3a0f84952535b4c9afae7668cd"
  end

  resource "fastapi-cli" do
    url "https://files.pythonhosted.org/packages/6e/58/74797ae9e4610cfa0c6b34c8309096d3b20bb29be3b8b5fbf1004d10fa5f/fastapi_cli-0.0.24.tar.gz"
    sha256 "1afc9c9e21d7ebc8a3ca5e31790cd8d837742be7e4f8b9236e99cb3451f0de00"
  end

  resource "fastapi-cloud-cli" do
    url "https://files.pythonhosted.org/packages/a9/2e/3b6e5016affc310e5109bc580f760586eabecea0c8a7ab067611cd849ac0/fastapi_cloud_cli-0.1.5.tar.gz"
    sha256 "341ee585eb731a6d3c3656cb91ad38e5f39809bf1a16d41de1333e38635a7937"
  end

  resource "gpxpy" do
    url "https://files.pythonhosted.org/packages/2a/c1/da7df89bd25eea5f464e335b2471f78c1e8f4d6ea2b2410bd89282fcf3c5/gpxpy-1.5.0.tar.gz"
    sha256 "e6993a8945eae07a833cd304b88bbc6c3c132d63b2bf4a9b0a5d9097616b8708"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/01/ee/02a2c011bdab74c6fb3c75474d40b3052059d95df7e73351460c8588d963/h11-0.16.0.tar.gz"
    sha256 "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1"
  end

  resource "hexdump" do
    url "https://files.pythonhosted.org/packages/55/b3/279b1d57fa3681725d0db8820405cdcb4e62a9239c205e4ceac4391c78e4/hexdump-3.3.zip"
    sha256 "d781a43b0c16ace3f9366aade73e8ad3a7bd5137d58f0b45ab2d3f54876f20db"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/06/94/82699a10bca87a5556c9c59b5963f2d039dbd239f25bc2a63907a05a14cb/httpcore-1.0.9.tar.gz"
    sha256 "6e34463af53fd2ab5d807f399a9b45ea31c3dfa2276f15a2c3f00afff6e176e8"
  end

  resource "httptools" do
    url "https://files.pythonhosted.org/packages/b5/46/120a669232c7bdedb9d52d4aeae7e6c7dfe151e99dc70802e2fc7a5e1993/httptools-0.7.1.tar.gz"
    sha256 "abd72556974f8e7c74a259655924a717a2365b236c882c3f6f8a45fe94703ac9"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/b1/df/48c586a5fe32a0f01324ee087459e112ebb7224f646c0b5023f5e79e9956/httpx-0.28.1.tar.gz"
    sha256 "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
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
    url "https://files.pythonhosted.org/packages/6f/6d/0703ccc57f3a7233505399edb88de3cbd678da106337b9fcde432b65ed60/idna-3.11.tar.gz"
    sha256 "795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902"
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
    url "https://files.pythonhosted.org/packages/2c/96/c820ec1e2f50d398c2442b2f8759448a896a300745c2920c4cf7ba89dd4c/ipsw_parser-1.5.0.tar.gz"
    sha256 "5becd2000017b7b8549cc6b6e3f5149541792bf6353663d0f77932965bf26aad"
  end

  resource "ipython" do
    url "https://files.pythonhosted.org/packages/86/28/a4698eda5a8928a45d6b693578b135b753e14fa1c2b36ee9441e69a45576/ipython-9.11.0.tar.gz"
    sha256 "2a94bc4406b22ecc7e4cb95b98450f3ea493a76bec8896cda11b78d7752a6667"
  end

  resource "ipython-pygments-lexers" do
    url "https://files.pythonhosted.org/packages/ef/4c/5dd1d8af08107f88c7f741ead7a40854b8ac24ddf9ae850afbcf698aa552/ipython_pygments_lexers-1.1.1.tar.gz"
    sha256 "09c0138009e56b6854f9535736f4171d855c8c08a563a0dcd8022f78355c7e81"
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
    url "https://files.pythonhosted.org/packages/5b/f5/4ec618ed16cc4f8fb3b701563655a69816155e79e24a17b651541804721d/markdown_it_py-4.0.0.tar.gz"
    sha256 "cb0a2b4aa34f932c007117b194e945bd74e0ec24133ceb5bac59009cda1cb9f3"
  end

  resource "markupsafe" do
    url "https://files.pythonhosted.org/packages/7e/99/7690b6d4034fffd95959cbe0c02de8deb3098cc577c67bb6a24fe5d7caa7/markupsafe-3.0.3.tar.gz"
    sha256 "722695808f4b6457b320fdc131280796bdceb04ab50fe1795cd540799ebe1698"
  end

  resource "matplotlib-inline" do
    url "https://files.pythonhosted.org/packages/c7/74/97e72a36efd4ae2bccb3463284300f8953f199b5ffbc04cbbb0ec78f74b1/matplotlib_inline-0.2.1.tar.gz"
    sha256 "e1ee949c340d771fc39e241ea75683deb94762c8fa5f2927ec57c83c4dffa9fe"
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
    url "https://files.pythonhosted.org/packages/19/3b/fd9ff8ff64ae3900f11554d5cfc835fb73e501e043c420ad32ec574fe27f/orjson-3.11.1.tar.gz"
    sha256 "48d82770a5fd88778063604c566f9c7c71820270c9cc9338d25147cbf34afd96"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/a1/d4/1fc4078c65507b51b96ca8f8c3ba19e6a61c8253c72794544580a7b6c24d/packaging-25.0.tar.gz"
    sha256 "d443872c98d677bf60f6a1f2f8c1cb748e8fe762d2bf9d3148b5599295b0fc4f"
  end

  resource "parameter-decorators" do
    url "https://files.pythonhosted.org/packages/40/b9/03b5e409930cb4cff0f25f6f3199145f4319a88d5f9be7ee17882359f72d/parameter_decorators-0.0.2.tar.gz"
    sha256 "499ec96e71394705be9e3eeb28542aab4875694042516c31051d5dcb0488028e"
  end

  resource "parso" do
    url "https://files.pythonhosted.org/packages/81/76/a1e769043c0c0c9fe391b702539d594731a4362334cdf4dc25d0c09761e7/parso-0.8.6.tar.gz"
    sha256 "2b9a0332696df97d454fa67b81618fd69c35a7b90327cbe6ba5c92d2c68a7bfd"
  end

  resource "pdm-backend" do
    url "https://files.pythonhosted.org/packages/e2/38/d22c1050130b8cdf16fef76c99c59968086802744947f2813d45c69cca52/pdm_backend-2.4.7.tar.gz"
    sha256 "a509d083850378ce919d41e7a2faddfc57a1764d376913c66731125d6b14110f"
  end

  resource "pexpect" do
    url "https://files.pythonhosted.org/packages/42/92/cc564bf6381ff43ce1f4d06852fc19a2f11d180f23dc32d9588bee2f149d/pexpect-4.9.0.tar.gz"
    sha256 "ee7d41123f3c9911050ea2c2dac107568dc43b2d3b0c7557a33212c398ead30f"
  end

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/1f/42/5c74462b4fd957fcd7b13b04fb3205ff8349236ea74c7c375766d6c82288/pillow-12.1.1.tar.gz"
    sha256 "9ad8fa5937ab05218e2b6a4cff30295ad35afd2f83ac592e68c0d871bb0fdbc4"
  end

  resource "plumbum" do
    url "https://files.pythonhosted.org/packages/dc/c8/11a5f792704b70f071a3dbc329105a98e9cc8d25daaf09f733c44eb0ef8e/plumbum-1.10.0.tar.gz"
    sha256 "f8cbf0ecec0b73ff4e349398b65112a9e3f9300e7dc019001217dcc148d5c97c"
  end

  resource "prompt-toolkit" do
    url "https://files.pythonhosted.org/packages/a1/96/06e01a7b38dce6fe1db213e061a4602dd6032a8a97ef6c1a862537732421/prompt_toolkit-3.0.52.tar.gz"
    sha256 "28cde192929c8e7321de85de1ddbe736f1375148b02f2e17edd840042b1be855"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/aa/c6/d1ddf4abb55e93cebc4f2ed8b5d6dbad109ecb8d63748dd2b20ab5e57ebe/psutil-7.2.2.tar.gz"
    sha256 "0746f5f8d406af344fd547f1c8daa5f5c33dbc293bb8d6a16d80b4bb88f59372"
  end

  resource "ptyprocess" do
    url "https://files.pythonhosted.org/packages/20/e5/16ff212c1e452235a90aeb09066144d0c5a6a8c0834397e03f5224495c4e/ptyprocess-0.7.0.tar.gz"
    sha256 "5c5d0a3b48ceee0b48485e0c26037c0acd7d29765ca3fbb5cb3831d347423220"
  end

  resource "pure-eval" do
    url "https://files.pythonhosted.org/packages/cd/05/0a34433a064256a578f1783a10da6df098ceaa4a57bbeaa96a6c0352786b/pure_eval-0.2.3.tar.gz"
    sha256 "5f4e983f40564c576c7c8635ae88db5956bb2229d7e9237d03b3c0b0190eaf42"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/1b/7d/92392ff7815c21062bea51aa7b87d45576f649f16458d78b7cf94b9ab2e6/pycparser-3.0.tar.gz"
    sha256 "600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29"
  end

  resource "pycrashreport" do
    url "https://files.pythonhosted.org/packages/d5/0b/534e02c6badef117b5a4054c065b50e6055d833b983b024d57afb425b618/pycrashreport-1.2.7.tar.gz"
    sha256 "8f4d52d3292c1ec479fac589633d1477d19fbeb6ab01960969389c6a9c63ed7f"
  end

  resource "pycryptodome" do
    url "https://files.pythonhosted.org/packages/8e/a6/8452177684d5e906854776276ddd34eca30d1b1e15aa1ee9cefc289a33f5/pycryptodome-3.23.0.tar.gz"
    sha256 "447700a657182d60338bab09fdb27518f8856aecd80ae4c6bdddb67ff5da44ef"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/69/44/36f1a6e523abc58ae5f928898e4aca2e0ea509b5aa6f6f392a5d882be928/pydantic-2.12.5.tar.gz"
    sha256 "4d351024c75c0f085a9febbb665ce8c0c6ec5d30e903bdb6394b7ede26aebb49"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/71/70/23b021c950c2addd24ec408e9ab05d59b035b39d97cdc1130e1bce647bb6/pydantic_core-2.41.5.tar.gz"
    sha256 "08daa51ea16ad373ffd5e7606252cc32f07bc72b28284b6bc9c6df804816476e"
  end

  resource "pydantic-extra-types" do
    url "https://files.pythonhosted.org/packages/fd/35/2fee58b1316a73e025728583d3b1447218a97e621933fc776fb8c0f2ebdd/pydantic_extra_types-2.11.0.tar.gz"
    sha256 "4e9991959d045b75feb775683437a97991d02c138e00b59176571db9ce634f0e"
  end

  resource "pydantic-settings" do
    url "https://files.pythonhosted.org/packages/52/6d/fffca34caecc4a3f97bda81b2098da5e8ab7efc9a66e819074a11955d87e/pydantic_settings-2.13.1.tar.gz"
    sha256 "b4c11847b15237fb0171e1462bf540e294affb9b86db4d9aa5c01730bdbe4025"
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
    url "https://files.pythonhosted.org/packages/3c/5c/69bad79b4e9d7be46063e9ea15e82c79ae0dec90811501453003588aab62/pyimg4-0.8.8.tar.gz"
    sha256 "aafebb2bc7922f6cf551b1b9e982d2da039cbeb08f0a2e2048a1818d51c76da1"
  end

  resource "pykdebugparser" do
    url "https://files.pythonhosted.org/packages/fe/f0/aadf94718a4f768d2928f31544a16fbed5c0cb5e4bc2cf0f21939fbd1caa/pykdebugparser-1.2.7.tar.gz"
    sha256 "bdf10a1a5b8617265301359162c798a72db11403facfd13e22717cd733e21c54"
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
    url "https://files.pythonhosted.org/packages/82/ed/0301aeeac3e5353ef3d94b6ec08bbcabd04a72018415dcb29e588514bba8/python_dotenv-1.2.2.tar.gz"
    sha256 "2c371a91fbd7ba082c2c1dc1f8bf89ca22564a087c2c287cd9b662adde799cf3"
  end

  resource "python-multipart" do
    url "https://files.pythonhosted.org/packages/94/01/979e98d542a70714b0cb2b6728ed0b7c46792b695e3eaec3e20711271ca3/python_multipart-0.0.22.tar.gz"
    sha256 "7340bef99a7e0032613f56dc36027b959fd3b30a787ed62d310e951f7c3a3a58"
  end

  resource "python-pcapng" do
    url "https://files.pythonhosted.org/packages/3c/2f/72534730a81205cd3ca32d65b4760c927e6ffc69a3d06ff3d1edda64ae3e/python-pcapng-2.1.1.tar.gz"
    sha256 "6477e72513165954e56d5836ebbd43ac7f8d28c4640f78d63d6506d1692ddc74"
  end

  resource "pytun-pmd3" do
    url "https://files.pythonhosted.org/packages/5e/8a/6e73c70ddf5fdf9cf359cdc458f38cf795c4a653c870a4a49c8768e5db86/pytun_pmd3-3.0.3.tar.gz"
    sha256 "7fa822092139b4b77e08fad9233dbd4a6fcca2cf2423b0775db962ca5e87a017"
  end

  resource "pyusb" do
    url "https://files.pythonhosted.org/packages/00/6b/ce3727395e52b7b76dfcf0c665e37d223b680b9becc60710d4bc08b7b7cb/pyusb-1.3.1.tar.gz"
    sha256 "3af070b607467c1c164f49d5b0caabe8ac78dbed9298d703a8dbf9df4052d17e"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17/pyyaml-6.0.2.tar.gz"
    sha256 "d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e"
  end

  resource "qh3" do
    url "https://files.pythonhosted.org/packages/c0/60/c0afa2ad69ed41644f0f3fc925a2f74e56066ce85404a13badae193348bc/qh3-1.5.4.tar.gz"
    sha256 "eaaab5103c521bfaf453ee29c09c50ab8a53ca4e226dd83680d3a3eec6012314"
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
    url "https://files.pythonhosted.org/packages/c9/74/b3ff8e6c8446842c3f5c837e9c3dfcfe2018ea6ecef224c710c85ef728f4/requests-2.32.5.tar.gz"
    sha256 "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/b3/c6/f3b320c27991c46f43ee9d856302c70dc2d0fb2dba4842ff739d5f46b393/rich-14.3.3.tar.gz"
    sha256 "b8daa0b9e4eef54dd8cf7c86c03713f53241884e814f4e2f5fb342fe520f639b"
  end

  resource "rich-toolkit" do
    url "https://files.pythonhosted.org/packages/42/ba/dae9e3096651042754da419a4042bc1c75e07d615f9b15066d738838e4df/rich_toolkit-0.19.7.tar.gz"
    sha256 "133c0915872da91d4c25d85342d5ec1dfacc69b63448af1a08a0d4b4f23ef46e"
  end

  resource "rignore" do
    url "https://files.pythonhosted.org/packages/e5/f5/8bed2310abe4ae04b67a38374a4d311dd85220f5d8da56f47ae9361be0b0/rignore-0.7.6.tar.gz"
    sha256 "00d3546cd793c30cb17921ce674d2c8f3a4b00501cb0e3dd0e82217dbeba2671"
  end

  resource "runs" do
    url "https://files.pythonhosted.org/packages/f2/ae/095cb626504733e288a81f871f86b10530b787d77c50193c170daaca0df1/runs-1.3.0.tar.gz"
    sha256 "cca304b631dbefec598c7bfbcfb50d6feace6d3a968734b67fd42d3c728f5a05"
  end

  resource "sentry-sdk" do
    url "https://files.pythonhosted.org/packages/c8/e9/2e3a46c304e7fa21eaa70612f60354e32699c7102eb961f67448e222ad7c/sentry_sdk-2.54.0.tar.gz"
    sha256 "2620c2575128d009b11b20f7feb81e4e4e8ae08ec1d36cbc845705060b45cc1b"
  end

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/4f/db/cfac1baf10650ab4d1c111714410d2fbb77ac5a616db26775db562c8fab2/setuptools-82.0.1.tar.gz"
    sha256 "7d872682c5d01cfde07da7bccc7b65469d3dca203318515ada1de5eda35efbf9"
  end

  resource "shellingham" do
    url "https://files.pythonhosted.org/packages/58/15/8b3609fd3830ef7b27b655beb4b4e9c62313a4e8da8c676e142cc210d58e/shellingham-1.5.4.tar.gz"
    sha256 "8dbca0739d487e5bd35ab3ca4b36e11c4078f3a234bfce294b0a0291363404de"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "sniffio" do
    url "https://files.pythonhosted.org/packages/a2/87/a6771e1546d97e7e041b6ae58d80074f81b7d5121207425c964ddf5cfdbd/sniffio-1.3.1.tar.gz"
    sha256 "f4324edc670a0f49750a81b895f35c3adb843cca46f0530f79fc1babb23789dc"
  end

  resource "srptools" do
    url "https://files.pythonhosted.org/packages/a1/8a/d62af55a56d56216e96563bc9c29c2d16d957317742c2e5bd4e79a524b06/srptools-1.0.1.tar.gz"
    sha256 "7fa4337256a1542e8f5bb4bed19e1d9aea98fe5ff9baf76693342a1dd6ac7c96"
  end

  resource "stack-data" do
    url "https://files.pythonhosted.org/packages/28/e3/55dcc2cfbc3ca9c29519eb6884dd1415ecb53b0e934862d3559ddcb7e20b/stack_data-0.6.3.tar.gz"
    sha256 "836a778de4fec4dcd1dcd89ed8abff8a221f58308462e1c4aa2a3cf30148f0b9"
  end

  resource "starlette" do
    url "https://files.pythonhosted.org/packages/c4/68/79977123bb7be889ad680d79a40f339082c1978b5cfcf62c2d8d196873ac/starlette-0.52.1.tar.gz"
    sha256 "834edd1b0a23167694292e94f597773bc3f89f362be6effee198165a35d62933"
  end

  resource "termcolor" do
    url "https://files.pythonhosted.org/packages/46/79/cf31d7a93a8fdc6aa0fbb665be84426a8c5a557d9240b6239e9e11e35fc5/termcolor-3.3.0.tar.gz"
    sha256 "348871ca648ec6a9a983a13ab626c0acce02f515b9e1983332b17af7979521c5"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/09/a9/6ba95a270c6f1fbcd8dac228323f2777d886cb206987444e4bce66338dd4/tqdm-4.67.3.tar.gz"
    sha256 "7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb"
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
    url "https://files.pythonhosted.org/packages/a3/53/07dac71db45fb6b3c71c2fd29a87cada2239eac7ecfb318e6ebc7da00a3b/types_python_dateutil-2.9.0.20250809.tar.gz"
    sha256 "69cbf8d15ef7a75c3801d65d63466e46ac25a0baa678d89d0a137fc31a608cc1"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f/typing_extensions-4.15.0.tar.gz"
    sha256 "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
  end

  resource "typing-inspection" do
    url "https://files.pythonhosted.org/packages/55/e3/70399cb7dd41c10ac53367ae42139cf4b1ca5f36bb3dc6c9d33acdb43655/typing_inspection-0.4.2.tar.gz"
    sha256 "ba561c48a67c5958007083d386c3295464928b01faa735ab8547c5692e87f464"
  end

  resource "ujson" do
    url "https://files.pythonhosted.org/packages/f0/00/3110fd566786bfa542adb7932d62035e0c0ef662a8ff6544b6643b3d6fd7/ujson-5.10.0.tar.gz"
    sha256 "b3cd8f3c5d8c7738257f1018880444f7b7d9b66232c64649f562d7ba86ad4bc1"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/c7/24/5f1b3bdffd70275f6661c76461e25f024d5a38a46f04aaca912426a2b1d3/urllib3-2.6.3.tar.gz"
    sha256 "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
  end

  resource "uvicorn" do
    url "https://files.pythonhosted.org/packages/32/ce/eeb58ae4ac36fe09e3842eb02e0eb676bf2c53ae062b98f1b2531673efdd/uvicorn-0.41.0.tar.gz"
    sha256 "09d11cf7008da33113824ee5a1c6422d89fbc2ff476540d69a34c87fab8b571a"
  end

  resource "uvloop" do
    url "https://files.pythonhosted.org/packages/06/f0/18d39dbd1971d6d62c4629cc7fa67f74821b0dc1f5a77af43719de7936a7/uvloop-0.22.1.tar.gz"
    sha256 "6c84bae345b9147082b17371e3dd5d42775bddce91f885499017f4607fdaf39f"
  end

  resource "watchfiles" do
    url "https://files.pythonhosted.org/packages/c2/c9/8869df9b2a2d6c59d79220a4db37679e74f807c559ffe5265e08b227a210/watchfiles-1.1.1.tar.gz"
    sha256 "a173cb5c16c4f40ab19cecf48a534c409f7ea983ab8fed0741304a1c0a31b3f2"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/35/a2/8e3becb46433538a38726c948d3399905a4c7cabd0df578ede5dc51f0ec2/wcwidth-0.6.0.tar.gz"
    sha256 "cdc4e4262d6ef9a1a57e018384cbeb1208d8abbc64176027e2c2455c81313159"
  end

  resource "websockets" do
    url "https://files.pythonhosted.org/packages/04/24/4b2031d72e840ce4c1ccb255f693b15c334757fc50023e4db9537080b8c4/websockets-16.0.tar.gz"
    sha256 "5f6261a5e56e8d5c42a4497b364ea24d94d9563e8fbd44e78ac40879c60179b5"
  end

  resource "wsproto" do
    url "https://files.pythonhosted.org/packages/c7/79/12135bdf8b9c9367b8701c2c19a14c913c120b882d50b014ca0d38083c2c/wsproto-1.3.2.tar.gz"
    sha256 "b86885dcf294e15204919950f666e06ffc6c7c114ca900b060d6e16293528294"
  end

  resource "xmod" do
    url "https://files.pythonhosted.org/packages/8b/3f/0bc3b89c1dd4dee1f954db4c857f8fbe9cdfa8b25efe370b6d78399a93ac/xmod-1.9.0.tar.gz"
    sha256 "98b2e7e8e659c51b635f4e98faf3fa1f3f96dab2805f19ddd6e352bbb4d23991"
  end

  resource "xonsh" do
    url "https://files.pythonhosted.org/packages/ff/d5/644e5f4dcc283d69a6454a01edfe0783931fdc90ccf3b6654ad3290cd59d/xonsh-0.22.7.tar.gz"
    sha256 "80f0298c111cb70d5e2d637982dcf402b2573ce712ab0c8134904774531d4709"
  end

  resource "zeroconf" do
    url "https://files.pythonhosted.org/packages/24/7d/02e8c583b57692eee495e60c7a4dd862635a9702067d69c6dd1c907cb589/zeroconf-0.132.2.tar.gz"
    sha256 "9ad8bc6e3f168fe8c164634c762d3265c775643defff10e26273623a12d73ae1"
  end

  def install
    virtualenv_install_with_resources(using: "python@3.14")
  end

  service do
    run [opt_bin/"sidejitserver"]
    working_dir opt_prefix
    keep_alive true
  end

  test do
    system bin/"sidejitserver", "--version"
  end
end
