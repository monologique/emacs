{
  melpaBuild,
  fetchFromGitHub,
}:
melpaBuild {
  pname = "ultra-scroll";
  version = "0.3.2"; # You can use the latest version or a specific Git commit hash

  src = fetchFromGitHub {
    owner = "jdtsmith";
    repo = "ultra-scroll";
    rev = "master"; # Or a specific commit or version tag
    sha256 = "MHlHsciVPNyvqwkop9arOQ1VTV5POxJZ+z+IZo/PrMM=";
  };
}
