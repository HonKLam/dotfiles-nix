{ pkgs, ... }:
{
  xdg.configFile."niri/config.kdl".source =
    pkgs.runCommandLocal "niri-config-checked"
      {
        nativeBuildInputs = [ pkgs.niri ];
      }
      ''
        niri validate --config ${../niri}/config.kdl
        cp ${../niri}/config.kdl $out
      '';
}
