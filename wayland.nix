{ pkgs, ... }: {

  programs.hyprland.enable = true;
  xdg.portal.enable = true;

  environment.systemPackages = [
    pkgs.waybar
    pkgs.mako
    pkgs.libnotify
    pkgs.swww
    pkgs.kitty
    pkgs.rofi-wayland
  ];

}
