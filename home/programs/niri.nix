{ lib, config, ... }:
{
  options.myModules.niri.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable Niri window manager config";
  };

  config = lib.mkIf config.myModules.niri.enable {
    programs.niri.enable = true;
    xdg.configFile."niri/config.kdl".source = ./../niri/config.kdl;
  };
}

