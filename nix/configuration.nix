{ inputs, ...}: {
  imports = 
  [
    # Сгенерированный файл с дисками/файловыми системами
    ./hardware-configuration.nix

    # Системные модули
    ./modules/default.nix
  ];

  system.stateVersion = "24.11"; # Don't change it bro
}
