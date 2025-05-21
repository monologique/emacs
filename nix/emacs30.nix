{
  emacs30-pgtk,
  fetchpatch,
  system,
}:
let
  emacs-darwin = emacs30-pgtk.overrideAttrs (prev: {
    patches = (prev.patches or [ ]) ++ [
      (fetchpatch {
        url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-30/system-appearance.patch";
        sha256 = "3QLq91AQ6E921/W9nfDjdOUWR8YVsqBAT/W9c1woqAw=";
      })
      (fetchpatch {
        url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-29/round-undecorated-frame.patch";
        sha256 = "uYIxNTyfbprx5mCqMNFVrBcLeo+8e21qmBE3lpcnd+4=";
      })
    ];
  });

  emacs-linux = emacs30-pgtk;
in
if (system == "aarch64-darwin" || system == "x86_64-darwin") then emacs-darwin else emacs-linux
