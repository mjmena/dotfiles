{ inputs, ... }:
{
  config.marty.features.niri.nixosModules = [
    inputs.noctalia.nixosModules.default
    ({ pkgs, ... }: {
      # Wayland environment
      environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        MOZ_ENABLE_WAYLAND = "1";
      };

      # Login manager — greetd + tuigreet
      services.greetd = {
        enable = true;
        settings = {
          default_session = {
            command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd niri-session";
            user = "greeter";
          };
        };
      };

      # Niri compositor
      programs.niri.enable = true;

      # Noctalia desktop shell
      services.noctalia-shell.enable = true;

      # XDG portals
      xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      };

      # Supporting packages
      environment.systemPackages = with pkgs; [
        wl-clipboard
        grim
        slurp
        brightnessctl
        pwvucontrol
        vlc
        nautilus
        xdg-utils
      ];
    })
  ];

  config.marty.features.niri.homeModules = [
    inputs.noctalia.homeModules.default
    ({ ... }: {
      programs.noctalia-shell.enable = true;

      xdg.configFile."niri/config.kdl".text = ''
        input {
            keyboard {
                xkb { }
            }
            touchpad {
                tap
                natural-scroll
            }
        }

        layout {
            gaps 8
            default-column-width { proportion 0.5; }

            focus-ring {
                width 2
                active-color "#7fc8ff"
                inactive-color "#505050"
            }
        }

        binds {
            Mod+Return { spawn "alacritty"; }
            Mod+Q { close-window; }

            // Vim-style navigation
            Mod+H { focus-column-left; }
            Mod+L { focus-column-right; }
            Mod+J { focus-window-down; }
            Mod+K { focus-window-up; }
            Mod+Shift+H { move-column-left; }
            Mod+Shift+L { move-column-right; }
            Mod+Shift+J { move-window-down; }
            Mod+Shift+K { move-window-up; }

            // Arrow key navigation
            Mod+Left { focus-column-left; }
            Mod+Right { focus-column-right; }
            Mod+Down { focus-window-down; }
            Mod+Up { focus-window-up; }
            Mod+Shift+Left { move-column-left; }
            Mod+Shift+Right { move-column-right; }
            Mod+Shift+Down { move-window-down; }
            Mod+Shift+Up { move-window-up; }

            // Workspaces
            Mod+1 { focus-workspace 1; }
            Mod+2 { focus-workspace 2; }
            Mod+3 { focus-workspace 3; }
            Mod+4 { focus-workspace 4; }
            Mod+Shift+1 { move-column-to-workspace 1; }
            Mod+Shift+2 { move-column-to-workspace 2; }
            Mod+Shift+3 { move-column-to-workspace 3; }
            Mod+Shift+4 { move-column-to-workspace 4; }

            // Layout
            Mod+F { maximize-column; }
            Mod+Shift+F { fullscreen-window; }
            Mod+Minus { set-column-width "-10%"; }
            Mod+Equal { set-column-width "+10%"; }

            // System
            Print { screenshot; }
            Mod+Shift+E { quit; }
            Mod+Shift+Slash { show-hotkey-overlay; }
        }
      '';
    })
  ];
}
