{ config, pkgs, ... }:

{
  # Install lsyncd
  environment.systemPackages = [ pkgs.lsyncd ];

  # lsyncd configuration file
  environment.etc."lsyncd.conf.lua".text = ''
    settings {
      logfile = "/var/log/lsyncd.log",
      statusFile = "/var/log/lsyncd-status.log",
      statusInterval = 20,
      nodaemon = false,
    }

    sync {
      default.rsync,
      source = "/home/admin/",
      target = "/persistent/home/admin/",
      delay = 5,
      rsync = {
        binary = "${pkgs.rsync}/bin/rsync",
        archive = true,
        compress = false,
        _extra = {"--delete"}
      }
    }
  '';

  # Custom systemd service for lsyncd
  systemd.services.lsyncd = {
    description = "Live Syncing Daemon";
    wantedBy = [ "multi-user.target" ];
    after = [ "local-fs.target" "network.target" "restore-home.service" ];
    before = [ "home-manager-admin.service" ];
    path = [ pkgs.rsync pkgs.lsyncd ];
    serviceConfig = {
      Type = "forking";
      ExecStart = "${pkgs.lsyncd}/bin/lsyncd /etc/lsyncd.conf.lua";
      ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";
      Restart = "on-failure";
      RestartSec = "10s";
    };
  };

  # Create persistent directories
  systemd.tmpfiles.rules = [
    "d /persistent/home/admin 0755 admin users - -"
  ];

  # Restore files on boot from persistent storage
  systemd.services.restore-home = {
    description = "Restore home directory from persistent storage";
    wantedBy = [ "multi-user.target" ];
    before = [ "display-manager.service" "lsyncd.service" ];
    after = [ "local-fs.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      if [ -d /persistent/home/admin ]; then
        ${pkgs.rsync}/bin/rsync -a --ignore-existing /persistent/home/admin/ /home/admin/
        chown -R admin:users /home/admin
      fi
    '';
  };
}
