# [R] Miniforge3 (aka Python 3 envs), exact version not managed by Brew, auto_updates true, modified from https://github.com/Homebrew/homebrew-core/pull/42144
class MiniforgeMac < Formula
  desc "Minimal installer for conda specific to conda-forge"
  homepage "https://github.com/conda-forge/miniforge/"
  url "https://raw.githubusercontent.com/conda-forge/miniforge/main/build_miniforge_osx.sh"
  version "3"
  license "BSD-3-Clause"
  livecheck do
    skip
  end

  keg_only "it contains `python`"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh"
    sha256 :no_check
  elsif Hardware::CPU.intel?
    url "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-x86_64.sh"
    sha256 :no_check
  end

  conflicts_with cask: "miniconda"
  conflicts_with cask: "anaconda"
  conflicts_with cask: "miniforge"
  conflicts_with cask: "mambaforge"

  def install
    if Hardware::CPU.arm?
      system "/bin/bash",
        "Miniforge3-MacOSX-arm64.sh", "-b", "-p", "#{prefix}/conda/../", "--mandir=#{man}"
    end

    if Hardware::CPU.intel?
      system "/bin/bash",
        "Miniforge3-MacOSX-x86_64.sh", "-b", "-p", "#{prefix}/conda/../", "--mandir=#{man}"
    end

    bin.install_symlink Dir["#{prefix}/conda/../condabin/*"]
    rm_rf "#{prefix}/conda"
  end

  def caveats
    <<~EOS
      Please run the following to setup your shell:
      #{prefix}/condabin/conda init "$(basename "${SHELL}")"
      Or run environment in your terminal:
      source #{prefix}/bin/activate
    EOS
  end

  test do
    # Make sure our bin runs
    system "#{bin}/conda", "info"
    # Ensure it is our bin
    assert_equal "#{prefix}\n", shell_output("#{bin}/conda info --base")
  end
end
