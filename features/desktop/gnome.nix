{ ... }:
{
  config.marty.features.gnome.nixosModules = [
    ({ pkgs, lib, ... }: {
      services.xserver.enable = true;
      services.displayManager.gdm.enable = true;
      services.desktopManager.gnome.enable = true;

      xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
        config.gnome.default = "*";
      };

      environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
      };

      environment.systemPackages = [
        pkgs.vlc
        pkgs.gradia
        pkgs.pwvucontrol
        pkgs.wl-clipboard
        pkgs.gnome-screenshot
      ];

      environment.gnome.excludePackages = (
        with pkgs;
        [
          gnome-photos
          gnome-maps
          gnome-weather
          gnome-tour
          cheese
          gnome-music
          epiphany
          geary
          gnome-characters
          tali
          iagno
          hitori
          yelp
          gnome-contacts
          gnome-initial-setup
          baobab
          evince
          file-roller
          gnome-calculator
          gnome-calendar
          gnome-clocks
          gnome-connections
          gnome-disk-utility
          gnome-font-viewer
          gnome-logs
          gnome-software
          gnome-system-monitor
          gnome-text-editor
          eog
          loupe
          snapshot
          simple-scan
          totem
          seahorse
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
              "org/gnome/shell/keybindings" = {
                toggle-quick-settings = mkEmptyArray type.string;
              };
              "org/gnome/mutter/keybindings" = {
                switch-monitor = mkEmptyArray type.string;
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
              };
              "org/gnome/settings-daemon/plugins/media-keys" = {
                custom-keybindings = [
                  "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
                  "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
                  "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
                ];
              };
              "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
                name = "alacritty";
                command = "alacritty";
                binding = "<Super>T";
              };
              "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
                name = "Instant Area Screenshot";
                command = "gnome-screenshot -a -c";
                binding = "<Super>s";
              };
            };
          }
        ];
      };
    })
  ];
}
