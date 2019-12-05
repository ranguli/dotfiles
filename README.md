# NixOS
My dotfiles, scripts and downstream forks + patches.

## Install

For the first run of the NixOS config, run the following:
```sudo nixos-rebuild switch -I nixos-config=/path/to/dotfiles/nixos/configuration.nix```

Because the nix path is defined in the configuration file, you should only have to run the above command for the first time. After that you can just run:

```sudo nixos-rebuild switch```
