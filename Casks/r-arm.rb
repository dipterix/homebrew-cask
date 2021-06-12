cask "r-arm" do
  version "4.1.0"
  sha256 "0de3f60670d51f0e9721aecc5f01c0542b8a25b51cb2b537566b8451afb94452"

  url "https://cran.r-project.org/bin/macosx/big-sur-arm64/base/R-#{version}-arm64.pkg"
  name "R"
  desc "Environment for statistical computing and graphics"
  homepage "https://www.r-project.org/"

  livecheck do
    url "https://cloud.r-project.org/bin/macosx/"
    strategy :page_match
    regex(/href=.*?R-(\d+(?:\.\d+)*)-arm64\.pkg/i)
  end
  
  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64
  
  pkg "R-#{version}-arm64.pkg"

  uninstall pkgutil: [
    "org.r-project*",
    "org.R-project*",
  ],
  delete:  [
    "/Library/Frameworks/R.Framework",
    "/usr/bin/R",
    "/usr/bin/Rscript",
  ]

  zap trash: [
    "~/.R",
    "~/.Rapp.history",
    "~/.RData",
    "~/.Rhistory",
    "~/.Rprofile",
    "~/Library/R",
    "~/Library/Caches/org.R-project.R",
  ]
  
  caveats do
    files_in_usr_local
  end
end
