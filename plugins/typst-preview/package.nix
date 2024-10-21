{ pkgs, ... }:

let
  commit = "0f43ed7fa661617751bfd0ca2f01ee13eba6569e";
in
pkgs.vimUtils.buildVimPlugin {
  inherit commit;

  name = "typst-preview";

  src = pkgs.fetchFromGitHub {
    owner = "chomosuke";
    repo = "typst-preview.nvim";
    rev = "${commit}";
    hash = "sha256-olO2hh2xU/tiuwMNKGuKU+Wa5taiTUOv9jlK2/99yvk";
  };
}
