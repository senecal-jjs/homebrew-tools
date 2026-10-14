cask "rfm" do
  version "0.8.0"
  sha256 "485a37bfb7ecfab9ba75e647b3660302a36e0e9e13fd54e369f57d689e16d79e"

  url "https://github.com/senecal-jjs/rust-file-mirror/releases/download/v#{version}/rfm-v#{version}-aarch64-apple-darwin.tar.gz"
  name "rfm"
  desc "Encrypted, client-side S3 file mirror CLI and daemon"
  homepage "https://github.com/senecal-jjs/rust-file-mirror"

  depends_on arch: :arm64

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
