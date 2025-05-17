{
  pkgs,
  config,
  lib,
  ...
}:

{
  imports = [
    ./nadia.nix
    #./vaapi.nix
    #./prime.nix
    #./wlroots.nix
  ];

}
