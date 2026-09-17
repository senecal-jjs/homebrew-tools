cask "rfm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.0"
  sha256 arm:   "98a29e1bbd57213e57e2fac4cb613349ec8b2fa795f7fe2e44a0aecc112383ca",
         intel: "10fd60e2d95c00dc7c8767037a757f142b38f0365eeb8e72bda1e8314039d5ce"

  url "https://github.com/senecal-jjs/rust-file-mirror/releases/download/v#{version}/rfm-v#{version}-#{arch}-apple-darwin.tar.gz"
  name "rfm"
  desc "Encrypted, client-side S3 file mirror CLI and daemon"
  homepage "https://github.com/senecal-jjs/rust-file-mirror"

  binary "rfm"
end
