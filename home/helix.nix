{ pkgs, ... }:
{
  home.packages = with pkgs;[
    nil
    nixpkgs-fmt
  ];

  programs.helix = {
    enable = true;
    settings = {
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        lsp.display-inlay-hints = true;
      };
    };
    languages = {
      language-server.rust-analyzer.config.check = {
        command = "clippy";
      };

      language = [{
        name = "nix";
        formatter = { command = "nixpkgs-fmt"; };
        auto-format = true;
      }];
    };
  };
}
