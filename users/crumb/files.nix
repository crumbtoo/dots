{ config, lib, ... }:

{
  "org".source = config.lib.file.mkOutOfStoreSymlink "/home/crumb/Dropbox/org";
}
