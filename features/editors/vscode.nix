{ ... }:
{
  config.marty.features.vscode.nixosModules = [
    ({ pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        (vscode-with-extensions.override {
          vscodeExtensions = with vscode-extensions; [
            jnoortheen.nix-ide
            ms-python.python
            ms-python.debugpy
            ms-toolsai.jupyter
            anthropic.claude-code
          ];
        })
      ];
    })
  ];
}
