---
external help file: PSCoreRemoting-help.xml
online version: 
schema: 2.0.0
---

# Install-OpenSSH

## SYNOPSIS
Installs OpenSSH from the PowerShell Github Releases.

## SYNTAX

```
Install-OpenSSH [[-Version] <Version>] [<CommonParameters>]
```

## DESCRIPTION
Installs OpenSSH from the PowerShell Github Releases. By default installs the latest Version.

## EXAMPLES

### Example 1
```
PS C:\> Install-OpenSSH
```

Installs the Latest Version of OpenSSH.

### Example 2
```
PS C:\> Install-OpenSSH -Version '0.0.1.0'
```

Installs OpenSSH Version 0.0.1.0.

## PARAMETERS

### -Version
Version of OpenSSH

```yaml
Type: Version
Parameter Sets: (All)
Aliases: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### None

## NOTES

## RELATED LINKS

