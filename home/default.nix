{ pkgs
, ...
}: {
  imports = [
    ./helix.nix
  ];
  home.username = "marty";
  home.homeDirectory = "/home/marty";

  programs.alacritty = {
    enable = true;
    settings = {
      terminal.shell = pkgs.lib.getExe pkgs.nushell;
      selection.save_to_clipboard = true;
      window = {
        startup_mode = "Maximized";
        decorations = "None";
      };
    };
  };

  programs.nushell = {
    enable = true;
  };

  programs.starship = {
    enable = true;
  };

  # Packages that should be installed to the user profile.
  # home.packages = with pkgs; [];
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
