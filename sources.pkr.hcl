source "virtualbox-iso" "etcd3" {
  boot_command            = var.boot_command
  boot_wait               = var.boot_wait
  cpus                    = var.cpus
  disk_size               = var.disk_size
  guest_additions_path    = local.guest_additions_path
  guest_additions_url     = var.guest_additions_url
  guest_os_type           = var.guest_os_type
  hard_drive_interface    = var.hard_drive_interface
  headless                = var.headless
  http_directory          = local.http_directory
  iso_checksum            = var.iso_checksum
  iso_url                 = var.iso_url
  memory                  = var.memory
  output_directory        = local.output_directory
  shutdown_command        = var.shutdown_command
  ssh_password            = var.ssh_password
  ssh_port                = var.ssh_port
  ssh_timeout             = var.ssh_timeout
  ssh_username            = var.ssh_username
  virtualbox_version_file = var.virtualbox_version_file
}

source "virtualbox-iso" "vault" {
  boot_command            = var.boot_command
  boot_wait               = var.boot_wait
  cpus                    = var.cpus
  disk_size               = var.disk_size
  guest_additions_path    = local.guest_additions_path
  guest_additions_url     = var.guest_additions_url
  guest_os_type           = var.guest_os_type
  hard_drive_interface    = var.hard_drive_interface
  headless                = var.headless
  http_directory          = local.http_directory
  iso_checksum            = var.iso_checksum
  iso_url                 = var.iso_url
  memory                  = var.memory
  output_directory        = local.output_directory
  shutdown_command        = var.shutdown_command
  ssh_password            = var.ssh_password
  ssh_port                = var.ssh_port
  ssh_timeout             = var.ssh_timeout
  ssh_username            = var.ssh_username
  virtualbox_version_file = var.virtualbox_version_file
}

source "virtualbox-iso" "docker" {
  boot_command            = var.boot_command
  boot_wait               = var.boot_wait
  cpus                    = var.cpus
  disk_size               = var.disk_size
  guest_additions_path    = local.guest_additions_path
  guest_additions_url     = var.guest_additions_url
  guest_os_type           = var.guest_os_type
  hard_drive_interface    = var.hard_drive_interface
  headless                = var.headless
  http_directory          = local.http_directory
  iso_checksum            = var.iso_checksum
  iso_url                 = var.iso_url
  memory                  = var.memory
  output_directory        = local.output_directory
  shutdown_command        = var.shutdown_command
  ssh_password            = var.ssh_password
  ssh_port                = var.ssh_port
  ssh_timeout             = var.ssh_timeout
  ssh_username            = var.ssh_username
  virtualbox_version_file = var.virtualbox_version_file
}

source "virtualbox-iso" "ubuntu" {
  boot_command            = var.boot_command
  boot_wait               = var.boot_wait
  cpus                    = var.cpus
  disk_size               = var.disk_size
  guest_additions_path    = local.guest_additions_path
  guest_additions_url     = var.guest_additions_url
  guest_os_type           = var.guest_os_type
  hard_drive_interface    = var.hard_drive_interface
  headless                = var.headless
  http_directory          = local.http_directory
  iso_checksum            = var.iso_checksum
  iso_url                 = var.iso_url
  memory                  = var.memory
  output_directory        = local.output_directory
  shutdown_command        = var.shutdown_command
  ssh_password            = var.ssh_password
  ssh_port                = var.ssh_port
  ssh_timeout             = var.ssh_timeout
  ssh_username            = var.ssh_username
  virtualbox_version_file = var.virtualbox_version_file
}

source "virtualbox-iso" "postgresql" {
  boot_command            = var.boot_command
  boot_wait               = var.boot_wait
  cpus                    = var.cpus
  disk_size               = var.disk_size
  guest_additions_path    = local.guest_additions_path
  guest_additions_url     = var.guest_additions_url
  guest_os_type           = var.guest_os_type
  hard_drive_interface    = var.hard_drive_interface
  headless                = var.headless
  http_directory          = local.http_directory
  iso_checksum            = var.iso_checksum
  iso_url                 = var.iso_url
  memory                  = var.memory
  output_directory        = local.output_directory
  shutdown_command        = var.shutdown_command
  ssh_password            = var.ssh_password
  ssh_port                = var.ssh_port
  ssh_timeout             = var.ssh_timeout
  ssh_username            = var.ssh_username
  virtualbox_version_file = var.virtualbox_version_file
}
