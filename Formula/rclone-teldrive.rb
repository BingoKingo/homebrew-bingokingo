class RcloneTeldrive < Formula
  desc "Rsync for cloud storage (with macOS FUSE mount support)"
  homepage "https://github.com/divyam234/rclone/"
  url "https://github.com/divyam234/rclone/archive/v1.65.1.tar.gz"
  sha256 "53cf422f4cb38654a1c10c3d2791a5353ecb1037e31194ec8af9ec31955befd8"
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
    system bin/name.to_s, "genautocomplete", "bash", "#{name}.bash"
    system bin/name.to_s, "genautocomplete", "zsh", "_#{name}"
    inreplace "#{name}.bash" do |s|
      s.gsub! "commands=(\"rclone\")", "commands=(\"#{name}\")"
      s.gsub!(/(-F __start_rclone) rclone$/, "\\1 #{name}")
    end
    bash_completion.install "#{name}.bash" => name.to_s
    zsh_completion.install "_#{name}"
  end

  test do
    (testpath/"file1.txt").write "Test!"
    system bin/name.to_s, "copy", testpath/"file1.txt", testpath/"dist"
    assert_match File.read(testpath/"file1.txt"), File.read(testpath/"dist/file1.txt")
    system opt_libexec/"rclone/rclone", "copy", testpath/"file1.txt", testpath/"dast"
    assert_match File.read(testpath/"file1.txt"), File.read(testpath/"dast/file1.txt")
  end
end
