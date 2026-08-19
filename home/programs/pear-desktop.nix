{ lib, pkgs, config, ... }:
{
  options.myModules.pear-desktop.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Install pear-desktop (YouTube Music Electron client)";
  };

  config = lib.mkIf config.myModules.pear-desktop.enable {
    home.packages = [ pkgs.pear-desktop ];
  };
}
