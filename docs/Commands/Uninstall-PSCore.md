---
external help file: PSCoreRemoting-help.xml
online version: 
schema: 2.0.0
---

# Uninstall-PSCore

## SYNOPSIS
Uninstalls PowerShell Core.

## SYNTAX

```
Uninstall-PSCore [-Reboot] [<CommonParameters>]
```

## DESCRIPTION
Uninstalls PowerShell Core. Has option to reboot if needing to Install a different Version.

## EXAMPLES

### Example 1
```
PS C:\> Uninstall-PSCore
```

Uninstalls PowerShell Core.

### Example 2
```
PS C:\> Uninstall-PSCore -Reboot
```

Uninstalls PowerShell Core and Reboots when finished.

## PARAMETERS

### -Reboot
Switch to Reboot when finished.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
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

