cask "demur" do
  version "0.1.0"
  sha256 "016f668a694f960060c781bb0374654a6ee096a05f247f753c021d83e9625fd9"

  url "https://cp.moverq.dev/dl/Demur.zip"
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
