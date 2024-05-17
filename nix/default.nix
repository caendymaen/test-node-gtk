{ lib
, stdenv
, buildNpmPackage
, fetchFromGitLab
, nodePackages
, meson
, pkg-config
, ninja
, gobject-introspection
, gtk3
, libpulseaudio
, gjs
, wrapGAppsHook
, upower
, gnome
, gtk-layer-shell
, glib-networking
, networkmanager
, libdbusmenu-gtk3
, gvfs
, libsoup_3
, libnotify
, pam
, extraPackages ? [ ]
, version ? "git"
, buildTypes ? true
}:

stdenv.mkDerivation rec {
  pname = "node-gtk-test";
  inherit version;

  src = buildNpmPackage {
    name = pname;
    src = lib.cleanSource ../.;

    dontBuild = true;

    npmDepsHash = "";

    installPhase = ''
      mkdir $out
      cp -r * $out
    '';
  };

  nativeBuildInputs = [
    wrapGAppsHook
    gobject-introspection
  ];

  buildInputs = [
    gtk4
    gtk4-layer-shell
  ];

  outputs = [ "out" "lib" ];

  meta = with lib; {
    description = "A customizable and extensible shell";
    homepage = "https://example.com";
    platforms = [ "x86_64-linux" ];
    license = licenses.gpl3;
    meta.maintainers = [ ];
  };
}