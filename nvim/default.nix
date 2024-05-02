{ config, pkgs, lib, ... }:
with lib;
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    };
  }
