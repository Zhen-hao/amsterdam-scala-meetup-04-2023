{
  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11"; };

  outputs = { self, nixpkgs }:
    let 
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      Rstudio-with-my-packages = with pkgs; rstudioWrapper.override { 
        packages = with rPackages; 
        let
        slidify = buildRPackage {
            name = "slidify";
            src = pkgs.fetchFromGitHub {
            owner = "ramnathv";
            repo = "slidify";
            rev = "1dd41a3023b20efb35d601a7d3fb248930bf076d";
            sha256 = "0wsn7dw0qnhvqpvcf57hhyxm7v0rmps1qsn83r3zqvgdkc90107j"; #"0000000000000000000000000000000000000000000000000000";
            };
            propagatedBuildInputs = [ markdown  knitr stringr yaml whisker ];
            # nativeBuildInputs = [ markdown  knitr stringr yaml whisker ];
        };
        slidifyLibraries = buildRPackage {
            name = "slidifyLibraries";
            src = pkgs.fetchFromGitHub {
            owner = "ramnathv";
            repo = "slidifyLibraries";
            rev = "dbd065f4843be1377d1aab5f35c9406c60922aa8";
            sha256 = "1wwxfw25b4m4yw0j6wz7vz9y3pxqymla3ql4mzpfc1g0igfa1v6r";
            };
        };
        in
        [ 
            knitr
            rmarkdown
            slidify
            slidifyLibraries
        ]; 
      };
    in {

      devShell.x86_64-linux =
        pkgs.mkShell { buildInputs = [ Rstudio-with-my-packages ]; };
   };
}