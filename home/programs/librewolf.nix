{ lib, pkgs, config, ... }:
{
  # Ensure Wallpapers Directory exists
  home.file."Pictures/Wallpapers/.keep".text = "";

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.kdePackages.breeze;
    name = "breeze_cursors";
    size = 24;
 };

  home = {
    packages = with pkgs; [
      librewolf-bin
      github-cli
      kdePackages.dolphin
      qt6Packages.qt6ct
    ];

    username = "lamo";
    homeDirectory = "/home/lamo";
    stateVersion = "26.05";
  };
}

