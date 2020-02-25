# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "eurydices";
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp61s0.useDHCP = true;
  networking.interfaces.enp0s20f0u2.useDHCP = true;

  virtualisation.virtualbox.host.enable = true;

  # Set your time zone.
  time.timeZone = "America/St_Johns";

  # Set zsh as shell 
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
     # dev tools
     vim
     python3
     vagrant
     vscode
     go
     hugo
    
     # games 
     minecraft
     xonotic
     lutris
     ezquake
     steam


     # apps
     firefox
     slack
     discord
     spotify
     alacritty
     weechat
     gimp
    
     # cli tools 
     zsh
     stow
     oh-my-zsh
     wget
     fd
     bat
     jq
     ripgrep-all
     lsd
     xclip
     _1password
     ansible
     git
     ranger
     tmux

     # misc.
     gnome3.gnome-tweaks
     gnome3.gnome-tweak-tool
     jre
     wine
     unzip
  ];

  nixpkgs.config = {
    allowUnfree = true; # I couldn't get it to only allow specific packages :(
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Steam support:
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  hardware.pulseaudio.support32Bit = true;


  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";

  # Enable Gnome 3
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = false;
  services.xserver.desktopManager.gnome3.enable = true;

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.joshua = {
    isNormalUser = true;
    home = "/home/joshua";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "docker" "vboxusers"]; # Enable ‘sudo’ for the user.
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}

