# /etc/nixos/hardware/nvidia.nix
{ config, pkgs, lib, ... }:

{
  # --- Общая графическая подсистема ---
  # Включает базовую поддержку графики (OpenGL/Vulkan через Mesa).
  # Используем правильный синтаксис, который должен работать в 24.11
  hardware.graphics.enable = true;

  # --- Настройки драйвера NVIDIA ---
  hardware.nvidia = {
    modesetting.enable = true; # Для Wayland
    open = true;               # Открытый модуль
    powerManagement.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable; # Используем стабильный драйвер
  };

  # Указание X-серверу использовать драйвер NVIDIA (для Xwayland/X11).
  services.xserver.videoDrivers = [ "nvidia" ];

  # Параметр ядра для включения DRM KMS для NVIDIA (для Wayland).
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];
}
