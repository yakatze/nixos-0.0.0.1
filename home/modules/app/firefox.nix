# ~/.config/home-manager/programs/firefox.nix
{ config, pkgs, lib, ... }:

{
  programs.firefox = {
    enable = true;
    # Здесь можно настроить профили, дополнения и т.д.
    # profiles.default = { ... };
  };
}