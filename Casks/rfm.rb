cask "rfm" do
  version "0.8.1"
  sha256 "b13c41d48db06a01ee919833eaa5844d5c040fc70f9d0372a53f45f042e37514"

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
