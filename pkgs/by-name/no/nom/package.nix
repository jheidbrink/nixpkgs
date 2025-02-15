{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "nom";
  version = "2.6.2";

  src = fetchFromGitHub {
    owner = "guyfedwards";
    repo = "nom";
    rev = "v${version}";
    hash = "sha256-oaManxhksEBwbe1jmkRmOJMhYFiulGTVCuto4RMznvg=";
  };

  vendorHash = "sha256-xolhwdWRjYZMgwI4jq0fGzvxnNjx6EplvZC7XMvBw+M=";

  meta = with lib; {
    homepage = "https://github.com/guyfedwards/nom";
    description = "RSS reader for the terminal";
    platforms = platforms.linux ++ platforms.darwin;
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ nadir-ishiguro ];
    mainProgram = "nom";
  };
}
