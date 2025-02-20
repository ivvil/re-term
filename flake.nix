{
  description = "re-term flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    utils,
  }:
    utils.lib.eachDefaultSystem
    (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          deno
          tree-sitter-grammars.tree-sitter-typescript
          typescript
          typescript-language-server
        ];
      };

      # apps = rec {
      #   dev = utils.lib.mkApp {
      #     drv = pkgs.writeShellScriptBin "composer-dev" ''
      #         ${pkgs.phpPackages.composer}/bin/composer run dev
      #     '';
      #   };

      #   default = dev;
      # };
    });
}
