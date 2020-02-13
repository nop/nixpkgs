# This file was generated by https://github.com/kamilchm/go2nix v1.3.0
{ stdenv, buildGoPackage, fetchFromGitHub }:

# buildGoModule is not supported by the project
# See https://github.com/mikefarah/yq/issues/227
buildGoPackage rec {
  pname = "yq-go";
  version = "3.1.0";

  goPackagePath = "github.com/mikefarah/yq/v3";

  src = fetchFromGitHub {
    owner = "mikefarah";
    rev = version;
    repo = "yq";
    sha256 = "0hsb9m0pq2agsg7392r6h9sv5vqa2r7fl0ff1q24vpx8jlpq1vc6";
  };

  goDeps = ./deps.nix;

  postInstall = ''
    mv $bin/bin/v3 $bin/bin/yq
  '';

  meta = with stdenv.lib; {
    description = "Portable command-line YAML processor";
    homepage = http://mikefarah.github.io/yq/;
    license = [ licenses.mit ];
    maintainers = [ maintainers.lewo ];
  };
}