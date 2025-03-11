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
      formatter = forAllSystems (pkgs: pkgs.nixpkgs-rfc-style);

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
