# homepage: https://github.com/folke/which-key.nvim
# nixvim doc: https://nix-community.github.io/nixvim/plugins/which-key/index.html
{ icons, ... }:

{
  opts = {
    enable = true;
    settings = {
      icons.group = "";
      # window.border = "single";
      # Disable which-key when in neo-tree or telescope
      disable.filetypes = [
        "TelescopePrompt"
        "neo-tree"
        "neo-tree-popup"
      ];
      # Customize section names (prefixed mappings)
      spec = [
        {
          __unkeyed-1 = "<leader>b";
          group = "Buffers";
          icon = "${icons.Tab}";
        }
        {
          __unkeyed-1 = "<leader>bs";
          group = "Sort Buffers";
          icon = "${icons.Sort}";
        }
        {
          __unkeyed-1 = "<leader>d";
          group = "Debugger";
          icon = "${icons.Debugger}";
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "Find";
          icon = "${icons.Search}";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "Git";
          icon = "${icons.Git}";
        }
        {
          __unkeyed-1 = "<leader>l";
          group = "Language Tools";
          icon = "${icons.ActiveLSP}";
        }
        {
          __unkeyed-1 = "<leader>m";
          group = "Markdown";
          icon = "";
        }
        {
          __unkeyed-1 = "<leader>s";
          group = "Session";
          icon = "${icons.Session}";
        }
        {
          __unkeyed-1 = "<leader>t";
          group = "Terminal";
          icon = "${icons.Terminal}";
        }
        {
          __unkeyed-1 = "<leader>u";
          group = "UI/UX";
          icon = "${icons.Window}";
        }
        {
          __unkeyed-1 = "<leader>p";
          group = "Preview";
          icon = "${icons.Eye}";
        }
      ];
    };

  };

  # Enable catppuccin colors
  # https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/integrations/which_key.lua
  rootOpts.colorschemes.catppuccin.settings.integrations.which_key = true;
}
