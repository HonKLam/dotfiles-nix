# home/programs/hyprland.nix
{ lib, config, ... }:
{
  options.myModules.hyprland.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable Hyprland window manager config";
  };

  config = lib.mkIf config.myModules.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
    };

    wayland.windowManager.hyprland.settings.env = [ "QT_QPA_PLATFORMTHEME,qt6ct" ];

    xdg.configFile."hypr/hyprland.lua".source = ./../hypr/hyprland.lua;
  };
}
