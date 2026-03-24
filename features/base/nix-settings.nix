{ ... }:
{
  config.marty.nixosModules = [
    ({ ... }: {
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      nix.settings.trusted-users = [
        "root"
        "marty"
      ];

      nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };

      nix.settings.auto-optimise-store = true;
      nix.settings.download-buffer-size = 268435456; # 256MB

      nixpkgs.config.allowUnfree = true;
    })
  ];
}
