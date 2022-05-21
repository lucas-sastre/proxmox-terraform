terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

provider "proxmox" {
  pm_api_url          = "https://proxmox.selfhost.ar/api2/json"
  pm_api_token_id     = var.PM_API_TOKEN_ID
  pm_api_token_secret = var.PM_API_TOKEN_SECRET
}

module "proxmox-lxc" {
  source               = "./modules/lxc"
  arch                 = "amd64"
  bwlimit              = 0
  console              = true
  cores                = 5
  cpulimit             = 0
  cpuunits             = 1024
  force                = false
  hostname             = "prd-portainer-traefik"
  ignore_unpack_errors = false
  memory               = 10240
  onboot               = true
  ostype               = "ubuntu"
  protection           = false
  restore              = false
  searchdomain         = "1.1.1.1"
  swap                 = 512
  target_node          = "proxmox"
  template             = false
  tty                  = 2
  unique               = false
  unprivileged         = true
  start                = true
  cmode                = "tty"
  rootfs-storage       = ""
  rootfs-acl           = false
  rootfs-quota         = false
  rootfs-replicate     = false
  rootfs-ro            = false
  rootfs-shared        = false
  rootfs-size          = "300G"
}
