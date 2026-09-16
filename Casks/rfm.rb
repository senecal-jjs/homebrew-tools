cask "rfm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.0"
  sha256 arm:   "a7bd1fb48a9677aca983c59205c6c2bc45d7a7e3f7a67207629950b772fb9e29",
         intel: "306ec28b436cc26a59be301aaa5914d4a4d4c714a20b77470e6444b7d7f3002c"

  url "https://github.com/senecal-jjs/rust-file-mirror/releases/download/v#{version}/rfm-v#{version}-#{arch}-apple-darwin.tar.gz"
  name "rfm"
  desc "Encrypted, client-side S3 file mirror CLI and daemon"
  homepage "https://github.com/senecal-jjs/rust-file-mirror"

  binary "rfm"
end
