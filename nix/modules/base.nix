# /etc/nixos/system/base.nix
{ config, pkgs, lib, ... }:

{
  # Если ты хочешь, чтобы Nix автоматически создавал и обновлял flake.lock при сборке
  # без явного nix flake update, это может быть удобно, но требует осторожности.
  # nix.settings.flake-update-lock-file = true; # Опционально

  # Загрузчик
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Сеть
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Время и Локализация
  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "ru_RU.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8"; LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8"; LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8"; LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8"; LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Пользователь yakatze (определение)
  users.users.yakatze = {
    isNormalUser = true;
    description = "yakatze";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "input" ];
    shell = pkgs.zsh;
  };

  # programs settings
  programs.zsh.enable = true;

  # Настройки Nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  # nix.gc = { automatic = true; dates = "weekly"; options = "--delete-older-than 7d"; };

}
