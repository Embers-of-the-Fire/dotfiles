{ environment, lib, ... }:

{
  environment = {
    etc = {
      "systemd/journald.conf".source = lib.mkForce ./systemd/journald.conf;
    };
  };
}

