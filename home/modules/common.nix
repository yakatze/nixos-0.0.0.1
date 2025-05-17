# ~/.config/home-manager/desktop/common.nix
{ config, pkgs, lib, ... }:

{
  # Переменные окружения
  home.sessionVariables = {
    EDITOR = "kate";
    NIXOS_OZONE_WL = "1"; # Electron/Chromium Wayland
    # __GL_OZONE_PLATFORM = "wayland"; # Альтернатива для Electron
    QT_QPA_PLATFORM = "wayland;xcb"; # Wayland для Qt, с фолбэком на X11
    QT_QPA_PLATFORMTHEME = "qt5ct"; # Если используешь qt5ct
    # SDL_VIDEODRIVER = "wayland"; # Для SDL2 игр/приложений

    # Wayland / Курсор
    XCURSOR_SIZE = "24";
    # HYPRCURSOR_THEME = "capitaine-cursors"; # Установи, если используешь
    HYPRCURSOR_SIZE = "24";

    # NVIDIA
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1"; # Важно!

    # XDG Info
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
  };

}
