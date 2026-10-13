cask "rfm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.2"
  sha256 arm:   "f068839cb2e9f66b2d49d3d005362b796597528e75ce5a28c5104d275f364f31",
         intel: "308d457357447574ed7efa55f877ffebb91f66e0d42c938504e47eb18168c3e9"

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
