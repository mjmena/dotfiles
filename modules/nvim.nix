{
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.nixfmt-rfc-style
    pkgs.ripgrep
  ];

  programs.nixvim = {
    enable = true;
    globals = {
      mapleader = " ";
    };
    opts = {
      relativenumber = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };
    diagnostics = {
      virtual_text = true;
    };
    keymaps = [
      {
        action = "<cmd>lua vim.lsp.buf.implementation()<CR>";
        key = "gd";
      }
      {
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        key = "<leader>ca";
      }
      {
        action = "<cmd>Telescope git_files<CR>";
        key = "ff";
      }
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "fg";
      }
      {
        action = "<cmd>Oil<CR>";
        key = "`";
      }
    ];

    plugins = {
      blink-cmp = {
        enable = true;
        settings = {
          completion = {
            accept = {
              auto_brackets.enabled = true;
            };
            documentation = {
              auto_show = true;
            };
          };
        };
      };
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            timeout_ms = 500;
          };
          formatters_by_ft = {
            nix = [ "nixfmt" ];
            rust = [
              "leptosfmt"
              "rustywind"
              "rustfmt"
            ];
          };
        };
      };
      fidget.enable = true;
      nvim-autopairs.enable = true;

      oil = {
        enable = true;
        settings = {
          keymaps = {
            "<CR>" = "actions.select";
          };
          use_default_keymaps = false;
        };
      };
      telescope = {
        enable = true;
        # extensions.file-browser = {
        #   enable = true;
        #   settings = {
        #     hijack_netrw = true;
        #   };
        # };
      };
      treesitter.enable = true;
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          rust_analyzer = {
            enable = true;
            installRustc = false;
            installCargo = false;
          };
        };
      };
      web-devicons.enable = true;
      which-key.enable = true;
    };
  };
}
