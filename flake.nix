{
  description = "apps.moritzwolf.com — static landing pages for Moritz Wolf's apps";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [ "aarch64-darwin" "x86_64-darwin" "aarch64-linux" "x86_64-linux" ];
      forAll = f: nixpkgs.lib.genAttrs systems (s: f nixpkgs.legacyPackages.${s});
    in {
      devShells = forAll (pkgs: {
        default = pkgs.mkShell {
          packages = [
            pkgs.gh        # creating the repo and driving the Pages settings
            pkgs.git
            pkgs.python3   # `python3 -m http.server` for a local preview
          ];

          shellHook = ''
            echo "apps-website  |  gh $(gh --version | head -1 | cut -d' ' -f3)"
            gh auth status >/dev/null 2>&1 || echo "  not logged in yet — run: gh auth login"
            echo "  preview: python3 -m http.server 8000"
          '';
        };
      });
    };
}
