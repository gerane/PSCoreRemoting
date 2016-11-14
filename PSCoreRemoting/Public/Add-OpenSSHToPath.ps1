function Add-OpenSSHToPath
{
    [Cmdletbinding()]    
    param()

    Process
    {    
        Try
        {
            $OldPath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name Path).Path

            If (! ($Env:PATH | Select-String -SimpleMatch "$Env:ProgramFiles\OpenSSH\"))
            { 
                Write-Verbose -Message 'Adding OpenSSH to Path'
                $NewPath = $OldPath + ';' + "$Env:ProgramFiles\OpenSSH\"
                Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name Path -Value $NewPath      
            }
            else
            {
                Write-Verbose -Message 'OpenSSH is already in Path'
            }
        }
        catch
        {
            Throw
        }
    }
}