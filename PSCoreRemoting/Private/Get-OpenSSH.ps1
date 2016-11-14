function Get-OpenSSH
{
    [Cmdletbinding()]
    param
    (
        [parameter(Mandatory=$false)]
        [Version]$Version
    )

    Begin
    {
        switch ($env:PROCESSOR_ARCHITECTURE)
        {
            'AMD64' { $Architecture = 'Win64' }
            'x86' { $Architecture = 'Win32' }
        }
    }

    Process
    {    
        Try
        {    
            if ($Version)
            {
                Write-Verbose -Message "Determine $($Version) OpenSSH Uri"            
                $Rest = Invoke-RestMethod 'https://api.github.com/repos/PowerShell/Win32-OpenSSH/releases'
                [string]$Uri = $Rest.assets.browser_download_url | Where-Object { $_ -match "$Version\/OpenSSH\-$($Architecture)\.zip$" }

                if (! $Uri)
                {
                    Throw "Could not find OpenSSH Version: $($Version)"
                }

                Write-Verbose -Message "Downloading $($Version) OpenSSH Archive"
            }
            else
            {
                Write-Verbose -Message "Determine Latest OpenSSH Uri"            
                $Rest = Invoke-RestMethod 'https://api.github.com/repos/PowerShell/Win32-OpenSSH/releases/latest'
                [string]$Uri = $Rest.assets.browser_download_url | Where-Object { $_ -match $Architecture }

                Write-Verbose -Message "Downloading latest OpenSSH Archive"
            }

            Invoke-WebRequest -Uri $uri -OutFile "$Env:TEMP\OpenSSH.zip"

            Write-Verbose -Message "Extracting OpenSSH Archive"
            Expand-Archive -Path "$Env:TEMP\OpenSSH.zip" -DestinationPath "$Env:TEMP\OpenSSH" -Force

            if (! (Test-Path "$Env:ProgramFiles\OpenSSH" -PathType Container)) { New-Item -Path "$Env:ProgramFiles\OpenSSH" -ItemType Directory }

            Write-Verbose -Message "Copying OpenSSH to Program Files"
            Copy-Item -Path "$Env:TEMP\OpenSSH\OpenSSH-$($Architecture)\*" -Destination "$Env:ProgramFiles\OpenSSH"    
        }
        Catch
        {
            throw
        } 
    }
}