function Uninstall-PSCore
{
    [Cmdletbinding()]
    param
    (
        [switch]$Reboot
    )

    Process
    {
        Try
        {
            Write-Verbose -Message "Find Installed PS Core Packages"
            $PSCore = Get-Package -ProviderName msi | Where-Object { $_.Name -match "^powershell_(\d+\.){3}\d+$" }

            if (!$PSCore)
            {
                Throw "Could not find Installed PSCore Msi Package"
            }

            Write-Verbose -Message "Uninstalling PSCore MSI Packages: $($PSCore.Name | Out-String)"
            $PSCore | Uninstall-Package -Force

            Start-Sleep -Seconds 5

            Write-Verbose -Message "Removing PowerShell Directory"
            Remove-Item -Path "$Env:ProgramFiles\PowerShell" -Recurse -Force

            if ($Reboot)
            {
                Start-Sleep -Seconds 2

                Write-Verbose -Message "Restarting Computer"
                Restart-Computer
            }
        }
        catch
        {
            Throw
        }
    }
}