{
    description = "caendywm flake";

    inputs = {
        # adding nix packages
        nixpkgs = {
            # unstable
            url = "github:NixOS/nixpkgs/nixos-unstable";
        };
    };

    outputs = { self, nixpkgs }: 
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {

        packages.${system}.default = pkgs.callPackage ./nix/default.nix {};

    };
}