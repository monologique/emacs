{
  emacs,
  emacsPackagesFor,
  fetchFromGitHub,
}:

(emacsPackagesFor emacs).emacsWithPackages (
  epkgs: with epkgs; [
    (activities.override (old: {
      elpaBuild = old.elpaBuild // {
        src = fetchFromGitHub {
          owner = "alphapapa";
          repo = "activities.el";
          rev = "a7e7842c615e149ad7d7e57f383936b49dcb129f";
          hash = "sha256-jlJAdYZ6hiiwlQu/LmuXyVFmD6c3yHIS3tezVeUQGhk=";
        };
      };
    }))

    (cape.override (old: {
      elpaBuild = old.elpaBuild // {
        src = fetchFromGitHub {
          owner = "minad";
          repo = "cape";
          rev = "c9191ee9e13e86a7b40c3d25c8bf7907c085a1cf";
          hash = "sha256-8BfMla3R8/q/ihId7PIOPv0iwkh/w3BgO1fPSqKYtEk=";
        };
      };
    }))

    (citar.override (old: {
      elpaBuild = old.elpaBuild // {
        src = fetchFromGitHub {
          owner = "emacs-citar";
          repo = "citar";
          rev = "5ef097beba280cb0a7e7496a6f6a3b7f612c2fe2";
          hash = "sha256-T/FsHvWZ3LAxiEyCMhVVDcrBUIG7XnJbcPhPpN94tr8=";
        };
      };
    }))

    (corfu.override (old: {
      elpaBuild = old.elpaBuild // {
        src = fetchFromGitHub {
          owner = "minad";
          repo = "corfu";
          rev = "6db826974963f8fb5d8b9832e7c09da2fea3296a";
          hash = "sha256-BZD5UjiaHDJG733Ild9mGSeqygPXVuC/zHhzb5H00FA=";
        };
      };
    }))

    (consult.override (old: {
      elpaBuild = old.elpaBuild // {
        src = fetchFromGitHub {
          owner = "minad";
          repo = "consult";
          rev = "e57fbb65584f3160f98a2569b1674c8065ec8df8";
          hash = "sha256-tMIYWpeXTjFRNSbdDFQCb+nA2waQtLgzxfdhaab29/o=";
        };
      };
    }))

    (helpful.override (old: {
      melpaBuild = old.melpaBuild // {
        src = fetchFromGitHub {
          owner = "Wilfred";
          repo = "helpful";
          rev = "03756fa6ad4dcca5e0920622b1ee3f70abfc4e39";
          hash = "sha256-mMVRa+KASSgBn1sOHgX4fk5NcixW/j6u+pLsYE8HmOA=";
        };
      };
    }))

    (fontaine.override (old: {
      elpaBuild = old.elpaBuild // {
        src = fetchFromGitHub {
          owner = "protesilaos";
          repo = "fontaine";
          rev = "8b1ddcaa47a495564fb0b24a9e043de46000a029";
          hash = "sha256-enVKVDMkryPXW71nS4D4e11CGPz5dsEURiFdqMTZkkI=";
        };
      };
    }))

    (marginalia.override (old: {
      elpaBuild = old.elpaBuild // {
        src = fetchFromGitHub {
          owner = "minad";
          repo = "marginalia";
          rev = "3cfba58cd56bdf5c12609a8bfc89fb97f3df37b0";
          hash = "sha256-XoW3jWr8WOacVMllu7qVmGj5jR41GMdth6vI7UTosrg=";
        };
      };
    }))

    (magit.override (old: {
      melpaBuild = old.melpaBuild // {
        src = fetchFromGitHub {
          owner = "magit";
          repo = "magit";
          rev = "04ee83d93fabbfbe202e9e7dc781b0dcd4d5b502";
          hash = "sha256-OYBNAV6xiPQHxg2ACrjYSIkF2xwbyTwDZhX9NCqJEjw=";
        };
      };
    }))

    markdown-mode
    meow
    modus-themes
    nix-ts-mode
    no-littering
    olivetti
    org-modern
    popper
    setup
    spacious-padding
    transient
    treesit-grammars.with-all-grammars

    (melpaBuild rec {
      pname = "ultra-scroll";
      version = "0.3.2";

      src = fetchFromGitHub {
        owner = "jdtsmith";
        repo = "ultra-scroll";
        rev = "93cd969c2ed1e75a950e6dec112a0ab1e4a6903b";
        hash = "sha256-DI9fiOtV/yGRx3BxNoKG8ulLdyx6v1RyzFIGMyggKeU=";
      };
    })
  ]
)
