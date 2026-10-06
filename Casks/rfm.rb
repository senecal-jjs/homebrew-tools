cask "rfm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.0"
  sha256 arm:   "03ef024eda0bde35ee44a33be1fb6c73e6a90962242d6b0196262cfc755d19fe",
         intel: "8470d8a61f61a58f17615105b56f94b62cdb8a816017c84f80988bfae0f5874f"

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
