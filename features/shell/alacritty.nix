{ ... }:
{
  config.marty.homeModules = [
    ({ pkgs, ... }: {
      programs.alacritty = {
        enable = true;
        settings = {
          terminal.shell = pkgs.lib.getExe pkgs.zsh;
          selection.save_to_clipboard = true;
          window = {
            startup_mode = "Maximized";
            decorations = "None";
          };
          font = {
            normal = {
              family = "JetBrainsMono NF";
              style = "Regular";
            };
            size = 11;
          };
        };
      };
    })
  ];
}
