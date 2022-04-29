 <#
 .SYNOPSIS
    
 .DESCRIPTION 
    
 .PARAMETER PLACEHOLDER
 
 .PARAMETER PLACEHOLDER
 
 .EXAMPLE PLACEHOLDER

 .EXAMPLE PLACEHOLDER

 .INPUTS PLACEHOLDER

 .OUTPUTS PLACEHOLDER

 .NOTES PLACEHOLDER
 #>
 
 function Get-RemoteInfo {
    param (
        [Parameter(Mandatory=$true)]
        [string] $ComputerName
    )
    $PSVersion = $PSVersionTable.PSVersion
    $OS = (Get-ComputerInfo).OsVersion
    $ssh = (Get-WindowsCapability -Online -Name OpenSSH.Server~~~~*).name
    Invoke-Command -ComputerName $ComputerName -ScriptBlock {$PSVersion &  $OS & $ssh}
}