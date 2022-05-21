terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}
resource "proxmox_lxc" "prd-portainer-lxc" {
  arch                 = var.arch
  bwlimit              = var.bwlimit
  console              = var.console
  cores                = var.cores
  cpulimit             = var.cpulimit
  cpuunits             = var.cpuunits
  force                = var.force
  hostname             = var.hostname
  ignore_unpack_errors = var.ignore_unpack_errors
  memory               = var.memory
  onboot               = var.onboot
  ostype               = var.ostype
  protection           = var.protection
  restore              = var.restore
  searchdomain         = var.searchdomain
  swap                 = var.swap
  target_node          = var.target_node
  template             = var.template
  tty                  = var.tty
  unique               = var.unique
  unprivileged         = var.unprivileged
  start                = var.start
  cmode                = var.cmode

  rootfs {
    storage   = var.rootfs-storage
    acl       = var.rootfs-acl
    quota     = var.rootfs-quota
    replicate = var.rootfs-replicate
    ro        = var.rootfs-ro
    shared    = var.rootfs-shared
    size      = var.rootfs-size
  }

  timeouts {}
}