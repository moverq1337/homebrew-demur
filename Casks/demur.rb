cask "demur" do
  version "0.2.0"
  sha256 "48bb10cde604c7b588c66e82329d3b1013db6f73ebad1bff177493b596ac5cef"

  url "https://demur.moverq.dev/dl/Demur.dmg"
  name "Demur"
  desc "Личный VPN-клиент для обхода блокировок"
  homepage "https://github.com/moverq1337/demur"

  # The client daemon and sing-box, installed by the formula.
  depends_on formula: "moverq1337/demur/demur"
  depends_on macos: :sequoia

  app "Demur.app"

  caveats <<~CAVEATS
    Клиент готов, но туннель поднимает служба demurd (нужен root).
    Один раз настройте её своей подпиской:

      sudo demurd login https://cp.example.com/sub/ВАШ_ТОКЕН
      sudo brew services start moverq1337/demur/demur

    Затем откройте Demur из Launchpad.
  CAVEATS
end
