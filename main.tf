terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://proxmox.selfhost.ar/api2/json"
}

resource "proxmox_lxc" "prd-portainer-traefik" {
  target_node  = "proxmox"
  hostname     = "prd-portainer-traefik"
  searchdomain = "1.1.1.1"
  cores        = 5
  memory       = 10240
  onboot       = true
  swap         = 512
  unprivileged = true
  rootfs {
    storage   = ""
    acl       = false
    quota     = false
    replicate = false
    ro        = false
    shared    = false
    size      = "300G"
  }
}