final: prev:
let
  inherit (prev.emacsPackages) melpaBuild;
in
{
  emacsPackages = {
    fontaine = prev.emacsPackages.fontaine.overrideAttrs (
      _: _: {
        version = "3.0.0";
        src = prev.fetchurl {
          url = "https://elpa.gnu.org/packages/fontaine-3.0.0.tar";
          sha256 = "/GtXskp9Z6+mTYDfr2p+TafB92Kv5/6MfKOWcnzmT+w=";
        };
      }
    );

    ultra-scroll = prev.callPackage ./packages/ultra-scroll.nix {
      inherit melpaBuild;
    };
  };
}
