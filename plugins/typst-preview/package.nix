{ pkgs, ... }:

let
  commit = "7ae2b82cf334819494505b772745beb28705b12b";
in
pkgs.vimUtils.buildVimPlugin {
  inherit commit;

  name = "typst-preview";

  src = pkgs.fetchFromGitHub {
    owner = "chomosuke";
    repo = "typst-preview.nvim";
    rev = "${commit}";
    hash = "sha256-kJ6IfLSBmJMgEFuCy6fGtqSRBXjt2Aoxu2NW9iyzRLU=";
  };
}
