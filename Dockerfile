FROM mcr.microsoft.com/windows/servercore:ltsc2019

USER ContainerAdministrator
RUN mkdir "c:/temp"
RUN powershell "cd /temp"
RUN powershell Invoke-WebRequest -Uri 'http://download.microsoft.com/download/9/5/A/95A9616B-7A37-4AF6-BC36-D6EA96C8DAAE/dotNetFx40_Full_x86_x64.exe' -OutFile 'c:/temp/dotNetFx40_Full_x86_x64.exe'
#RUN powershell "((new-object net.webclient).DownloadFile('http://download.microsoft.com/download/9/5/A/95A9616B-7A37-4AF6-BC36-D6EA96C8DAAE/dotNetFx40_Full_x86_x64.exe','dotNetFx40_Full_x86_x64.exe'))"
RUN powershell "c:/temp/dotNetFx40_Full_x86_x64.exe /q"
RUN powershell "Set-ExecutionPolicy Bypass -Scope Process -Force; \
  [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Tls,Tls11,Tls12'; \
  iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));"
RUN powershell "choco install com0com -y"


RUN powershell "Set-ExecutionPolicy Bypass -Scope Process -Force; \
  [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Tls,Tls11,Tls12'; \
  iex ((New-Object System.Net.WebClient).DownloadString('https://dot.net/v1/dotnet-install.ps1'));"
RUN powershell "$new=$ENV:PATH;'C:\Program Files (x86)\com0com;C:\Users\ContainerAdministrator\AppData\Local\Microsoft\dotnet\'"
RUN setx path "%PATH%;C:\Program Files (x86)\com0com;C:\Users\ContainerAdministrator\AppData\Local\Microsoft\dotnet\"