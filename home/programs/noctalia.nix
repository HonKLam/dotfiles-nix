{ lib, ... }:
{
  programs.noctalia = {
    enable = lib.mkDefault true;
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
}
