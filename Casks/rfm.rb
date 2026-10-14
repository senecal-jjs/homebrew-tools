cask "rfm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.7.0"
  sha256 arm:   "6038743c597bd2b0ec7c63d41285da9235ad8ceed936a27cd7284b3a469c7f7d",
         intel: "320e956c750b1129dd1d59b567dcd6ea76eed023399d9dbfc9862a274b0ee5e6"

  url "https://github.com/senecal-jjs/rust-file-mirror/releases/download/v#{version}/rfm-v#{version}-#{arch}-apple-darwin.tar.gz"
  name "rfm"
  desc "Encrypted, client-side S3 file mirror CLI and daemon"
  homepage "https://github.com/senecal-jjs/rust-file-mirror"

  binary "rfm"
  binary "rfm-tray"

  # Clear the Gatekeeper quarantine flag so the ad-hoc-signed binary runs.
  postflight do
    ["rfm", "rfm-tray"].each do |bin|
      system_command "/usr/bin/xattr",
                     args: ["-dr", "com.apple.quarantine", "#{staged_path}/#{bin}"],
                     sudo: false
    end
  end
end
