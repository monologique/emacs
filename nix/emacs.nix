{
  emacs30-pgtk,
  emacsPackagesFor,
  emacsPackages,
  fetchpatch,
}:
let
  build = emacs30-pgtk.overrideAttrs (old: {
    pname = "Emacs";
    patches = (old.patches or [ ]) ++ [
      # Fix OS window role (needed for window managers like yabai)
      (fetchpatch {
        url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-28/fix-window-role.patch";
        sha256 = "+z/KfsBm1lvZTZNiMbxzXQGRTjkCFO4QPlEK35upjsE=";
      })
      # Enable rounded window with no decoration
      (fetchpatch {
        url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-30/round-undecorated-frame.patch";
        sha256 = "uYIxNTyfbprx5mCqMNFVrBcLeo+8e21qmBE3lpcnd+4=";
      })
      # Make Emacs aware of OS-level light/dark mode
      (fetchpatch {
        url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-30/system-appearance.patch";
        sha256 = "3QLq91AQ6E921/W9nfDjdOUWR8YVsqBAT/W9c1woqAw=";
      })
    ];
  });
in
(emacsPackagesFor build).emacsWithPackages (
  epkgs:
  with epkgs;
  with emacsPackages;
  [
    biblio
    citar
    cape
    corfu
    dashboard
    denote
    exec-path-from-shell
    envrc
    fontaine
    format-all
    helpful
    lorem-ipsum
    magit
    marginalia
    markdown-mode
    meow
    modus-themes
    neocaml
    nix-ts-mode
    no-littering
    orderless
    org-fragtog
    org-modern
    page-break-lines
    spacious-padding
    treesit-auto
    treesit-grammars.with-all-grammars
    ultra-scroll
    vertico
  ]
)
