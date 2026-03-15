{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions =
        with vscode-extensions;
        [
          # Language Support
          jnoortheen.nix-ide
          rust-lang.rust-analyzer
          tamasfe.even-better-toml
          golang.go
          esbenp.prettier-vscode
          bradlc.vscode-tailwindcss
          dbaeumer.vscode-eslint

          # Utilities
          eamodio.gitlens
          usernamehw.errorlens

          # Themes/Icons
          pkief.material-icon-theme
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "claude-dev";
            publisher = "saoudrizwan";
            version = "3.2.10";
            sha256 = "sha256-R8w3zE0sS/WdO4mEX+N0sA9uXjEaO7N8/G1/5I2q5v0=";
          }
          {
            name = "snowflake-vsc";
            publisher = "snowflake";
            version = "1.22.1";
            sha256 = "1qxv50j3i7ygqnd343pxxci82zzkxz29jhg9pravgjgcxljb0bsy";
          }
        ];
    })
  ];
}
