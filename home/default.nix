{
  pkgs,
  ...
}:
{
  home.username = "marty";
  home.homeDirectory = "/home/marty";

  home.packages = [
    pkgs.lazygit
    pkgs.bat
    pkgs.devenv
    pkgs.btop
  ];
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = "martinjxm@gmail.com";
        name = "Martin Mena";
      };
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      terminal.shell = pkgs.lib.getExe pkgs.zsh;
      selection.save_to_clipboard = true;
      window = {
        startup_mode = "Maximized";
        decorations = "None";
      };
      font = {
        normal = {
          family = "JetBrainsMono NF";
          style = "Regular";
        };
        size = 11;
      };
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "eza -1 --icons --git-ignore";
    };
    initContent = ''
      # Ensure starship, zoxide, and direnv are properly initialized if not already handled by HM
    '';
  };

  programs.direnv = {
    enable = true;
    # silent = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      directory.truncate_to_repo = false;
      nix_shell.format = "in [\$symbol](\$style)";
      package.disabled = true;
      cmd_duration.disabled = true;
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
  };

  # Packages that should be installed to the user profile.
  # home.packages = with pkgs; [];
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
