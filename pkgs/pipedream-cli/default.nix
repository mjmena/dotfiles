{ lib, stdenv, fetchurl, unzip }:

let
  version = "0.4.3";
  getUrl = import ./url.nix { inherit lib; };
  hashes = import ./hashes.nix;
  system = stdenv.hostPlatform.system;
in
stdenv.mkDerivation {
  pname = "pd";
  version = version;

  src = fetchurl {
    url = getUrl {
      cpuOs = system;
      version = version;
    };
    sha256 = lib.getAttrFromPath [ system ] hashes;
  };

  nativeBuildInputs = [ unzip ];

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/bin
    cp -r * $out/bin
  '';
}
