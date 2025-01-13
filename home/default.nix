{ inputs
, system
, pkgs
, config
, ...
}: {
  imports = [
    ./helix.nix
  ];
  home.username = "marty";
  home.homeDirectory = "/home/marty";

  home.sessionVariables = {
    SHELL = pkgs.lib.getExe pkgs.nushell;
  };

  home.packages = [
    pkgs.starship
    pkgs.nushell
  ];

  xdg.configFile."nushell/env.nu".source = ./nushell/env.nu;
  xdg.configFile."nushell/config.nu".source = ./nushell/config.nu;

  xdg.configFile.alacritty = {
    source = ./alacritty;
    text = "shell=${pkgs.lib.getExe pkgs.nushell}";
    recursive = true;
  };

  xdg.configFile.starship =
    {
      source = ./starship;
      recursive = true;
    };

  # Packages that should be installed to the user profile.
  # home.packages = with pkgs; [];
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
