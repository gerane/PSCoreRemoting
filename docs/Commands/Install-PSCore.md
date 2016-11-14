---
external help file: PSCoreRemoting-help.xml
online version: 
schema: 2.0.0
---

# Install-PSCore

## SYNOPSIS
Installs PowerShell Core from the PowerShell Github Releases.

## SYNTAX

```
Install-PSCore [[-Version] <Version>] [<CommonParameters>]
```

## DESCRIPTION
Installs PowerShell Core from the PowerShell Github Releases. By Default Installs the Latest Release.

## EXAMPLES

### Example 1
```
PS C:\> Install-PSCore
```

Installs the Latest Version of PSCore.

### Example 2
```
PS C:\> Install-PSCore -Version '6.0.0.11'
```

Installs PowerShell Core Version 6.0.0.11.

## PARAMETERS

### -Version
Version of PowerShell Core to Install

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

