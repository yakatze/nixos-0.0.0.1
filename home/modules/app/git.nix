# ~/.config/home-manager/programs/git.nix
{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    userName = "yakatze"; # <-- ЗАМЕНИ!
    userEmail = "poseidonky4821@gmail.com"; # <-- ЗАМЕНИ!
    extraConfig = { init.defaultBranch = "main"; };
  };
}
