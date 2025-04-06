{
  melpaBuild,
  fetchFromGitHub,
}:
melpaBuild {
  pname = "ultra-scroll";
  version = "0.3.4"; # You can use the latest version or a specific Git commit hash

  src = fetchFromGitHub {
    owner = "jdtsmith";
    repo = "ultra-scroll";
    rev = "master"; # Or a specific commit or version tag
    sha256 = "aAYPIsyoSAM6Qy8hZQ4+KJAd9OBkQr8U7HEqWAWRhaI=";
  };
}
