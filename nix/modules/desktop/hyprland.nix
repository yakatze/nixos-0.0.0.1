# /etc/nixos/desktop/hyprland.nix
# Системные настройки для Hyprland (сессия и порталы)
{ config, pkgs, lib, ... }:

{
  # Добавление сессии Hyprland в менеджер входа (GDM)
  services.xserver.displayManager.sessionPackages = [ pkgs.hyprland ];

  # Порталы рабочего стола (XDG Desktop Portals)
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal          # Ядро
    xdg-desktop-portal-gtk      # Бэкенд GTK

    # Рекомендуемый портал для Hyprland (скорее всего доступен в 24.11)
    xdg-desktop-portal-hyprland

    # Запасной вариант (закомментирован)
    # xdg-desktop-portal-wlr

    # Бэкенд KDE/Qt (раскомментируй, если используешь много Qt-приложений)
    # xdg-desktop-portal-kde
  ];

  # ПРИМЕЧАНИЕ: Правила Polkit теперь настраиваются в /etc/nixos/system/security.nix
}
