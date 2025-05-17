# ~/.config/home-manager/programs/shell.nix
{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # enableAutosuggestions = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      rb = "sudo nixos-rebuild switch --flake";
      upd = "nix flake update";
      upg = "sudo nixos-rebuild switch --upgrade --flake";

      hms = "home-manager switch --flake";
      shms = "sudo home-manager switch --flake";

      ll = "ls -l";
      v = "nvim";
      se = "sudoedit";
      ff = "fastfetch";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "agnoster"; # blinks is also really nice
    };
  };
}
