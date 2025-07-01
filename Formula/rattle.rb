class Rattle < Formula
  desc "A Flutter based app for the Data Scientist using R"
  homepage "https://github.com/gjwgit/rattleng"
  version "6.5.2" # Update to match your release

  if OS.mac?
    url "https://access.togaware.com/rattle-dev-macos.zip"
    sha256 "d7684f161b2ec60ffb10052b536f4fee9756a4e9b075f5cb4cbd52bbc97839af"
  elsif OS.linux?
    url "https://access.togaware.com/rattle-dev-linux.zip"
    sha256 "63868f7120a3dae3b068c0b985a5886ef350b91acd0de28f43df151f6b2c217"
  end

  license "GPLv3"
  depends_on "r"

  def install
    if OS.mac?
      bin.install "rattle.app" => "rattle"
    elsif OS.linux?
      bin.install "rattle"
    end
    pkgshare.install "install_rattle_pkgs.R"
  end

  def caveats
    <<~EOS
      To use rattle, R is required, together with a suite of R packages.

      The R packages can be installed through Rattle's Download button
      amongst the top right icons.

      You can also install them all by running:
        Rscript #{opt_pkgshare}/install_rattle_pkgs.R
    EOS
  end

  test do
    system "#{bin}/rattle"
  end
end
