cask "rfm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.4.3"
  sha256 arm:   "95e35ea86a30302fce2fa5e03342bf4020c713e886f11c02af44ce904a6afeff",
         intel: "298ba1194b73185ce3366d95d6237d9fe9ede186398b0673dceb5dc7e97509ca"

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
