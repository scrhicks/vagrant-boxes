build {
  sources = [
    "sources.virtualbox-iso.etcd3",
    "sources.virtualbox-iso.vault",
    "sources.virtualbox-iso.docker",
    "sources.virtualbox-iso.ubuntu",
    "sources.virtualbox-iso.postgresql"
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
      "TMP_FILE_DIR=/tmp/${source.name}"
    ]
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash -eux '{{.Path}}'"
    scripts = [
      "${local.script_directory}/sshd.sh",
      "${local.script_directory}/networking.sh",
      "${local.script_directory}/sudoers.sh",
      "${local.script_directory}/vagrant.sh",
      "${local.script_directory}/virtualbox.sh"
    ]
  }

  provisioner "shell" {
    environment_vars = [
      "HOME_DIR=/home/vagrant",
      "TMP_FILE_DIR=/tmp/${source.name}",
      "ETCD_VERSION=v3.4.16",
      "VAULT_VERSION=1.7.2",
      "VAULT_KEY_SHARES=1",
      "VAULT_kEY_THRESHOLD=1",
      "PG_VERSION=11"
    ]
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash -eux '{{.Path}}'"
    scripts = [
      "${local.script_directory}/${source.name}.sh"
    ]
    only = [
      "virtualbox-iso.etcd3", 
      "virtualbox-iso.vault",
      "virtualbox-iso.docker",
      "virtualbox-iso.postgresql"
    ]
  }

  provisioner "shell" {
    environment_vars = [
      "HOME_DIR=/home/vagrant",
      "TMP_FILE_DIR=/tmp/${source.name}"
    ]
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash -eux '{{.Path}}'"
    scripts = [
      "${local.script_directory}/cleanup.sh",
      "${local.script_directory}/minimize.sh"
    ]
  }

  post-processor "vagrant" {
    output = "${local.build_directory}/${source.type}/${source.name}.box"
  }
}