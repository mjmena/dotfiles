{ config, pkgs, lib, ... }:
with lib;
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
        # Basics
        vim-sensible
        # Add syntax/detection/indentation for langs
        vim-nix

        # File Tree
        nvim-web-devicons
        nvim-tree-lua
        # Fuzzy finder window
        telescope-nvim
        # Tabs
        bufferline-nvim

        # Syntax highlighting
        nvim-treesitter.withAllGrammars
        catppuccin-nvim
      ];

      extraPackages = with pkgs; [
        tree-sitter
        # Language Servers
        # Lua
        lua-language-server
        # Nix
        nil
        nixpkgs-fmt
        statix
        # Telescope tools
        ripgrep
        fd
      ];

      extraConfig = ''
        :luafile ~/.config/nvim/lua/init.lua
      '';
    };

    xdg.configFile.nvim = {
      source = ./config;
      recursive = true;
    };
  }
