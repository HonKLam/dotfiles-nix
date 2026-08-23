{ config, lib, ... }:
{
  programs.noctalia = {
    enable = lib.mkDefault true;
    settings = {
      theme = {
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "m3-content";
        templates = {
          enable_builtin_templates = true;
          builtin_ids = [ "qt" "kcolorscheme" "gtk3" "gtk4" "hyprland" "kitty" "niri"];
	  community_ids = [ "pear-desktop" "pywalfox-beta4" "discord" "lazygit" ];
        };
      };

      wallpaper = {
        enabled = true;
        transition = [ "honeycomb" ];
        transition_on_startup = true;
	automation.enabled = true;
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

      backdrop = {
        enabled = true;
      };

      nightlight = {
        enabled = true;
      };

    };
  };
}
