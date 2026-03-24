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

      # Bluetooth
      hardware.bluetooth.enable = true;
      hardware.bluetooth.powerOnBoot = true;

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
        xwayland-satellite
      ];
    })
  ];

  config.marty.features.niri.homeModules = [
    inputs.noctalia.homeModules.default
    ({ ... }: {
      programs.noctalia-shell.enable = true;

      xdg.configFile."niri/config.kdl".source = ./niri-config.kdl;
    })
  ];
}
