{
  inputs.dream2nix.url = "github:nix-community/dream2nix";

  outputs = inp:
    inp.dream2nix.lib.makeFlakeOutputs {
      systems = ["x86_64-linux"];
      config.projectRoot = ./.;
      source = ./.;
      projects = {
          "dream2nix-node-example" = {
            name = "dream2nix-node-example";
            subsystem = "nodejs";
            translator = "package-lock";
            builder = "strict-builder";
            subsystemInfo = {
              nodejs = 18;
            };
          };
      };
    };
}
