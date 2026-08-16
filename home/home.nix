{ lib, pkgs, config, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
  };

  xdg.configFile."hypr/hyprland.conf".source =
    ./hypr/hyprland.conf;

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
    ];

    username = "lamo";
    homeDirectory = "/home/lamo";
    stateVersion = "26.05";
  };

  programs.noctalia = {
    enable = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting "Welcome back, Lamo!"
    '';
  };

  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      shell = "fish";
    };
    extraConfig = builtins.readFile ./kitty/kitty.conf;
  };
}
