class Libflite < Formula
  desc "Small fast portable speech synthesis system"
  homepage "https://github.com/festvox/flite/"
  url "https://github.com/festvox/flite/archive/refs/tags/v2.2.tar.gz"
  sha256 "ab1555fe5adc3f99f1d4a1a0eb1596d329fd6d74f1464a0097c81f53c0cf9e5c"
  head "https://github.com/festvox/flite.git", branch: "master"

  patch :DATA if OS.mac? && build.head?

  def install
    args = ["--disable-dependency-tracking", "--prefix=#{prefix}"]
    system "./configure", *args
    system "make"
    system "make", "install"
  end

  def caveats
    <<~EOS
      \033[1m[M]\033[0m Modified from
      https://github.com/signalwire/homebrew-signalwire/blob/master/Formula/flite.rb
    EOS
  end
  test do
    system bin/"flite", "-h"
  end
end
__END__
diff --git a/main/Makefile b/main/Makefile
index 8166182..349edd6 100644
--- a/main/Makefile
+++ b/main/Makefile
@@ -159,8 +159,8 @@ install:
 	done
 	$(INSTALL) -m 755 $(BINDIR)/flite_time $(DESTDIR)$(INSTALLBINDIR)
 #       The libraries: static and shared (if built)
-	cp $(CP_FLAGS) $(flite_LIBS_deps) $(DESTDIR)$(INSTALLLIBDIR)
+	cp -pR $(flite_LIBS_deps) $(DESTDIR)$(INSTALLLIBDIR)
 ifdef SHFLAGS
-	cp $(CP_FLAGS) $(SHAREDLIBS) $(VERSIONSHAREDLIBS) $(DESTDIR)$(INSTALLLIBDIR)
+	cp -pR $(SHAREDLIBS) $(VERSIONSHAREDLIBS) $(DESTDIR)$(INSTALLLIBDIR)
 endif
