{
  melpaBuild,
  fetchFromGitHub,
}:
melpaBuild {
  pname = "ultra-scroll";
  version = "0.3.4";

  src = fetchFromGitHub {
    owner = "jdtsmith";
    repo = "ultra-scroll";
    rev = "master";
    sha256 = "aAYPIsyoSAM6Qy8hZQ4+KJAd9OBkQr8U7HEqWAWRhaI=";
  };
}
