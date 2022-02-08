# COM0COM Docker with Windows Container

To run without build:
```
docker run -ti --rm masonchase/com0com-windows
```

To build:
```
docker build -t com0com-windows .
```

To run after build:
```
docker run -ti --rm com0com-windows .
```


## Docker for Windows Server

If you are running on Windows Server 2019/2022 you probably already have Docker CLI which can only support windows container.

Install Docker CLI with Windows Container support in Windows Server 2019/2022
```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
Start-Service Docker

Install-Module DockerProvider
Install-Package Docker -ProviderName DockerProvider -RequiredVersion preview

Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
```

## Docker Desktop

You can switch your docker desktop with:
```bash
# Switch to linux
dockercli -SwitchLinuxEngine

# Switch to Windows
dockercli -SwitchWindowsEngine
```

Note: If you don't have DockerCLI , you can add path `C:\Program Files\Docker\Docker` to your system path and then you can use dockercli from any path.
