{
    description = "ConsistenType flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs, ... }:
    let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    in
    {
        devShells.${system}.default = pkgs.mkShell {
            packages = [
                pkgs.jdk21_headless
                pkgs.maven
            ];
            shellHook = ''
                source ~/.bashrc
                export PS1="\[$(tput setaf 1)\](nix-shell)\[$(tput sgr0)\] $PS1"
                cd ..
                tput setaf 2
                echo "Happy hacking!"
                tput sgr0
            '';
        };
    };
}
