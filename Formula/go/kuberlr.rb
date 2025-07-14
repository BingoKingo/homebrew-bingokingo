class Kuberlr < Formula
  desc "Simplify the management of multiple versions of kubectl"
  homepage "https://github.com/flavio/kuberlr/"
  url "https://github.com/flavio/kuberlr/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "a6c796bb386ed928e0aff8f3d97317a22208eaa9415febea4e5b989a995140fc"
  license "Apache-2.0"
  head "https://github.com/flavio/kuberlr.git", branch: "main"

  depends_on "go" => :build

  def install
      system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/kuberlr"
  end

  def caveats
    <<~EOS
      `kuberlr` is not symlink as `kubectl` as default
    EOS
  end

  test do
    system bin/"kuberlr", "version"
  end
end
