cask "demur" do
  version "0.1.0"
  sha256 "2643566067348da0ccd2853a66b27ed7ac38b376abc2663b17fca5e2f0dface4"

  url "https://demur.moverq.dev/dl/Demur.dmg"
  name "Demur"
  desc "Личный VPN-клиент для обхода блокировок"
  homepage "https://github.com/moverq1337/demur"

  # The client daemon and sing-box, installed by the formula.
  depends_on formula: "moverq1337/demur/demur"

  app "Demur.app"

  caveats <<~CAVEATS
    Клиент готов, но туннель поднимает служба demurd (нужен root).
    Один раз настройте её своей подпиской:

      sudo demurd login https://cp.example.com/sub/ВАШ_ТОКЕН
      sudo brew services start moverq1337/demur/demur

    Затем откройте Demur из Launchpad.
  CAVEATS
end
