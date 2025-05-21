{
  description = "monologique's Emacs flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    pre-commit-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      eachSystem =
        fn:
        (nixpkgs.lib.genAttrs systems (
          system:
          fn {
            inherit system;
            pkgs = nixpkgs.legacyPackages.${system};
          }
        ));

      systems = [
        "x86_64-darwin"
        "x86_64-linux"
        "aarch64-darwin"
        "aarch64-linux"
      ];
    in
    {

      packages = eachSystem (
        { pkgs, system }:
        {
          default = self.packages.${system}.emacs30;

          emacs30 = pkgs.callPackage ./nix/emacs-with-packages.nix {
            emacs = pkgs.callPackage ./nix/emacs30.nix { };
          };
        }
      );
      checks = eachSystem (
        { pkgs, system }:
        {
          pre-commit = inputs.pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              actionlint.enable = true;
              deadnix.enable = true;
              flake-checker.enable = true;
              treefmt = {
                enable = true;
                settings.formatters = with pkgs; [
                  nixfmt-rfc-style
                  taplo
                  yamlfmt
                  nodePackages.prettier
                ];
              };
            };
          };
        }
      );

      devShells = eachSystem (
        { pkgs, system }:
        {
          default = pkgs.mkShell {
            inherit (self.checks.${system}.pre-commit) shellHook;

            buildInputs =
              with pkgs;
              [
                nixd
              ]
              ++ self.checks.${system}.pre-commit.enabledPackages;
          };
        }
      );

      formatter = eachSystem ({ pkgs, ... }: pkgs.treefmt);
    };
}
