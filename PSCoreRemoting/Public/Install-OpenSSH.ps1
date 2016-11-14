function Install-OpenSSH
{
    [Cmdletbinding()]
    param
    (
        [parameter(Mandatory=$false)]
        [Version]$Version
    )

    Process
    {
        Try
        {
            if ($Version)
            {
                Write-Verbose -Message "Downloading $($Version) OpenSSH for Github"
                Get-OpenSSH -Version $Version
            }
            else
            {
                Write-Verbose -Message "Downloading latest OpenSSH for Github"
                Get-OpenSSH
            }

            Start-Sleep -Seconds 2

            Push-Location -Path "$Env:ProgramFiles\OpenSSH"         
            
            powershell -executionpolicy bypass -file install-sshd.ps1

            .\ssh-keygen.exe -A

            Write-Verbose -Message "Create Firewall Rule for Inbound SSH"
            New-NetFirewallRule -Protocol TCP -LocalPort 22 -Direction Inbound -Action Allow -DisplayName SSH

            Write-Verbose -Message "Set sshd Service to Automatic"
            Set-Service sshd -StartupType Automatic

            Write-Verbose -Message "Set ssh-agent Service to Automatic"
            Set-Service ssh-agent -StartupType Automatic

            Write-Verbose -Message "Set firewall Rule for Workstations"
            netsh advfirewall firewall add rule name='SSH Port' dir=in action=allow protocol=TCP localport=22

            Pop-Location
        }
        catch
        {
            throw
        }
    }
}