# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class ZathuraPdfMupdf < Formula
  desc "MuPDF backend plugin for zathura"
  homepage "https://pwmt.org/projects/zathura-pdf-mupdf/"
  url "https://pwmt.org/projects/zathura-pdf-mupdf/download/zathura-pdf-mupdf-0.4.1.tar.xz"
  sha256 "f982a01d6523fa25669381184c06a625edbfd7961cbdb0711dccfdb9c402ac2f"
  license ""

  depends_on "cmake" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "mupdf"
  depends_on "zathura"

  def install
    system "meson", "setup", "build", "-Dplugindir=#{lib}/zathura", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  def caveats
    <<~EOS
      Add #{lib}/zathura to your $ZATHURA_PLUGINS_PATH variable to load the plugin.
    EOS
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test zathura-pdf-mupdf`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
