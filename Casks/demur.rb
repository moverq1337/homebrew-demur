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

  # Приложение подписано ad-hoc: Apple Developer Program проект сознательно
  # не покупает. Без снятия карантина Gatekeeper показал бы «не удалось
  # проверить разработчика» и не дал запустить.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "/Applications/Demur.app"]
  end

  caveats <<~CAVEATS
    Туннель поднимает служба demurd, ей нужен root. Запустите её один раз:

      sudo brew services start moverq1337/demur/demur

    Затем откройте Demur — ключ доступа вводится в самом приложении.
  CAVEATS
end
