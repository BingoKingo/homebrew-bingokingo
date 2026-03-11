class Kuberlr < Formula
  desc "Simplify the management of multiple versions of kubectl"
  homepage "https://github.com/flavio/kuberlr/"
  url "https://github.com/flavio/kuberlr/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "a6c796bb386ed928e0aff8f3d97317a22208eaa9415febea4e5b989a995140fc"
  license "Apache-2.0"
  head "https://github.com/flavio/kuberlr.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "30ee2b1806f51ec103b5aac2b2912e3f57f235892bb3b67d8c8309d0c7104d8b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "30ee2b1806f51ec103b5aac2b2912e3f57f235892bb3b67d8c8309d0c7104d8b"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "30ee2b1806f51ec103b5aac2b2912e3f57f235892bb3b67d8c8309d0c7104d8b"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "e9d02425225334881662c12b8185ad9ba519eafe1c430b6ce7a4e49e2308fa91"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8031a5338c473411bed07119db9826c02cba2c666d07f316cac15de4115b358a"
  end

  depends_on "go" => :build

  def install
    build_date = Time.now.strftime("%Y%m%d")
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/flavio/kuberlr/pkg/kuberlr.Version=#{version} -X github.com/flavio/kuberlr/pkg/kuberlr.BuildDate=#{build_date} -X github.com/flavio/kuberlr/pkg/kuberlr.Tag=v#{version} -X github.com/flavio/kuberlr/pkg/kuberlr.ClosestTag=v#{version}"), "./cmd/kuberlr"
  end

  def caveats
    <<~EOS
      `kuberlr` is not symlink as `kubectl` as default
    EOS
  end

  test do
    output = shell_output("#{bin}/kuberlr -h")
    assert_match "Usage", output
    assert_match "Available Commands", output
    assert_match "Flags", output
    assert_match "Commands", output
    version_output = shell_output("#{bin}/kuberlr version")
    assert_match "kuberlr version: #{version}", version_output
  end
end
