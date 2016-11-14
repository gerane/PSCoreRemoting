function Update-OpenSSHConfig
{
    [Cmdletbinding()]
    param()

    Process
    {
        Try
        {
            Push-Location -Path "$Env:ProgramFiles\OpenSSH"
            
            $PSCoreVersion = Get-PSCoreVersion            
            $Config = Get-Content .\sshd_config

            $Config | ForEach-Object {
                If ($_ -match '#PasswordAuthentication yes')
                {
                    Write-Verbose -Message 'Enable Password Auth'
                    'PasswordAuthentication yes'
                }
                elseif ($_ -match '#RSAAuthentication yes') 
                {
                    Write-Verbose -Message 'Enable RSA Auth'
                    'RSAAuthentication yes'
                }
                elseif ($_ -match '#PubkeyAuthentication yes') 
                {
                    Write-Verbose -Message 'Enable Public Key Auth'
                    'PubkeyAuthentication yes'
                }
                else 
                {
                    # Output unaltered lines                
                    $_    
                }

                if ($_ -match 'Subsystem	sftp	C:/Program Files/OpenSSH/sftp-server.exe')
                {
                    Write-Verbose -Message 'Insert PowerShell Subsystem value'
                    "Subsystem powershell C:/Program Files/PowerShell/$($PSCoreVersion)/powershell.exe -sshs -NoLogo -NoProfile"                    
                }
            } | Out-File -FilePath .\sshd_config -Encoding ascii

            Write-Verbose -Message 'Restarting sshd Service'
            Restart-Service sshd

            Pop-Location
        }
        catch
        {
            throw
        }
    }
}