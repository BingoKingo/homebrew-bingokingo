class RcloneTeldrive < Formula
  desc "Rsync for cloud storage (with macOS FUSE mount support)"
  homepage "https://github.com/divyam234/rclone/"
  url "https://github.com/tgdrive/rclone/archive/refs/tags/v1.70.1.tar.gz"
  sha256 "6dd141c2950ebc3990c96dc105f29d9d5dea09df78f931d18dcba681910f3cec"
  license "MIT"
  head "https://github.com/divyam234/rclone.git", branch: "main"
  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build",
      "-ldflags", "-s -X github.com/rclone/rclone/fs.Version=v#{version}",
      "-tags", "cmount", *std_go_args
    (libexec/"rclone").install_symlink bin/name.to_s => "rclone"
    man1.install "rclone.1" => "#{name}.1"
  end

  def caveats
    <<~EOS
      \033[1m[M]\033[0m Modified from
      https://github.com/gromgit/homebrew-fuse/blob/HEAD/Formula/rclone-mac.rb
    EOS
  end
  test do
    (testpath/"file1.txt").write "Test!"
    system bin/name.to_s, "copy", testpath/"file1.txt", testpath/"dist"
    assert_match File.read(testpath/"file1.txt"), File.read(testpath/"dist/file1.txt")
    system opt_libexec/"rclone/rclone", "copy", testpath/"file1.txt", testpath/"dast"
    assert_match File.read(testpath/"file1.txt"), File.read(testpath/"dast/file1.txt")
  end
end
