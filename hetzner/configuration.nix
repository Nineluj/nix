{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./disko-config.nix
    ];

  boot.loader.grub.enable = true;

  services.openssh.enable = true;

  users.users.tux = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialHashedPassword = "!";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIxQaBOXiar9B3353og93iRG3BtWcv7JZOgSCORPc2B/"
    ]
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    configure = {
      customRC = ''
        colorscheme habamax
      '';

      packages.packages = {
        start = [
          pkgs.vimPlugins.nerdtree
        ];
      };
    };
  };

  system.stateVersion = "24.11";
}
