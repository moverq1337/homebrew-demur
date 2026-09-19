class Demur < Formula
  desc "Демон и CLI личного VPN Demur"
  homepage "https://github.com/moverq1337/demur"
  version "0.1.0"
  license "MIT"

  depends_on "sing-box"
  depends_on :macos

  on_arm do
    url "https://cp.moverq.dev/dl/demurd-darwin-arm64"
    sha256 "1dfdfbe51e3d325ff2a5c3494064f1bb0bb6741185965801af2a0566db4485ed"
  end
  on_intel do
    url "https://cp.moverq.dev/dl/demurd-darwin-amd64"
    sha256 "6ab50df0a6fc4cbc653502896029626339f5347ef7e0f1a513ba775bfefe11f4"
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
