{
  description = "localhost configurations";

  inputs = {
    # Pin our primary nixpkgs repository. This is the main nixpkgs repository
    # we'll use for our configurations. Be very careful changing this because
    # it'll impact your entire system.
    nixpkgs.url = "github:nixos/nixpkgs/release-22.11";

    # We use the unstable nixpkgs repo for some packages.
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";

      # We want home-manager to use the same set of nixpkgs as our system.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations =
      let

        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};

        homeFeatures = [
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit system inputs; };
            home-manager.users.wilson = {
              imports = [
                ./home/default.nix
                ./modules/home-manager/default.nix
              ];
              home.stateVersion = "21.11";
            };
          }
        ];
      in
      {

        home-pc = nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = inputs;
          modules = [
            # system config
            ./location.nix
            ./config/home-pc/default.nix
            ./modules/system/default.nix
          ] ++ homeFeatures;
        };
      };
  };
}
