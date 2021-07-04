locals {
    build_directory  = "${path.root}/builds"
    http_directory   = "${path.root}/http"
    script_directory = "${path.root}/scripts"
    files_directory  = "${path.root}/files"
    docs_directory   = "${path.root}/docs"

    output_directory = "${local.build_directory}/${uuidv4()}"
    guest_additions_path = "VBoxGuestAdditions_{{.Version}}.iso"
}

variable boot_command {
    default = [
        "<esc><wait>",
        "<esc><wait>",
        "<enter><wait>",
        "/install/vmlinuz<wait>",
        " auto<wait>",
        " console-setup/ask_detect=false<wait>",
        " console-setup/layoutcode=us<wait>",
        " console-setup/modelcode=pc105<wait>",
        " debconf/frontend=noninteractive<wait>",
        " debian-installer=en_US.UTF-8<wait>",
        " fb=false<wait>",
        " initrd=/install/initrd.gz<wait>",
        " kbd-chooser/method=us<wait>",
        " keyboard-configuration/layout=USA<wait>",
        " keyboard-configuration/variant=USA<wait>",
        " locale=en_US.UTF-8<wait>",
        " netcfg/get_domain=vm<wait>",
        " netcfg/get_hostname=vagrant<wait>",
        " grub-installer/bootdev=/dev/sda<wait>",
        " noapic<wait>",
        " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg<wait>",
        " -- <wait>",
        "<enter><wait>"
    ]
    description = "This is an array of commands to type when the virtual machine is first booted. The goal of these commands should be to type just enough to initialize the operating system installer. Special keys can be typed as well, and are covered in the section below on the boot command. If this is not specified, it is assumed the installer will start itself."
    type        = list(string)
}

variable boot_wait {
    default     = "5s"
    description = "The time to wait after booting the initial virtual machine before typing the boot_command. The value of this should be a duration. Examples are 5s and 1m30s which will cause Packer to wait five seconds and one minute 30 seconds, respectively."
    type        = string
}

variable cpus {
    default     = 1
    description = "The number of cpus to use for building the VM. Defaults to 1."
    type        = number
}

variable disk_size {
    default     = 40960
    description = "The size, in megabytes, of the hard disk to create for the VM. By default, this is 40960"
    type        = number
}

variable guest_additions_url {
    default     = ""
    description = "The URL of the guest additions ISO to upload. This can also be a file URL if the ISO is at a local path. By default, the VirtualBox builder will attempt to find the guest additions ISO on the local file system. If it is not available locally, the builder will download the proper guest additions ISO from the internet."
    type        = string
}

variable guest_os_type {
    default     = "Ubuntu_64"
    description = "The guest OS type being installed. By default this is other, but you can get dramatic performance improvements by setting this to the proper value. To view all available values for this run VBoxManage list ostypes. Setting the correct value hints to VirtualBox how to optimize the virtual hardware to work best with that operating system."
    type        = string
}

variable hard_drive_interface {
    default     = "sata"
    description = "The type of controller that the primary hard drive is attached to, defaults to ide. When set to sata, the drive is attached to an AHCI SATA controller. When set to scsi, the drive is attached to an LsiLogic SCSI controller. When set to pcie, the drive is attached to an NVMe controller. When set to virtio, the drive is attached to a VirtIO controller."
    type        = string
}

variable headless {
    default     = true
    description = "Packer defaults to building VirtualBox virtual machines by launching a GUI that shows the console of the machine being built. When this value is set to true, the machine will start without a console."
    type        = bool
}

variable iso_checksum {
    default     = "f11bda2f2caed8f420802b59f382c25160b114ccc665dbac9c5046e7fceaced2"
    description = "The checksum for the ISO file or virtual hard drive file."
    type        = string
}

variable iso_url {
    default     = "http://cdimage.ubuntu.com/ubuntu-legacy-server/releases/20.04.1/release/ubuntu-20.04.1-legacy-server-amd64.iso"
    description = "A URL to the ISO containing the installation image or virtual hard drive (VHD or VHDX) file to clone."
    type        = string
}

variable memory {
    default     = 1024
    description = "The amount of memory to use for building the VM in megabytes. Defaults to 1024 megabytes."
    type        = number
}

variable preseed_path {
    type    = string
    default = "preseed.cfg"
}

variable shutdown_command {
    default     = "echo 'vagrant' | sudo -S shutdown -P now"
    description = " The command to use to gracefully shut down the machine once all the provisioning is done. By default this is an empty string, which tells Packer to just forcefully shut down the machine unless a shutdown command takes place inside script so this may safely be omitted. If one or more scripts require a reboot it is suggested to leave this blank since reboots may fail and specify the final shutdown command in your last script."
    type        = string
}

variable ssh_password {
    default     = "vagrant"
    description = "A plaintext password to use to authenticate with SSH."
    type        = string
}

variable ssh_port {
    default     = 22
    description = "The port to connect to SSH. This defaults to 22."
    type        = number
}

variable ssh_timeout {
    default     = "3h"
    description = "The time to wait for SSH to become available. Packer uses this to determine when the machine has booted so this is usually quite long."
    type        = string
}

variable ssh_username {
    default     = "vagrant"
    description = "The username to connect to SSH with."
    type        = string
}

variable virtualbox_version_file {
    default     = ".vbox_version"
    description = "The path within the virtual machine to upload a file that contains the VirtualBox version that was used to create the machine. This information can be useful for provisioning. By default this is .vbox_version, which will generally be upload it into the home directory. Set to an empty string to skip uploading this file, which can be useful when using the none communicator."
    type        = string
}
