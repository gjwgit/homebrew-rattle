cask "rattle" do
  version "6.5.2"
  sha256 "d7684f161b2ec60ffb10052b536f4fee9756a4e9b075f5cb4cbd52bbc97839af"

  url "https://access.togaware.com/rattle-dev-macos.zip"
  name "Rattle"
  desc "A Flutter based app for the Data Scientist using R"
  homepage "https://github.com/gjwgit/rattle"

  app "rattle.app"

  # Optional: symlink CLI binary if there is one inside your app

  binary "#{appdir}/rattle.app/Contents/MacOS/rattle", target: "rattle"

  # Optional: add dependencies as caveats if needed

  caveats do
    <<~EOS
      R is required for Rattle to work.
      Install it with:

        brew install r

      To use rattle we also need a suite of R packages.

      The R packages can be installed through Rattle's Download button
      amongst the top right icons.

      You can also install them all by running:

        Rscript packages.R
    EOS
  end
end
