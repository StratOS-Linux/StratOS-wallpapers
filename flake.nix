{
  description = "StratOS Wallpapers Flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    stratpapers = pkgs.stdenv.mkDerivation {
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
  in {
    packages.${system} = {
      stratos-wallpapers = stratpapers; 
      # Expose the wallpapers path for other flakes
      default = stratpapers;
    };
    # For other flakes to use as an input
    wallpapers = stratpapers;
  };
}
