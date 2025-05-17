# /etc/nixos/system/security.nix
{ config, pkgs, ... }:

{
  security.polkit.enable = true;

  # Опция security.polkit.extraConfig
  security.polkit.extraConfig = ''
    /* Правило 1: Разрешить перезагрузку, выключение, режим сна для группы wheel без пароля */
    polkit.addRule(function(action, subject) {
        if ((action.id == "org.freedesktop.login1.reboot" ||
             action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
             action.id == "org.freedesktop.login1.power-off" ||
             action.id == "org.freedesktop.login1.power-off-multiple-sessions" ||
             action.id == "org.freedesktop.login1.suspend" ||
             action.id == "org.freedesktop.login1.suspend-multiple-sessions" ||
             action.id == "org.freedesktop.login1.hibernate" ||
             action.id == "org.freedesktop.login1.hibernate-multiple-sessions") &&
            subject.isInGroup("wheel")) {
            return polkit.Result.YES;
        }
    });

    /* Правило 2: Разрешить монтирование и размонтирование системных устройств для группы wheel без пароля */
    polkit.addRule(function(action, subject) {
        if ((action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
             action.id == "org.freedesktop.udisks2.filesystem-unmount-others") &&
            subject.isInGroup("wheel")) {
            return polkit.Result.YES;
        }
    });

    /* Правило 3: Разрешить изменение часового пояса для группы wheel без пароля */
    polkit.addRule(function(action, subject) {
        if (action.id == "org.freedesktop.timedate1.set-timezone" &&
            subject.isInGroup("wheel")) {
            return polkit.Result.YES;
        }
    });

    /* Правило 4: Разрешить управление NetworkManager для группы wheel без пароля */
    polkit.addRule(function(action, subject) {
        if (action.id.indexOf("org.freedesktop.NetworkManager.") == 0 && subject.isInGroup("wheel")) {
            return polkit.Result.YES;
        }
    });

    // Добавь другие правила по необходимости
  '';

  # ... другие настройки безопасности ...
}
