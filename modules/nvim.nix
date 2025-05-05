{
  pkgs,
  ...
}:
{
  environment.systemPackages = [
    pkgs.nixfmt-rfc-style
    pkgs.fd
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
        action = "<esc>:w<CR>";
        key = "kj";
        mode = "i";
      }
      {
        action = "<cmd>lua Snacks.terminal()<CR>";
        key = "<leader>t";
        mode = [
          "t"
          "n"
        ];
      }
      {
        action = "<cmd>lua Snacks.lazygit()<CR>";
        key = "<leader>l";
      }
      {
        action = "<cmd>lua Snacks.explorer()<CR>";
        key = "<leader><space>";
      }
      {
        action = "<cmd>lua Snacks.picker.lsp_definitions()<CR>";
        key = "gd";
      }
      {
        action = "<cmd>lua Snacks.picker.lsp_references()<CR>";
        key = "gr";
      }
      {
        action = "<cmd>lua Snacks.picker.diagnostics_buffer()<CR>";
        key = "<leader>d";
      }
      {
        action = "<cmd>lua Snacks.picker.diagnostics()<CR>";
        key = "<leader>D";
      }
      {
        action = "<cmd>lua Snacks.picker.smart()<CR>";
        key = "<leader>f";
      }

      {
        action = "<cmd>lua Snacks.picker.grep()<CR>";
        key = "<leader>g";
      }
      {
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        key = "<leader>a";
      }
      {
        action = "<cmd>b#<CR>";
        key = "ga";
      }
    ];

    plugins = {
      blink-cmp = {
        enable = true;
        settings = {
          completion = {
            documentation = {
              auto_show = true;
            };
          };
          keymap = {
            "<Tab>" = [
              "select_next"
              "scroll_documentation_down"
              "fallback"
            ];
            "<S-Tab>" = [
              "select_prev"
              "scroll_documentation_up"
              "fallback"
            ];
            "<C-CR>" = [
              "show"
              "show_documentation"
              "hide_documentation"
            ];
            "<CR>" = [
              "select_and_accept"
              "fallback"
            ];
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

      snacks = {
        enable = true;
        settings = {
          explorer.enabled = true;
          input.enabled = true;
          picker = {
            enabled = true;
            sources.explorer = {
              auto_close = true;
            };
          };

          words.enabled = true;
        };
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
          ts_ls.enable = true;
        };
      };
      web-devicons.enable = true;
      which-key.enable = true;
    };
  };
}
