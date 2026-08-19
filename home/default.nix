{ lib, ... }:
{
  imports =
    [ ./core.nix ]
    ++ (
      let
        dir = ./programs;
      in
      map (f: dir + "/${f}") (
        builtins.filter (f: lib.hasSuffix ".nix" f) (builtins.attrNames (builtins.readDir dir))
      )
    );
}
