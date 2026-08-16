{ lib, pkgs, config, ... }:
{
  # Ensure Wallpapers Directory exists
  home.file."Pictures/Wallpapers/.keep".text = "";

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
  };

  xdg.configFile."hypr/hyprland.lua".source =
    ./hypr/hyprland.lua;

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
    settings = {
      theme = {
        mode = "dark";
	source = "wallpaper";
	builtin = "Catppuccin";
	wallpaper_scheme = "m3-content";
      };

      wallpaper = {
        enabled = true;
	transition = [ "honeycomb" ];
	transition_on_startup = true;
      };

      shell = {
        font_family = "Noto Sans";
      };

      osd.kinds = {
        media = false;
      };

      widget.tray = {
        drawer = true;
      };
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting "Welcome back, Lamo!"
    '';
    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
      ngc = "sudo nix-collect-garbage -d && nix store optimise";
      nrt = "sudo nixos-rebuild test";
    };
  };

  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      shell = "fish";
    };
    extraConfig = builtins.readFile ./kitty/kitty.conf;
  };

  programs.vesktop = {
    enable = true;
  };
}
