function Install-PSCore
{
    [Cmdletbinding()]
    param
    (
        [parameter(Mandatory=$false)]
        [Version]$Version
    )

    Begin
    {
        switch -Wildcard ((Get-CimInstance Win32_OperatingSystem).version)
        {
            '10*'   { $OS = 'Win10' }
            '6.3*'  { $OS = 'Win81' }
            default { $OS = 'Win10' }
        }
    }

    Process
    {    
        Try
        {    
            if ($Version)
            {
                Write-Verbose -Message "Determine $($Version) PSCore Uri"            
                $Rest = Invoke-RestMethod 'https://api.github.com/repos/PowerShell/PowerShell/releases'
                [string]$Uri = $Rest.assets.browser_download_url | Where-Object { $_ -match "$($Version)\-alpha\.\d+\-$($OS)\-x64\.msi$" }

                if (! $Uri)
                {
                    Throw "Could not find OpenSSH Version: $($Version)"
                }

                Write-Verbose -Message "Downloading $($Version) OpenSSH Archive"
            }
            else
            {
                Write-Verbose -Message "Determine Latest PSCore Uri"
                 
                $Rest = Invoke-RestMethod 'https://api.github.com/repos/PowerShell/PowerShell/releases/latest'
                [string]$Uri = $Rest.assets.browser_download_url | Where-Object { $_ -match "$OS.*msi$" }
            
                Write-Verbose -Message "Downloading latest PSCore MSI"
            }

            Invoke-WebRequest -Uri $uri -OutFile "$Env:TEMP\PSCore.msi"

            Write-Verbose -Message "Installting PSCore"
            Start-Process -FilePath msiexec.exe -ArgumentList "/i `"$Env:TEMP\PSCore.msi`" /quiet /norestart" -Wait            
        }
        Catch
        {
            throw
        } 
    }
}