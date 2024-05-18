{ 
  lib,
  stdenv,
  buildNpmPackage,
  nodejs,
  gobject-introspection,
  gobject-introspection-unwrapped,
  gtk3,
  gtk4,
  wrapGAppsHook,
  gtk4-layer-shell,
  autoPatchelfHook,
  glib,
  glibc,
  python3,
  cairo,
  gjs
}:

stdenv.mkDerivation rec {
  pname = "node-gtk-test";
  version = "1";

  src = buildNpmPackage rec {
    name = pname;
    #src = lib.cleanSource ../.;
    src = ../.;#

    dontBuild = true;
    dontWrapGApps = true;

  nativeBuildInputs = [
    wrapGAppsHook
    autoPatchelfHook
    gjs
    glib
    glib.dev
    gobject-introspection
    gobject-introspection-unwrapped
  ];

  buildInputs = [
    gtk3
    gtk4
    gtk4-layer-shell
    nodejs
    glib
    glib.dev
    #glib
    python3
    cairo
  ];

    npmDepsHash = "sha256-YyAqIKsJAZwh/Nkvc6733IPvqfIHL/XQ4voY0IFcjZU=";
  installPhase = ''
      mkdir -p $out
      cp -r ./ $out;
    '';

    #outputs = [ "out" ];
  };

  #src = ../.;
 installPhase = ''
    mkdir -p $out
  #  mkdir -p $out/node_modules
    cp -r ./ $out 
  #  cp -r node_modules $out/node_modules
  '';
    dontWrapGApps = true;

  nativeBuildInputs = [
    wrapGAppsHook
    autoPatchelfHook
    gobject-introspection
    gobject-introspection-unwrapped
    glib
    glib.dev
    gjs
  ];

  buildInputs = [
    gtk3
    gtk4
    gtk4-layer-shell
    nodejs
    glib.dev
    #glib
    python3
    cairo
  ];

  propagatedBuildInputs = [
    #glib
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