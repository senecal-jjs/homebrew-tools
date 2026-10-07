cask "rfm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.0"
  sha256 arm:   "d7235b5602a9ea947939ebdfe2e0b306d123009a8b3dacc47decfacd8a510bdf",
         intel: "23f805194fc112cdd1f7055ddb42af025c070777fc26a1b96d83b8e8ea3caa70"

  url "https://github.com/senecal-jjs/rust-file-mirror/releases/download/v#{version}/rfm-v#{version}-#{arch}-apple-darwin.tar.gz"
  name "rfm"
  desc "Encrypted, client-side S3 file mirror CLI and daemon"
  homepage "https://github.com/senecal-jjs/rust-file-mirror"

  binary "rfm"

  # Clear the Gatekeeper quarantine flag so the ad-hoc-signed binary runs.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/rfm"],
                   sudo: false
  end
end
