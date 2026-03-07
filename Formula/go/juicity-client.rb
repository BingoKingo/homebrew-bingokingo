class JuicityClient < Formula
  desc "Client app of Juicity QUIC-based proxy protocol implementation"
  homepage "https://github.com/juicity/juicity/"
  url "https://github.com/juicity/juicity/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "bc3cab6a52546a17a2f6387fc6d500543e907a2f8573c3e9fcea25903e62b782"
  license "AGPL-3.0-or-later"
  head "https://github.com/juicity/juicity.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "086e4b42e8b0db826b919641362ff8b40a73b7cb23903aa1257e3dbf9627296a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "086e4b42e8b0db826b919641362ff8b40a73b7cb23903aa1257e3dbf9627296a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "086e4b42e8b0db826b919641362ff8b40a73b7cb23903aa1257e3dbf9627296a"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "18deba559615ac63c70b8336ac046bbde229435739cd04986fd30e24339d5645"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "297026580253cc889fa5327ed947bd687a3f1296b553c0b344cdca4aa5332d6e"
  end

  depends_on "go" => :build

  def install
    system "make", "juicity-client"
    bin.install "juicity-client"
  end

  service do
    run [opt_bin/"juicity-client", "run", "-c", etc/"juicity/client.json"]
    working_dir opt_prefix
    keep_alive true
  end

  test do
    client_port = free_port
    (testpath/"client.json").write <<~JSON
      {
        "listen": ":#{client_port}",
        "server": "127.0.0.1:#{free_port}",
        "uuid": "00000000-0000-0000-0000-000000000000",
        "password": "my_password",
        "sni": "localhost",
        "allow_insecure": true,
        "congestion_control": "bbr",
        "log_level": "info"
      }
    JSON

    assert_match "Flags", shell_output("#{bin}/juicity-client -h")
    begin
      assert_match client_port.to_s, shell_output("#{bin}/juicity-client run -c #{testpath}/client.json", 10)
    rescue
      nil
    end
  end
end
