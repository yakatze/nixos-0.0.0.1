# /etc/nixos/desktop/gnome.nix
{ config, pkgs, lib, ... }:

{
  # Включение GNOME (если нужно как запасной вариант)
  services.xserver.desktopManager.gnome.enable = true;

  # Автологин (если нужен и используется GNOME)
  # services.displayManager.autoLogin = { enable = true; user = "yakatze"; };
  # systemd.services."getty@tty1".enable = false;
  # systemd.services."autovt@tty1".enable = false;

}
