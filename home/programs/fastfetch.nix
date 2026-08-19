{ lib, ... }
{
  programs.fastfetch = {
    enable = lib.mkDefault true;
  };
}
