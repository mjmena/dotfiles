{ ... }:
{
  config.marty.nixosModules = [
    ({ pkgs, ... }: {
      programs.git = {
        enable = true;
        package = pkgs.gitFull;
        config = {
          user = {
            name = "mjmena";
            email = "martinjxm@gmail.com";
          };
        };
      };
    })
  ];
}
