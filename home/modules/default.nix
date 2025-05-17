{
  imports = [
    ./packages.nix
    ./common.nix
    #./user.nix

    ./app/firefox.nix 
    ./app/ghostty.nix
    #./app/vscodium.nix
    ./app/rofi.nix
    ./app/yazi.nix
    ./app/nemo.nix
    ./app/shell.nix
    #./app/alacritty.nix
    #./app/cursor.nix
    ./app/git.nix

    ./wms/hyprland.nix
    ./wms/waybar.nix
  ];
}
