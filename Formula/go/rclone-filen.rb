# [M] Modified from https://github.com/gromgit/homebrew-fuse/blob/HEAD/Formula/rclone-mac.rb
class RcloneFilen < Formula
  desc "Rsync for cloud storage (with macOS FUSE mount support)"
  homepage "https://github.com/JupiterPi/filen-rclone/"
  head "https://github.com/JupiterPi/filen-rclone.git", branch: "master"

  depends_on "go" => :build

  patch :DATA

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
__END__
diff --git a/go.sum b/go.sum
index 06c624ff9..20e3c149b 100644
--- a/go.sum
+++ b/go.sum
@@ -53,7 +53,8 @@ github.com/AzureAD/microsoft-authentication-library-for-go v1.2.2 h1:XHOnouVk1mx
 github.com/AzureAD/microsoft-authentication-library-for-go v1.2.2/go.mod h1:wP83P5OoQ5p6ip3ScPr0BAq0BvuPAvacpEuSzyouqAI=
 github.com/BurntSushi/toml v0.3.1/go.mod h1:xHWCNGjB5oqiDr8zfno3MHue2Ht5sIBksp03qcyfWMU=
 github.com/BurntSushi/xgb v0.0.0-20160522181843-27f122750802/go.mod h1:IVnqGOEym/WlBOVXweHU+Q+/VP0lqqI8lqeDx9IjBqo=
-github.com/FilenCloudDienste/filen-sdk-go v0.0.1/go.mod h1:1pPSvQMGCX0i5Llbhp33eNO6heXIle10bENTBqiJVwo=
+github.com/FilenCloudDienste/filen-sdk-go v0.0.4 h1:ARpNq1JTcYueBkp1JWkRtpq1M4uiEqgstpnxATje+0U=
+github.com/FilenCloudDienste/filen-sdk-go v0.0.4/go.mod h1:1pPSvQMGCX0i5Llbhp33eNO6heXIle10bENTBqiJVwo=
 github.com/Masterminds/semver/v3 v3.2.0 h1:3MEsd0SM6jqZojhjLWWeBY+Kcjy9i6MQAeY7YgDP83g=
 github.com/Masterminds/semver/v3 v3.2.0/go.mod h1:qvl/7zhW3nngYb5+80sSMF+FG2BjYrf8m9wsX0PNOMQ=
 github.com/Max-Sum/base32768 v0.0.0-20230304063302-18e6ce5945fd h1:nzE1YQBdx1bq9IlZinHa+HVffy+NmVRoKr+wHN8fpLE=
