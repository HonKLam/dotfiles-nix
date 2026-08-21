{ config, lib, pkgs, ... }:

let
  # Where index.html and the generated colors.css live together.
  bonfireDir = "${config.home.homeDirectory}/repos/bonfire";

  # Loopback only — nothing on the LAN should be able to reach this.
  host = "127.0.0.1";
  port = 8420;
in
{
  ###########################################################################
  # 1. The palette template Noctalia renders on every theme change
  ###########################################################################
  xdg.configFile."noctalia/templates/bonfire.css".text = ''
    :root {
      --m-surface:            {{colors.surface.default.hex}};
      --m-surface-variant:    {{colors.surface_variant.default.hex}};
      --m-on-surface:         {{colors.on_surface.default.hex}};
      --m-on-surface-variant: {{colors.on_surface_variant.default.hex}};
      --m-primary:            {{colors.primary.default.hex}};
      --m-secondary:          {{colors.secondary.default.hex}};
      --m-tertiary:           {{colors.tertiary.default.hex}};
      --m-outline:            {{colors.outline.default.hex}};
    }
  '';

  programs.noctalia.settings.theme.templates.user.bonfire = {
    input_path  = "${config.xdg.configHome}/noctalia/templates/bonfire.css";
    output_path = "${bonfireDir}/colors.css";
  };

  ###########################################################################
  # 2. The static server that makes the page reachable over http
  #
  # Firefox forbids extensions from loading file:// URLs, so a new-tab
  # override can only point at http(s). This serves the same directory
  # Noctalia writes into.
  ###########################################################################
  systemd.user.services.bonfire = {
    Unit = {
      Description = "Bonfire start page (static file server)";
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = ''
        ${pkgs.python3}/bin/python3 -m http.server ${toString port} \
          --bind ${host} \
          --directory ${bonfireDir}
      '';
      Restart = "on-failure";
      RestartSec = 3;

      # It only ever reads one directory of static files.
      PrivateTmp = true;
      NoNewPrivileges = true;
      ProtectSystem = "strict";
      ProtectHome = "read-only";
      RestrictAddressFamilies = [ "AF_INET" ];
    };

    Install.WantedBy = [ "default.target" ];
  };
}
