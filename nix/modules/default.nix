{
  imports = [
    ./base.nix
    ./security.nix

    ./app/hyprland.nix
    ./app/shell.nix
    #./app/sound.nix

    ./desktop/common.nix
    #/desktop/gnome.nix
    ./desktop/hyprland.nix

    ./nvidia/default.nix
  ];
}
