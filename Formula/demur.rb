class Demur < Formula
  desc "Демон и CLI личного VPN Demur"
  homepage "https://github.com/moverq1337/demur"
  version "0.1.0"
  license "MIT"

  depends_on "sing-box"
  depends_on :macos

  on_arm do
    url "https://cp.moverq.dev/dl/demurd-darwin-arm64"
    sha256 "69b4b930b917e40707495ac499184148801942af5a8c86f32bbf748a3e4ef0a0"
  end
  on_intel do
    url "https://cp.moverq.dev/dl/demurd-darwin-amd64"
    sha256 "0c32b99d9e7c06fb57f90c9e80fae645537ca511cea8493c145e4f13fd70be48"
  end

  def install
    bin.install Dir["demurd-darwin-*"].first => "demurd"
  end

  # Runs the tunnel daemon as a background service. It needs root to create the
  # tunnel interface, so start it with: sudo brew services start demur
  service do
    run [opt_bin/"demurd", "run", "-sing-box", HOMEBREW_PREFIX/"bin/sing-box"]
    keep_alive true
    require_root true
    log_path var/"log/demurd.log"
    error_log_path var/"log/demurd.log"
  end

  test do
    # The daemon prints its version and exits cleanly.
    assert_predicate bin/"demurd", :exist?
    system bin/"demurd", "version"
  end
end
