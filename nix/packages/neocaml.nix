{
  melpaBuild,
  fetchFromGitHub,
}:
melpaBuild {
  pname = "neocaml";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "bbatsov";
    repo = "neocaml";
    rev = "main";
    sha256 = "ueoyZcjKq+g05HJxgvZkFWisSv7rSfULpVfxYIOt2Og=";
  };
}
