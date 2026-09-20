class Demur < Formula
  desc "Демон и CLI личного VPN Demur"
  homepage "https://github.com/moverq1337/demur"
  version "0.2.0"
  license "MIT"

  # url и sha256 внутри on_arm/on_intel brew style не принимает
  # (FormulaAudit/ComponentsOrder), поэтому выбор архитектуры обычным if.
  if Hardware::CPU.arm?
    url "https://demur.moverq.dev/dl/demurd-darwin-arm64"
    sha256 "2235711fbbee562abe174925072d5dd2f011081f53b99a38b5473b3dc9e97b9e"
  else
    url "https://demur.moverq.dev/dl/demurd-darwin-amd64"
    sha256 "b1383640244c28b00adfded598f3063e306b627e978d2bdba5d34cdd19fe5ab2"
  end

  depends_on :macos
  depends_on "sing-box"

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
    assert_path_exists bin/"demurd"
    system bin/"demurd", "version"
  end
end
