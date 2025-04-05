{
  description = "monologique's emacs configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
    }:
    let
      systems = [
        "aarch64-darwin"
        "x86_64-linux"
      ];

      inherit (nixpkgs.lib) genAttrs;

      forAllSystems =
        fn:
        (genAttrs systems (
          system:
          fn (
            import nixpkgs {
              inherit system;
              overlays = [ (import ./nix/overlays.nix) ];
            }
          )
        ));

    in
    {
      packages = forAllSystems (pkgs: {
        default = self.packages.${pkgs.system}.emacs;

        emacs = pkgs.callPackage ./nix/emacs.nix { };
      });

      apps = forAllSystems (pkgs: {
        default = self.apps.${pkgs.system}.emacs;

        emacs = {
          type = "app";
          program = "${self.packages.${pkgs.system}.emacs}/bin/emacs";
        };
      });

      overlays = import ./nix/overlays.nix;

      formatter = forAllSystems (pkgs: pkgs.nixfmt-rfc-style);

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          name = "machines";

          packages = with pkgs; [
            nil
            nixfmt-rfc-style
          ];
        };
      });
    };
}
