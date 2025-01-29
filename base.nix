# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ pkgs, ... }: {

  stylix = {
    enable = true;
    image = ./wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    fonts.monospace = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerd-fonts.jetbrains-mono;
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Console
  # console = {
  #   font = "ter-132n";
  #   packages = with pkgs; [ terminus_font ];
  #   keyMap = "us";
  # };

  # # TTY
  # fonts.packages = with pkgs; [
  #   meslo-lgs-nf
  # ];

  # services.kmscon = {
  #   enable = true;
  #   hwRender = true;
  #   extraConfig = ''
  #     font-name=MesloLGS NF
  #     font-size=14
  #   '';
  # };

  # # Boot
  # # Bootloader.
  # boot = {
  #   # Plymouth
  #   consoleLogLevel = 0;
  #   initrd.verbose = false;
  #   plymouth.enable = true;
  #   kernelParams = [ "quiet" "rd.systemd.show_status=false" "rd.udev.log_level=3" "udev.log_priority=3" "boot.shell_on_fail" ];

  #   # Boot Loader
  #   loader = {
  #     timeout = 5;
  #     efi.canTouchEfiVariables = true;
  #     systemd-boot.enable = true;
  #   };
  # };
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
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
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.nushell;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.variables.EDITOR = "hx";
  environment.variables.VISUAL = "hx";

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    config = {
      user = {
        name = "mjmena";
        email = "martinjxm@gmail.com";
      };
      core = {
        editor = "hx";
      };
    };
  };

  programs.direnv.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment?
}
