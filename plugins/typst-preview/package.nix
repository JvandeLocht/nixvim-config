{ pkgs, ... }:

let
  version = "0.3.2";
in
pkgs.vimUtils.buildVimPlugin {
  inherit version;

  name = "typst-preview";

  src = pkgs.fetchFromGitHub {
    owner = "chomosuke";
    repo = "typst-preview.nvim";
    rev = "v${version}";
    hash = "sha256-33clHm4XRfbYKSYrofm1TEaUV2UCIFVqNAc6Js8sTzY=";
  };
}
