{ ... }:
{
  config.marty.features.vpn.nixosModules = [
    ({ pkgs, ... }: {
      environment.systemPackages = [ pkgs.openfortivpn ];
      programs.zsh.shellAliases = {
        vpn-mcclatchy = "tmux new-session -d -s vpn-mcclatchy 'sudo openfortivpn vpn.mcclatchy.com:443 --saml-login'";
      };
    })
  ];
}
