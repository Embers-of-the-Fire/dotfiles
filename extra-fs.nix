{ ... }:

{
  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/308E-5E6E";
      fsType = "vfat";
    };
  fileSystems."/mnt/win/c" =
    { device = "/dev/disk/by-uuid/7E32BB6132BB1D59";
      fsType = "ntfs";
    };
  fileSystems."/mnt/win/d" =
    { device = "/dev/disk/by-uuid/283201F63201CA30";
      fsType = "ntfs";
    };
  # External storage
  fileSystems."/mnt/hdd/a" =
    { device = "/dev/disk/by-uuid/424CE518EB6F8A81";
      fsType = "ntfs";
    };
  fileSystems."/mnt/hdd/b" =
    { device = "/dev/disk/by-uuid/77ED61283161D87F";
      fsType = "ntfs";
    };
}
