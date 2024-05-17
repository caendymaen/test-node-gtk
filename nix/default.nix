{ lib
, stdenv
, buildNpmPackage
, fetchFromGitLab,
nodejs
, nodePackages
, gobject-introspection
, gtk4
, wrapGAppsHook
, gtk4-layer-shell
}:

stdenv.mkDerivation rec {
  pname = "node-gtk-test";
  version = "1";

  src = buildNpmPackage {
    name = pname;
    src = lib.cleanSource ../.;
    #src = ../.;

    dontBuild = true;

    npmDepsHash = "sha256-YyAqIKsJAZwh/Nkvc6733IPvqfIHL/XQ4voY0IFcjZU=";

    installPhase = ''
      mkdir -p $out; cp -r * $out;
    '';
  };

  nativeBuildInputs = [
    wrapGAppsHook
    gobject-introspection
    nodejs
  ];

  buildInputs = [
    gtk4
    gtk4-layer-shell
  ];

  outputs = [ "out" ];

  meta = with lib; {
    description = "A customizable and extensible shell";
    homepage = "https://example.com";
    platforms = [ "x86_64-linux" ];
    license = licenses.gpl3;
    meta.maintainers = [ ];
  };
}