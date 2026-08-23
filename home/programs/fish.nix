{ lib, ... }:
{
  programs.fish = {
    enable = lib.mkDefault true;
    interactiveShellInit = ''
      set fish_greeting ""
      fastfetch
    '';
    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
      ngc = "sudo nix-collect-garbage -d && nix store optimise";
      nrt = "sudo nixos-rebuild test";
      lg = "lazygit";
    };
  };
}
