# modules/services/gitea.nix
{ ... }:

{
  services.gitea = {
    enable = true;
    stateDir = /gitea;

    dump = {
      enable = true;
      # interval =
      file = "gitea-dump";
      backupDir = /backup/gitea;
    };

  

  };
}
