{ ... }:
{
  config.marty.features.cosmic.nixosModules = [
    ({ ... }: {
      environment.sessionVariables = {
        COSMIC_DISABLE_DIRECT_SCANOUT = "1";
        NIXOS_OZONE_WL = "1";
        MOZ_ENABLE_WAYLAND = "1";
      };

      services.displayManager.cosmic-greeter.enable = true;
      services.desktopManager.cosmic.enable = true;
      services.system76-scheduler.enable = true;
    })
  ];
}
