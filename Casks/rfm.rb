cask "rfm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.7.1"
  sha256 arm:   "bd714d2c0bf5bc1fe3837f8e22edec39cde82f1040c15ca8122b8594480ea3cb",
         intel: "a5a7a1607cccb14946832d4d0a8799d4a5861c82385e85c6837235102279d466"

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
