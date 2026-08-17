{ lib, ... }:
{
  programs.kitty = {
    enable = lib.mkDefault true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      shell = "fish";
    };
    extraConfig = builtins.readFile ./../kitty/kitty.conf;
  };
}
