{ lib, ... }:
{
  programs.pear-dekstop = {
    enable = lib.mkDefault true;
  };
}
