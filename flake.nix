{
  description = "StratOS Wallpapers Flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.${system}.stratos-wallpapers = pkgs.stdenv.mkDerivation {
      pname = "stratos-wallpapers";
      version = "1.0-2";
      src = ./.;
      installPhase = ''
        mkdir -p $out/share/backgrounds/StratOS
        cp -r usr/share/backgrounds/StratOS/* $out/share/backgrounds/StratOS/
      '';
      # Optionally, add meta attributes
      meta = {
        description = "StratOS wallpapers";
        authors = with pkgs.lib.authors; [ zstg ];
        license = pkgs.lib.licenses.gpl3;
        platforms = pkgs.lib.platforms.all;
      };
    };

    # Expose the wallpapers path for other flakes
    packages.${system}.default = self.packages.${system}.stratos-wallpapers;
    # For other flakes to use as an input
    wallpapers = self.packages.${system}.stratos-wallpapers;
  };
}