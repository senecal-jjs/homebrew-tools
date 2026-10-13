cask "rfm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.1"
  sha256 arm:   "f31eb4ed774e4373c4f005f0c14583aaf73ade2d1721f8f15d449bd389c2bd70",
         intel: "136eee97020d061eea3a8c074c7caef686cc9cab47564c65739d58904fc3d127"

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
