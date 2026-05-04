{ inputs, ... }:
let
  system = "x86_64-linux";
in
{
  config.marty.nixosModules = [
    ({ pkgs, ... }: {
      environment.variables.EDITOR = "nvim";
      environment.variables.VISUAL = "nvim";
      environment.variables.TERMINAL = "alacritty";

      environment.systemPackages = [
        pkgs.zellij
        pkgs.python315
        pkgs.tmux
        pkgs.devenv
        inputs.claude-code-nix.packages.${system}.default
        pkgs.snowsql
        pkgs.gh
        (pkgs.callPackage ../../pkgs/pipedream-cli {})
      ];
    })
  ];
}
