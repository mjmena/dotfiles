{
  pkgs,
  lib,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${lib.getBin pkgs.greetd.tuigreet} --cmd hyprland";
        user = "marty";
      };
      initial_session = {
        user = "marty";
        command = "hyprland";
      };
    };
  };

  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "journal";
    StandardOutput = "journal";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
  programs.hyprland.enable = true;
  # xdg.portal.enable = true;

  environment.systemPackages = [
    pkgs.waybar
    pkgs.mako
    pkgs.libnotify
    pkgs.swww
    pkgs.kitty
    pkgs.rofi-wayland
    pkgs.wlogout
    pkgs.pavucontrol
    pkgs.spotify-player
  ];
}
