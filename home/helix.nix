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
        cursor-shape = {
          normal = "bar";
          insert = "underline";
          select = "block";
        };
        end-of-line-diagnostics = "hint";
        inline-diagnostics = {
          cursor-line = "warning";
          other-lines = "error";
        };
      };
      keys.normal = {
        ret = ":write";
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
