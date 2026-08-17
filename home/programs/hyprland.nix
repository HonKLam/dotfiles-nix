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
    xdg.configFile."hypr/hyprland.lua".source = ./../hypr/hyprland.lua;
  };
}
