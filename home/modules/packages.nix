# ~/.config/home-manager/programs/packages.nix
{ config, pkgs, lib, ... }:

{
programs.home-manager.enable = true;

  # Основной список пакетов пользователя
  home.packages = with pkgs; [

# --- Месенджеры ---
    telegram-desktop

# ---- Основные компоненты окружения ----

    grim
    wl-clipboard
    cliphist
    vscodium

    # --- Мониторинг системы ---
    btop

    # --- Управление сетью (апплет) ---
    networkmanagerapplet # Апплет для NetworkManager (уже есть в твоем конфиге, убедись)

    # --- Утилиты ---
    mc
    neofetch
    pavucontrol # GUI для звука
    brightnessctl # Яркость
    jq # Для JSON
    polkit_gnome # Агент Polkit

    # Шрифты и иконки
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) # Nerd Font
    noto-fonts-emoji # Эмодзи
    papirus-icon-theme # Иконки

  ];
   
}

