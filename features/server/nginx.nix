{ ... }:
{
  config.marty.features.nginx.nixosModules = [
    ({ ... }: {
      security.acme = {
        acceptTerms = true;
        defaults.email = "martinjxm@gmail.com";
      };

      networking.firewall.allowedTCPPorts = [
        80
        443
      ];

      services.nginx = {
        enable = true;
        recommendedProxySettings = true;
        recommendedTlsSettings = true;
      };
    })
  ];
}
