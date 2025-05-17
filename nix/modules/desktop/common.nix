# /etc/nixos/desktop/common.nix
{ config, pkgs, lib, ... }:

{
  # Графический сервер и менеджер входа
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  # Раскладка клавиатуры (для GDM/X11)
  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:alt_shift_toggle";
  };

  # Основные системные пакеты для графики
  environment.systemPackages = with pkgs; [
    # Базовые утилиты CLI
    git wget curl unzip p7zip ripgrep fd bat eza file zsh

    # XWayland для совместимости
    xwayland

    # Шрифты
    noto-fonts noto-fonts-cjk-sans noto-fonts-emoji liberation_ttf
  ];
}
