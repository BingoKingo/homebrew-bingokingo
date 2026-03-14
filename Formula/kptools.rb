class Kptools < Formula
  desc "Kernel Image Patch Tools for Linux kernel patching and hooking"
  homepage "https://github.com/bmax121/KernelPatch/"
  url "https://github.com/bmax121/KernelPatch/archive/refs/tags/0.13.0.tar.gz"
  sha256 "f872d94340ad9816257787540df5fd84faf6546553dee645c996e8e38b3489c4"
  license "GPL-2.0-or-later"
  head "https://github.com/bmax121/KernelPatch.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any,                 arm64_tahoe:   "87b4a60a49b334b3d7f4c502f6afa7412654751f8cc98360745ca202ecf82809"
    sha256 cellar: :any,                 arm64_sequoia: "e7d1e7afbd928c52f0626091202593ef2f3b4014eb2d0c8f8a543dd0c6f84919"
    sha256 cellar: :any,                 arm64_sonoma:  "23ec10ef7dea3583e9105a6ea6c5e5680a010310fc18b51725d8bfe4f0ba1349"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "58f4e23ab689f3b6a13ebea13d4ffff8fd876e479023679526b505b87fa19442"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "73ce742f297d13a1e161f2bca91df4ac6d2a83859bfab9525490ccba7bf02ec8"
  end

  depends_on "zlib" => :build

  def install
    cp_r "kernel/include/preset.h", "tools/"
    cd "tools" do
      system "make"
      bin.install "kptools"
    end
  end

  test do
    # kptools outputs version in hex format: (MAJOR << 16) + (MINOR << 8) + PATCH
    expected_version = ((0 << 16) + (13 << 8) + 0).to_s(16)
    assert_match "Kernel Image Patch Tools. version: #{expected_version}", shell_output("#{bin}/kptools -h")
    assert_match expected_version, shell_output("#{bin}/kptools -v")
  end
end
