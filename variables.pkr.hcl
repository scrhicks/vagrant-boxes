locals {
    build_directory = "${path.root}/build"
    http_directory = "${path.root}/http"
    script_directory = "${path.root}/scripts"
    files_directory = "${path.root}/files"
}

variable cpus {
    type    = number
    default = 1
}

variable disk_size {
    type    = number
    default = 40960
}

variable headless {
    type    = bool
    default = true
}

variable iso_checksum {
    type    = string
    default = "f11bda2f2caed8f420802b59f382c25160b114ccc665dbac9c5046e7fceaced2"
}

variable iso_url {
    type    = string
    default = "http://cdimage.ubuntu.com/ubuntu-legacy-server/releases/20.04.1/release/ubuntu-20.04.1-legacy-server-amd64.iso"
}

variable memory {
    type    = number
    default = 1024
}

variable preseed_path {
    type    = string
    default = "preseed.cfg"
}
