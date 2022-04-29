<#
.SYNOPSIS
    Manage a local user account. This includes creating the account, setting the password, and local group membership.

.EXAMPLE
    PS C:\> Managed-LocalUser -UserID Snuffy -
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    General notes
#>
Function Manage-LocalUser {
    Param(   `
        [Parameter(Mandatory)] [String]$userID,
        [Parameter][bool]$password,
        [Parameter][bool]$addGroups
        )

    $user = Get-localuser -Name $userID 
    if(! ($user)){
        $Creds = Get-Credential -UserName $userID -Message "Enter new password for ANT\svc_schedules account"
        New-localuser -UserID $userID -Password $creds.GetNetworkCredential().Password 
        $user = $user = Get-localuser -Name $userID 
    }

    If ($password -eq $true){
        $Creds = Get-Credential -UserName $userID -Message "Enter new password for ANT\svc_schedules account"
        Set-localuser -UserID $userID -Password $creds.GetNetworkCredential().Password 
    }

    if($addGroups -eq $true){
        $groups = Read-Host -Prompt "Enter group name, if multiple groups comma seperate them"
        Foreach ($g in $Groups){
            Get-localgroup $g | add-localgroupmember -UserID $userID
        }
    }
}