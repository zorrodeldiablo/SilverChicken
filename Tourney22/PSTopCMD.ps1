 <#
 .SYNOPSIS
    Show remote connected users. 
 .DESCRIPTION 
    A command to show remote connected users using PowerShell remoting. Include both traditional connections and ssh.
        The output should show the user name, when they connected, how long connected, and if possible their source IP address.
 .PARAMETER PLACEHOLDER
 
 .PARAMETER PLACEHOLDER
 
 .EXAMPLE PLACEHOLDER

 .EXAMPLE PLACEHOLDER

 .INPUTS PLACEHOLDER

 .OUTPUTS PLACEHOLDER

 .NOTES PLACEHOLDER
 #>
 
 function Get-RemoteProcess {
    param (
        [Parameter(Mandatory=$true)]
        [string] {$ComputerName
        [Parameter(Mandatory=$true)]
        [string] $Process
    )
    Invoke-Command -ComputerName $ComputerName -ScriptBlock {get-process -Name $process}
}