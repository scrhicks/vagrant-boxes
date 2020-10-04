build {
  sources = [
    "sources.virtualbox-iso.etcd3",
    "sources.virtualbox-iso.vault",
    "sources.virtualbox-iso.docker"
  ]

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash -eux '{{.Path}}'"
    expect_disconnect = true
    scripts = [
      "${local.script_directory}/update.sh"
    ]
  }

  provisioner "file" {
    source      = "${local.files_directory}/${source.name}"
    destination = "/tmp"
    only = [
      "virtualbox-iso.etcd3", 
      "virtualbox-iso.vault"
    ]
  }

  provisioner "shell" {
    environment_vars = [
      "HOME_DIR=/home/vagrant",
      "TMP_FILE_DIR=/tmp/${source.name}",
      "ETCD_VERSION=v3.4.13",
      "VAULT_VERSION=1.5.4",
      "VAULT_KEY_SHARES=1",
      "VAULT_kEY_THRESHOLD=1"
    ]
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash -eux '{{.Path}}'"
    scripts = [
      "${local.script_directory}/sshd.sh",
      "${local.script_directory}/networking.sh",
      "${local.script_directory}/sudoers.sh",
      "${local.script_directory}/vagrant.sh",
      "${local.script_directory}/virtualbox.sh",
      "${local.script_directory}/${source.name}.sh",
      "${local.script_directory}/cleanup.sh",
      "${local.script_directory}/minimize.sh"
    ]
  }

  post-processor "vagrant" {
    output = "${local.build_directory}/${source.type}/${source.name}.box"
  }
}