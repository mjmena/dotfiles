{ ... }:
{
  config.marty.features.work-apps.nixosModules = [
    (
      { pkgs, ... }:
      {
        environment.systemPackages = [
          pkgs.slack
          pkgs.google-chrome
          pkgs.google-cloud-sdk
        ];
      }
    )
  ];
}
