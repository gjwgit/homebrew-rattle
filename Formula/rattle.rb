 class Rattle < Formula
  desc "A Flutter based app for the Data Scientist using R"
  homepage "https://github.com/gjwgit/rattleng"
  version "6.5.2" # Update to match your release

  if OS.mac?
    url "https://access.togaware.com/rattle-dev-macos.zip"
    sha256 "d7684f161b2ec60ffb10052b536f4fee9756a4e9b075f5cb4cbd52bbc97839af"
  elsif OS.linux?
    url "https://access.togaware.com/rattle-dev-linux.zip"
    sha256 "763868f7120a3dae3b068c0b985a5886ef350b91acd0de28f43df151f6b2c217"
  end

  license "GPLv3"
  depends_on "r"

  def install
    if OS.mac?
      bin.install "rattle.app" => "rattle"
      pkgshare.install "App.framework/Resources/flutter_assets/assets/r/packages.R" => "packages.R"
    elsif OS.linux?
      # Install everything in libexec
      libexec.install "rattle"
      libexec.install Dir["lib"]
      libexec.install Dir["data"]

      # Create a wrapper script in bin/
      (bin/"rattle").write <<~EOS
            #!/bin/bash
            exec "#{libexec}/rattle" "$@"
      EOS
      chmod 0755, bin/"rattle"

      # Install the R script.
      pkgshare.install "data/flutter_assets/assets/r/packages.R" => "packages.R"

      #bin.install "rattle"
      #pkgshare.install "data/flutter_assets/assets/r/packages.R" => "packages.R"
    end
  end

  def caveats
    <<~EOS
      To use rattle, R is required, together with a suite of R packages.

      The R packages can be installed through Rattle's Download button
      amongst the top right icons.

      You can also install them all by running:
        Rscript #{opt_pkgshare}/packages.R
    EOS
  end

  test do
    system "#{bin}/rattle"
  end
end
