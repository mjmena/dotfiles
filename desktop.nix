{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    ./modules/firefox.nix
    ./modules/nvim.nix
  ];

  environment.systemPackages = [
    pkgs.vesktop
    pkgs.libreoffice-fresh
    pkgs.spotify
    inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (
    with pkgs;
    [
      gnome-photos
      gnome-maps
      gnome-weather
      gnome-tour
      cheese
      gnome-music
      epiphany # web browser
      geary # email reader
      gnome-characters
      tali # poker game
      iagno # go game
      hitori # sudoku game
      yelp # Help view
      gnome-contacts
      gnome-initial-setup
    ]
  );

  programs.dconf = {
    enable = true;

    profiles.user.databases = [
      {
        settings = with lib.gvariant; {
          "org/gnome/shell" = {
            favorite-apps = [
              "firefox.desktop"
              "Alacritty.desktop"
              "org.gnome.Nautilus.desktop"
            ];
          };
          "org/gnome/desktop/wm/preferences" = {
            button-layout = ":minimize,maximize,close";
            num-workspaces = mkInt32 1;
          };
          "org/gnome/desktop/wm/keybindings" = {
            switch-applications = mkEmptyArray type.string;
            switch-applications-backward = mkEmptyArray type.string;
            switch-windows = [
              "<Super>Tab"
              "<Alt>Tab"
            ];
            switch-windows-backward = [
              "<Shift><Super>Tab"
              "<Shift><Alt>Tab"
            ];
          };
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
            enable-hot-corners = false;
          };
          "org/gnome/settings-daemon/plugins/media-keys" = {
            custom-keybindings = [
              "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
            ];
          };
          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
            name = "alacritty";
            command = "alacritty";
            binding = "<Super>T";
          };
        };
      }
    ];
  };
}
