{ config, lib, ... }:

{
  "org".source = config.lib.file.mkOutOfStoreSymlink "/home/crumb/Dropbox/org";

  ".password-store".source =
    config.lib.file.mkOutOfStoreSymlink
      "/home/crumb/dots/users/crumb/files/password-store/.password-store";
}
