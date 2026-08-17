{ ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      shell = "fish";
    };
    extraConfig = builtins.readFile ./../kitty/kitty.conf;
  };
}
