class Ksud < Formula
  desc "KernelSU daemon and CLI tool"
  homepage "https://kernelsu.org/guide/installation.html"
  url "https://github.com/tiann/KernelSU/archive/refs/tags/v3.1.0.tar.gz"
  sha256 "4d0a6cde6ecac08f95758bce8ff54484a256980d79ef128d8bb19c648df216f1"
  license "GPL-3.0-or-later"
  head "https://github.com/tiann/KernelSU.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/bingokingo/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "7a567b5d98925c8f974ef2ea125dd4c6e96e4e91ff6a1f8105a2b195b2977b35"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fc4be98892e252a682f2575e9b9857a56135e2473dba75275daf3838e9c7beb1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "961449d31d6f1629fa5b1f387f5328d70c5987dac76b87b02929a7bb230399de"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "b3ff13d5c46bdab298cd2fd2a317ddf0246a84905ffa7616291ecfa1385581cb"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "77c8a07beae1ce1b7b1d5e6d74c51245c859c029047d56f08c23bc3c89f7bc8d"
  end

  depends_on "rust" => :build

  patch :DATA

  def install
    cd "userspace/ksud" do
      ENV["KSUD_VERSION"] = version
      system "cargo", "install", *std_cargo_args
      bin.install "target/release/ksud"
    end
  end

  test do
    output = shell_output("#{bin}/ksud --help")
    assert_match "KernelSU cli for non-android", output
    assert_match "Usage", output
    assert_match "Commands", output
    assert_match "Options", output
    version_output = shell_output("#{bin}/ksud -V")
    assert_match "ksud #{version}", version_output
  end
end
__END__
diff --git a/userspace/ksud/build.rs b/userspace/ksud/build.rs
index dec4d023..b28e910e 100644
--- a/userspace/ksud/build.rs
+++ b/userspace/ksud/build.rs
@@ -29,12 +29,17 @@ fn get_git_version() -> Result<(u32, String), std::io::Error> {
 }
 
 fn main() {
-    let (code, name) = match get_git_version() {
-        Ok((code, name)) => (code, name),
-        Err(_) => {
-            // show warning if git is not installed
-            println!("cargo:warning=Failed to get git version, using 0.0.0");
-            (0, "0.0.0".to_string())
+    let (code, name) = if let Ok(version) = std::env::var("KSUD_VERSION") {
+        // Use version from environment variable
+        (30000, version)
+    } else {
+        match get_git_version() {
+            Ok((code, name)) => (code, name),
+            Err(_) => {
+                // show warning if git is not installed
+                println!("cargo:warning=Failed to get git version, using 0.0.0");
+                (0, "0.0.0".to_string())
+            }
         }
     };
     let out_dir = env::var("OUT_DIR").expect("Failed to get $OUT_DIR");
