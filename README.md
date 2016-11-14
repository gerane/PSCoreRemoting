# PSCoreRemoting Module


## Background
When writing this module I was working on a lab for a workshop where I was using Linux to PSRemote to Windows. I encountered issues caused by a bug that required a large amount of trial and error to find a working configuration. This module was quickly written to make this process faster. I decided to share for any of those who might want to quickly set this up. This might become obsolete once the winrm variant of remoting cross platform becomes more available.


## Helper Script
The module comes with a helper script to help quickly run through the install and uninstall processes. It includes switches to quickly invoke the commands in the module in a single command. I was using this script to quickly try different configurations. I might eventually add this to the actual module. 


## Examples of Helper Script Usage
Installs Latest Version of PSCore and OpenSSH and configures OpenSSH and adds it to the Path.

```powershell
.\Setup-PSCoreRemoting.ps1 -InstallPSCore -InstallOpenSSH -UpdateOpenSSHConfig -AddOpenSSHToPath
```

Installs Version 6.0.0.10 of PSCore and 0.0.1.0 of OpenSSH and configures OpenSSH.

```powershell
.\Setup-PSCoreRemoting.ps1 -InstallPSCore -PSCoreVersion '6.0.0.10' -InstallOpenSSH -OpenSSHVersion '0.0.1.0' -UpdateOpenSSHConfig
```

Uninstalls PSCore and OpenSSH and Reboots when finished.

```powershell
.\Setup-PSCoreRemoting.ps1 -UninstallPSCore -UninstallOpenSSH -Reboot
```

## License

[MIT](LICENSE)


## Notes


