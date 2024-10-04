# [M] Modified from https://github.com/gromgit/homebrew-fuse/blob/HEAD/Formula/rclone-mac.rb
class RcloneTeldrive < Formula
  desc "Rsync for cloud storage (with macOS FUSE mount support)"
  homepage "https://github.com/divyam234/rclone/"
  url "https://github.com/divyam234/rclone/archive/v1.68.0.tar.gz"
  sha256 "39b4ed7b05491296e1867b68fc69e1861491a5eaa0fc193eef1e711177bbc956"
  license "MIT"
  head "https://github.com/divyam234/rclone.git"

  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build",
      "-ldflags", "-s -X github.com/rclone/rclone/fs.Version=v#{version}",
      "-tags", "cmount", *std_go_args
    (libexec/"rclone").install_symlink bin/name.to_s => "rclone"
    man1.install "rclone.1" => "#{name}.1"
  end

  test do
    (testpath/"file1.txt").write "Test!"
    system bin/name.to_s, "copy", testpath/"file1.txt", testpath/"dist"
    assert_match File.read(testpath/"file1.txt"), File.read(testpath/"dist/file1.txt")
    system opt_libexec/"rclone/rclone", "copy", testpath/"file1.txt", testpath/"dast"
    assert_match File.read(testpath/"file1.txt"), File.read(testpath/"dast/file1.txt")
  end
end
