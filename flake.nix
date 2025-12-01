{
  inputs = {
    # This is pointing to an unstable release.
    # If you prefer a stable release instead, you can this to the latest number shown here: https://nixos.org/download
    # i.e. nixos-24.11
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";
    lazyvim.url = "github:pfassina/lazyvim-nix";
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, lazyvim, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosModules.udevRule = import ./udev.nix;
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem rec {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        ./chinese.nix
        self.nixosModules.udevRule
        inputs.distro-grub-themes.nixosModules.${system}.default
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.admin = {
            imports = [
              lazyvim.homeManagerModules.default
              inputs.noctalia.homeModules.default
              ./noctalia.nix
              ./home.nix
            ];
          };
          home-manager.backupFileExtension = ".bak";
        }
      ];
    };
  };
}

