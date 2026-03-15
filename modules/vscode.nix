{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions =
        with vscode-extensions;
        [
          # Language Support
          jnoortheen.nix-ide
          esbenp.prettier-vscode
          dbaeumer.vscode-eslint
          ms-python.python
          ms-python.debugpy
          charliermarsh.ruff
          ms-toolsai.jupyter

          # AI
          anthropic.claude-code

          # Themes/Icons
          pkief.material-icon-theme
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
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
