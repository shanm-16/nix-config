# Edit this to install packages and modify dotfile configuration in your
# $HOME.
#
# https://nix-community.github.io/home-manager/index.html#sec-usage-configuration
{ pkgs, ... }: {
  imports = [
    # Add your other home-manager modules here.
  ];

  # Nix packages to install to $HOME
  #
  # Search for packages here: https://search.nixos.org/packages
  home.packages = with pkgs; [
    nix-output-monitor # https://github.com/maralorn/nix-output-monitor
    nix-info
  ];

  # Programs natively supported by home-manager.
  programs = {
    bash.enable = true;

    # For macOS's default shell.
    zsh = {

    shellAliases = {
        gl = "git pull";
        code-backend="code /Users/juspay/nammayatri/Backend";
        code-ny="code /Users/juspay/nammayatri/";
        code-kernel="code /Users/juspay/shared-kernel";
        code-custom="code ~/.oh-my-zsh/custom/";
        code-config="code /Users/juspay/nix-config";
        svc=", run-svc";
        qsvc="nix run .#arion -- up --remove-orphans -d";
        sac="nix run .#arion -- down --remove-orphans";
        pgadmin="nix run .#arion -- up --remove-orphans pg-admin";
        qpgadmin="nix run .#arion -- up --remove-orphans -d pg-admin";
        rms=", run-mobility-stack-dev";
        kill-server="sh /Users/juspay/.oh-my-zsh/custom/portkill.sh";
        gsta="git stash";
        gstaa="git stash apply";
        gb="git branch";
        gco="git checkout";
        gbc="git checkout -b";
        backend="cd /Users/juspay/nammayatri/Backend";
        kernel="cd /Users/juspay/shared-kernel";
        ny="cd /Users/juspay/nammayatri/";
        ".."="cd ..";
        server-cold-start="sh /Users/juspay/.oh-my-zsh/custom/server-start.sh";
        prune="git gc --prune=now";
      };
      enable = true;
      envExtra = ''
        # Make Nix and home-manager installed things available in PATH.
        export PATH=/run/current-system/sw/bin/:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
      '';
    };

    # https://haskell.flake.page/direnv
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    starship.enable = true;
  };
}
