function Uninstall-OpenSSH
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
            Push-Location -Path "$Env:ProgramFiles\OpenSSH"

            Write-Verbose -Message "Stopping sshd Service"
            Stop-Service sshd
            
            Write-Verbose -Message "Uninstalling sshd"
            powershell.exe -executionpolicy bypass -file uninstall-sshd.ps1

            Write-Verbose -Message "Uninstalling sshlsa"
            powershell.exe -executionpolicy bypass -file uninstall-sshlsa.ps1

            Start-Sleep -Seconds 5

            Write-Verbose -Message "Removing OpenSSH Directory"
            Remove-Item -Path "$Env:ProgramFiles\OpenSSH" -Recurse -Force
            
            If ($Reboot)
            {
                Start-Sleep -Seconds 2

                Write-Verbose -Message "Restarting Computer"
                Restart-Computer
            }

            Pop-Location
        }
        catch
        {
            Throw
        }
    }
}