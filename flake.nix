{
  description = "Nix configurations for my machines";

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

      forAllSystems = systems: fn: (genAttrs systems (system: fn (nixpkgs.legacyPackages.${system})));

    in
    {
      packages = forAllSystems systems (pkgs: {
        default = self.packages.${pkgs.system}.emacs;

        emacs = (pkgs.emacsPackagesFor self.packages.${pkgs.system}.emacs-minimal).emacsWithPackages (
          epkgs: with epkgs; [
            biblio
            citar
            cape
            corfu
            dashboard
            denote
            exec-path-from-shell
            envrc
            evil
            (fontaine.overrideAttrs (
              prev: final: {
                version = "3.0.0";
                src = pkgs.fetchurl {
                  url = "https://elpa.gnu.org/packages/fontaine-3.0.0.tar";
                  sha256 = "/GtXskp9Z6+mTYDfr2p+TafB92Kv5/6MfKOWcnzmT+w=";
                };
              }
            ))
            format-all
            helpful
            lorem-ipsum
            magit
            marginalia
            modus-themes
            no-littering
            orderless
            org-modern
            page-break-lines
            setup
            spacious-padding
            vertico
          ]
        );

        emacs-minimal = pkgs.callPackage ./emacs.nix { };
      });

      apps = forAllSystems systems (pkgs: {
        default = self.apps.${pkgs.system}.emacs;

        emacs = {
          type = "app";
          program = "${self.packages.${pkgs.system}.emacs}/bin/emacs";
        };
      });
      formatter = forAllSystems systems (pkgs: pkgs.nixfmt-rfc-style);

      devShells = forAllSystems systems (pkgs: {
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
