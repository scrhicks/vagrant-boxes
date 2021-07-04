# vagrant-boxes
This repository contains packer temapltes to build vagrant box

Calculate Docker SHA256 file hash
```powershell
Get-FileHash \builds\virtualbox-iso\docker.box | Format-List
```

Calculate Ubuntu SHA256 file hash
```powershell
Get-FileHash .\builds\virtualbox-iso\ubuntu.box | Format-List
```