{
  virtualisation = {
    docker = {
      enable = true;
      #   storageDriver = "btrfs";
      rootless = {
        enable = false;
        setSocketVariable = true;
      };
    };
  };

  users.users.sevos.extraGroups = [ "docker" ];
  users.users.zencargo.extraGroups = [ "docker" ];
}
