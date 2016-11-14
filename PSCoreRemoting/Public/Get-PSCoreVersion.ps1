function Get-PSCoreVersion
{
    [Cmdletbinding()]
    [OutputType([String])]
    param()

    Process
    {
        if (Test-Path "$Env:ProgramFiles\PowerShell")
        {
            $Version = Get-ChildItem -Path "$Env:ProgramFiles\PowerShell" | Sort-Object -Descending -Property Name | Select-Object -ExpandProperty Name -First 1
        }
        else
        {
            Write-Warning "Could not find PowerShell Core Installation"
        }

        Return $Version
    }
}