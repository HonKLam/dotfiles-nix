{ lib, pkgs, config, ... }:
{
  options.myModules.signal.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Install Signal";
  };

  config = lib.mkIf config.myModules.signal.enable {
    home.packages = [ pkgs.signal-desktop ];
  };
}

