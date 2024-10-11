# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  inputs,
  system,
  pkgs,
  ...
}: {
  imports = [
    modules/firefox.nix
    modules/zellij.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  # Console
  console = {
    font = "ter-132n";
    packages = with pkgs; [terminus_font];
    keyMap = "us";
  };

  # TTY
  fonts.packages = with pkgs; [
    meslo-lgs-nf
    (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})
  ];
  services.kmscon = {
    enable = true;
    hwRender = true;
    extraConfig = ''
      font-name=MesloLGS NF
      font-size=14
    '';
  };

  # Boot
  # Bootloader.
  boot = {
    # Plymouth
    consoleLogLevel = 0;
    initrd.verbose = false;
    plymouth.enable = true;
    kernelParams = ["quiet" "rd.systemd.show_status=false" "rd.udev.log_level=3" "udev.log_priority=3" "boot.shell_on_fail"];

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
    allowedTCPPorts = [8080];
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

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
  sound.enable = true;
  hardware.pulseaudio.enable = false;
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
    extraGroups = ["root" "networkmanager" "wheel"];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [
    pkgs.vesktop
    pkgs.helix
    pkgs.yazi
    inputs.mvim.packages.${system}.default
  ];

  environment.variables.EDITOR = "nvim";
  environment.variables.VISUAL = "nvim";

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    config = {
      user = {
        name = "mjmena";
        email = "martinjxm@gmail.com";
      };
      core = {
        editor = "nix run github:mjmena/mvim --";
      };
    };
  };

  programs.direnv.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment?
}
