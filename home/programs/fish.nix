{ lib, ... }:
{
  programs.fish = {
    enable = lib.mkDefault true;
    interactiveShellInit = ''
      set fish_greeting "Welcome back, Lamo!"
    '';
    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
      ngc = "sudo nix-collect-garbage -d && nix store optimise";
      nrt = "sudo nixos-rebuild test";
    };
  };
}
