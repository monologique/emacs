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

    (denote.override (old: {
      elpaBuild = old.elpaBuild // {
        src = fetchFromGitHub {
          owner = "protesilaos";
          repo = "denote";
          rev = "2b1625a9c6c44e40e147f902c05cccf2ef8dafde";
          hash = "sha256-rd5dSRit+2sZflVDWvkjOht/s/MpncWI/l36dGviwGs=";
        };
      };
    }))

    (envrc.override (old: {
      elpaBuild = old.elpaBuild // {
        src = fetchFromGitHub {
          owner = "purcell";
          repo = "envrc";
          rev = "4ca2166ac72e756d314fc2348ce1c93d807c1a14";
          hash = "sha256-1PvINLJJqKOqJnxQ6zFsJCZw62IMqvBn9C2sthu1INA=";
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

    (lsp-mode.override (old: {
      melpaBuild = old.melpaBuild // {
        src = fetchFromGitHub {
          owner = "emacs-lsp";
          repo = "lsp-mode";
          rev = "09f16c7d7e349c9161cd37816505d62f3d5c07e7";
          hash = "sha256-SNyWS10zb+JKxJ7i3Axo9NgYnbQl/1NkLR9DDQREiyM=";
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

    (markdown-mode.override (old: {
      melpaBuild = old.melpaBuild // {
        src = fetchFromGitHub {
          owner = "jrblevin";
          repo = "markdown-mode";
          rev = "90ad4af79a8bb65a3a5cdd6314be44abd9517cfc";
          hash = "sha256-PIR6xSbMv4JRK7cbjM9qRuSKhYuHyyEcbEPOHtSXgaU=";
        };
      };
    }))

    (meow.override (old: {
      melpaBuild = old.melpaBuild // {
        src = fetchFromGitHub {
          owner = "sindresorhus";
          repo = "meow";
          rev = "87d1bc394d9a1d73b76a81d4874db4f1190259ef";
          hash = "sha256-u2Dl/WJ19GXkHtjQNSMENzqdYZpPKBT+vY1Kg6bakmM=";
        };
      };
    }))

    (modus-themes.override (old: {
      melpaBuild = old.melpaBuild // {
        src = fetchFromGitHub {
          owner = "protesilaos";
          repo = "modus-themes";
          rev = "6880f3a7d99d98eae81905c566dc920dbb652cff";
          hash = "sha256-GaMvsdl6APX4tX8blGfoqvNGfb9+1p2a2ZVfuhzVWRQ=";
        };
      };
    }))

    (melpaBuild rec {
      pname = "neocaml";
      version = "0.1.0";

      src = fetchFromGitHub {
        owner = "bbatsov";
        repo = "neocaml";
        rev = "930e4aa9ad50977eefe296f35d0c5c1e6e112398";
        hash = "sha256-EQEe+HZY/3D1e3AUmy+FIO1KAZorvFvt1Bg7B7YVxDw=";
      };
    })

    (nix-ts-mode.override (old: {
      melpaBuild = old.melpaBuild // {
        src = fetchFromGitHub {
          owner = "nix-community";
          repo = "nix-ts-mode";
          rev = "62ce3a2dc39529c5db3516427e84b2c96b8efcfd";
          hash = "sha256-+TkkeiL2Dx8Tj5csLghQJFWlV3RqCHKDh2gEHX3hdZQ=";
        };
      };
    }))

    (no-littering.override (old: {
      melpaBuild = old.melpaBuild // {
        src = fetchFromGitHub {
          owner = "emacscollective";
          repo = "no-littering";
          rev = "5596cc6586b3d1ce77d7c9e5385a0809fbad4eb6";
          hash = "sha256-ZWTfAM1KUTugRJ/Axv6+C1LKfeh9LDHFVbAeWlbjFRc=";
        };
      };
    }))

    (olivetti.override (old: {
      melpaBuild = old.melpaBuild // {
        src = fetchFromGitHub {
          owner = "rnkn";
          repo = "olivetti";
          rev = "845eb7a95a3ca3325f1120c654d761b91683f598";
          hash = "sha256-eXtwQZjGaiuS1XuNhLrLuk9/qvugiowGokbb0AlG/EI=";
        };
      };
    }))

    (org-modern.override (old: {
      elpaBuild = old.elpaBuild // {
        src = fetchFromGitHub {
          owner = "minad";
          repo = "org-modern";
          rev = "6d375b9dfb8b0fb9df2c342889f94dcb653437dc";
          hash = "sha256-OmLfrUum///Tu9Fnu9IBIk3usEwEk077/T1WdcGTr7g=";
        };
      };
    }))

    (popper.override (old: {
      elpaBuild = old.elpaBuild // {
        src = fetchFromGitHub {
          owner = "karthink";
          repo = "popper";
          rev = "49f4904480cf4ca5c6db83fcfa9e6ea8d4567d96";
          hash = "sha256-Qnb5R/yTfJqR8cdcfMJAku95c+SCYbQQrf+HQqPCj3o=";
        };
      };
    }))

    (setup.override (old: {
      elpaBuild = old.elpaBuild // {
        src = fetchGit {
          url = "https://codeberg.org/pkal/setup.el.git";
          ref = "master";
          rev = "992e7b49f0dbbd6979598902e67079fa9607febf";
        };
      };
    }))

    (spacious-padding.override (old: {
      elpaBuild = old.elpaBuild // {
        src = fetchFromGitHub {
          owner = "protesilaos";
          repo = "spacious-padding";
          rev = "cd33d70f6cd9d8f3a2f6f7831711c8230d21649d";
          hash = "sha256-xZPTUd9mVn4nWBApqwFngldnFOGnxeaKV1zDmkl1YY0=";
        };
      };
    }))

    (transient.override (old: {
      elpaBuild = old.elpaBuild // {
        src = fetchFromGitHub {
          owner = "magit";
          repo = "transient";
          rev = "cb6550d5b111b7815feec97b236ecb051de70dbe";
          hash = "sha256-gwOn9o/aSAjKoVX/ovjupxGpByuogfxVmtCi593EOwg=";
        };
      };
    }))

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

    (vertico.override (old: {
      elpaBuild = old.elpaBuild // {
        src = fetchFromGitHub {
          owner = "minad";
          repo = "vertico";
          rev = "54829f61034c9408cf620dac1e6af304f38d79ed";
          hash = "sha256-MeM4CDdHDMgaovtQ/kSedRBvJZre+sUBW2zs2RqDAuI=";
        };
      };
    }))

    (yasnippet.override (old: {
      elpaBuild = old.elpaBuild // {
        src = fetchFromGitHub {
          owner = "joaotavora";
          repo = "yasnippet";
          rev = "2384fe1655c60e803521ba59a34c0a7e48a25d06";
          hash = "sha256-MIx9gqUv8GQ41kOYUah+Yuf2uC/YwWbh5rnlH4XZEYU=";
        };
      };
    }))

  ]
)
