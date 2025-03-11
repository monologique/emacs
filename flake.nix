{
  description = "monologique's Emacs configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
    }:
    let
      systems = [
        "aarch64-darwin"
        "x86_64-linux"
      ];

      forAllSystems = fn: (nixpkgs.lib.genAttrs systems (system: fn (nixpkgs.legacyPackages.${system})));
    in
    {
      formatter = forAllSystems (pkgs: pkgs.alejandra);

      packages = forAllSystems (pkgs: {
        default = self.packages.${pkgs.system}.emacs;

        emacs = pkgs.emacs30-pgtk.overrideAttrs (old: {
          patches = (old.patches or [ ]) ++ [
            # Fix OS window role (needed for window managers like yabai)
            (pkgs.fetchpatch {
              url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-28/fix-window-role.patch";
              sha256 = "+z/KfsBm1lvZTZNiMbxzXQGRTjkCFO4QPlEK35upjsE=";
            })
            # Enable rounded window with no decoration
            (pkgs.fetchpatch {
              url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-30/round-undecorated-frame.patch";
              sha256 = "uYIxNTyfbprx5mCqMNFVrBcLeo+8e21qmBE3lpcnd+4=";
            })
            # Make Emacs aware of OS-level light/dark mode
            (pkgs.fetchpatch {
              url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-30/system-appearance.patch";
              sha256 = "3QLq91AQ6E921/W9nfDjdOUWR8YVsqBAT/W9c1woqAw=";
            })
          ];
        });
      });

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
