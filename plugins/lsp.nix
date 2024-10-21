{ icons, pkgs, ... }:

{
  opts = {
    enable = true;

    # Set keymaps when LSP is attached
    keymaps = {
      extra = [
        {
          mode = "n";
          key = "<leader>li";
          action = "<cmd>LspInfo<cr>";
          options.desc = "Show LSP info";
        }
        {
          mode = "n";
          key = "<leader>ll";
          action.__raw = "function() vim.lsp.codelens.refresh() end";
          options.desc = "LSP CodeLens refresh";
        }
        {
          mode = "n";
          key = "<leader>lL";
          action.__raw = "function() vim.lsp.codelens.run() end";
          options.desc = "LSP CodeLens run";
        }
      ];

      lspBuf = {
        "<leader>la" = {
          action = "code_action";
          desc = "LSP code action";
        };

        gd = {
          action = "definition";
          desc = "Go to definition";
        };

        gI = {
          action = "implementation";
          desc = "Go to implementation";
        };

        gy = {
          action = "type_definition";
          desc = "Go to type definition";
        };

        K = {
          action = "hover";
          desc = "LSP hover";
        };
      };
    };

    postConfig = ''
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = false,
      })

      local signs = {
        Error = "${icons.DiagnosticError}",
        Warn = "${icons.DiagnosticWarn}",
        Info = "${icons.DiagnosticInfo}",
        Hint = "${icons.DiagnosticHint}",
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    '';

    # Load all servers definitions
    servers = {
      ansiblels.enable = true;
      bashls.enable = true;
      cssls.enable = true;
      docker_compose_language_service.enable = true;
      dockerls.enable = true;
      eslint.enable = true;
      gopls.enable = true;
      helm_ls.enable = true;
      html.enable = true;
      java_language_server.enable = true;
      jsonls.enable = true;
      lua_ls.enable = true;
      nginx_language_server.enable = true;
      tinymist = {
        enable = true;
        extraOptions = {
          offset_encoding = "utf-8";
        };
        # settings = {
        #   offset_encoding = "utf-8";
        # };
      };
      nixd = {
        enable = true;
        extraOptions = {
          offset_encoding = "utf-8";
        };
        settings.formatting.command = [ "nixpkgs-fmt" ];
      };
      pyright.enable = true;
      sqls.enable = true;
      terraformls.enable = true;
      ts_ls.enable = true;
      # yamlls.enable = true;
      yamlls = {
        enable = true;
        extraOptions = {
          settings = {
            yaml = {
              schemas = {
                kubernetes = "'*.yaml";
                "http://json.schemastore.org/github-workflow" = ".github/workflows/*";
                "http://json.schemastore.org/github-action" = ".github/action.{yml,yaml}";
                "http://json.schemastore.org/ansible-stable-2.9" = "roles/tasks/*.{yml,yaml}";
                "http://json.schemastore.org/kustomization" = "kustomization.{yml,yaml}";
                "http://json.schemastore.org/ansible-playbook" = "*play*.{yml,yaml}";
                "http://json.schemastore.org/chart" = "Chart.{yml,yaml}";
                "https://json.schemastore.org/dependabot-v2" = ".github/dependabot.{yml,yaml}";
                "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" = "*docker-compose*.{yml,yaml}";
                "https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json" = "*flow*.{yml,yaml}";
              };
            };
          };
          capabilities = {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false;
                lineFoldingOnly = true;
              };
            };
          };
        };

      };

      typos_lsp = {
        enable = true;
        extraOptions.init_options.diagnosticSeverity = "Hint";
      };
    };
  };

  rootOpts = {
    colorschemes.catppuccin.settings.integrations.native_lsp.enabled = true;
    extraPackages = [ pkgs.go ];
  };
}
