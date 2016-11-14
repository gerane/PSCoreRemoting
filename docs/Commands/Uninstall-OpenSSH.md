---
external help file: PSCoreRemoting-help.xml
online version: 
schema: 2.0.0
---

# Uninstall-OpenSSH

## SYNOPSIS
Uninstalls OpenSSH

## SYNTAX

```
Uninstall-OpenSSH [-Reboot] [<CommonParameters>]
```

## DESCRIPTION
Uninstalls OpenSSH and gives option to reboot if installing a different version.

## EXAMPLES

### Example 1
```
PS C:\> Uninstall-OpenSSH
```

Uninstalls OpenSSH.

### Example 2
```
PS C:\> Uninstall-OpenSSH -Reboot
```

Uninstalls OpenSSH and Reboots when finished.

## PARAMETERS

### -Reboot
Switch to Reboot the computer.

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

