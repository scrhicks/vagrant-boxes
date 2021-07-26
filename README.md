# vagrant-boxes
This repository contains packer temapltes to build vagrant box

## Build images

### Docker
```powershell
packer build -only virtualbox-iso.docker .
```

### Ubuntu
```powershell
packer build -only virtualbox-iso.ubuntu .
```

### Postgresql
```powershell
packer build -only virtualbox-iso.postgresql .
```

## Calculate SHA256 hash

### Docker
```powershell
Get-FileHash ./builds/virtualbox-iso/docker.box | Format-List
```

### Ubuntu
```powershell
Get-FileHash ./builds/virtualbox-iso/ubuntu.box | Format-List
```

### Postgresql
```powershell
Get-FileHash ./builds/virtualbox-iso/postgresql.box | Format-List
```

