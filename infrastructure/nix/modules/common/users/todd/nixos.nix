{ config, ... }:
let
  ifGroupsExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.users.todd = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [
      "wheel"
    ] ++ ifGroupsExist [
      "network"
      "samba-users"
    ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILt+39KiHG0k5C4u/r+SZp14QZjzJGYwMxh+swzjZUEW personal"
    ];
  };
}
