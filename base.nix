# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ pkgs, ... }:
{

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  nix.settings.auto-optimise-store = true;
  nix.settings.download-buffer-size = 268435456; # 256MB

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.variables.EDITOR = "nvim";
  environment.variables.VISUAL = "nvim";

  # Boot
  # Bootloader.
  boot = {
    # Plymouth
    consoleLogLevel = 0;
    initrd.verbose = false;
    plymouth.enable = true;
    kernelParams = [
      "quiet"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "boot.shell_on_fail"
    ];

    # Boot Loader
    loader = {
      timeout = 5;
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  # Enable networking
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 8080 ];
  };

  # Set your time zone.
  time.timeZone = "America/New_York";
  time.hardwareClockInLocalTime = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.marty = {
    isNormalUser = true;
    description = "marty";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGCER5LsQDVarvt5/iASmnP6M1lU8mj4ZW4oZxTb8TiU marty" # hermes
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPAGrfWIpQ/j/fx4KqmsxvKQY1VTKH1XJdOIw929/yhq marty" # hephaestus
    ];

    shell = pkgs.zsh;
  };

  environment.systemPackages = [
    pkgs.zellij
    pkgs.python315
  ];

  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
  ];

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    config = {
      user = {
        name = "mjmena";
        email = "martinjxm@gmail.com";
      };
    };
  };

  programs.zsh.enable = true;
  programs.direnv.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment?
}
