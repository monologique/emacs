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
            nix-ts-mode
            no-littering
            orderless
            org-modern
            page-break-lines
            setup
            spacious-padding
            treesit-grammars.with-all-grammars
            (pkgs.emacsPackages.melpaBuild rec {
              pname = "ultra-scroll";
              version = "0.3.2"; # You can use the latest version or a specific Git commit hash

              src = pkgs.fetchFromGitHub {
                owner = "jdtsmith";
                repo = "ultra-scroll";
                rev = "master"; # Or a specific commit or version tag
                sha256 = "MHlHsciVPNyvqwkop9arOQ1VTV5POxJZ+z+IZo/PrMM=";
              };
            })

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
          buildInputs = [ self.packages.${pkgs.system}.emacs ];
          packages = with pkgs; [
            nil
            nixfmt-rfc-style
          ];
        };
      });
    };
}
