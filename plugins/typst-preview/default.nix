# homepage: https://github.com/chomosuke/typst-preview.nvim
{ lib, pkgs, inputs, ... }:

let
  typst-preview = (import ./package.nix { inherit lib pkgs; });
  stable = import inputs.nixpkgs-stable {
    localSystem = pkgs.system;
  };
in
{
  extra = {
    packages = [
      typst-preview
    ];
    config = /*lua*/''
        require 'typst-preview'.setup ({
          -- open_cmd = '${pkgs.librewolf}/bin/librewolf %s -P ${pkgs.typst-preview}/bin/typst-preview --class ${pkgs.typst-preview}/bin/typst-preview',
          open_cmd = '${pkgs.vimb}/bin/vimb --cmd "set dark-mode=on|set show-titlebar=false|set status-bar=false" %s',
          dependencies_bin = {
            ['typst-preview'] = '${stable.typst-preview}/bin/typst-preview',
            ['websocat'] = '${pkgs.websocat}/bin/websocat'
          }, 
          -- debug = true,
      })
    '';
  };
  rootOpts.keymaps = [
    {
      mode = "n";
      key = "<leader>pt";
      action = "<cmd>TypstPreviewToggle<CR>";
      options.desc = "Toggle Typst Preview";
    }
  ];
}
