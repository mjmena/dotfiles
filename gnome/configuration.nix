# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

          {
            services.xserver.enable = true;
            services.xserver.displayManager.gdm.enable = true;
            services.xserver.desktopManager.gnome.enable = true;
            environment.gnome.excludePackages = (with pkgs; [
              gnome-photos
              gnome-tour
            ]) ++ (with pkgs.gnome; [
              tali # poker game
              atomix # puzzle game
              gnome-initial-setup
            ]);
            programs.dconf.enable = true;
            environment.systemPackages = with pkgs; [
              gnome.gnome-tweaks
            ];
}
