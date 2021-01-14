Import-Module C:\users\cartospd.ga\Documents\WindowsPowerShell\Modules\NetBrain_API.psm1

Function Get-LoggedOnUser{
    
    param(
        [string][Parameter(Mandatory=$true)]$computer
    )

    Invoke-Command -ComputerName $computer -ScriptBlock {Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI' | select LastLoggedOnUser, LastLoggedOnDisplayName}

}


Function Get-Installed-Programs{

    param(
        [string][Parameter(Mandatory=$false)]$Computer
        )

    if($Computer){

        Invoke-Command -ComputerName $computer -ScriptBlock{
            $64bitnode = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
            $32bitnode = "HKLM:\software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
            $installdir = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\*\InstallProperties"
            $uninstall = Get-ChildItem -Path $64bitnode,$32bitnode,$installdir | Get-ItemProperty
            $uninstall | Select-Object -Property Displayname, Displayversion, @{n='Uninstall';e={if($_.uninstallstring -match "msiexec"){$_.localpackage} else{$_.uninstallstring}}}, InstallDate | ?{$_.uninstall -ne $null -and $_.displayname -ne '' -and $_.displayname -ne $null -and $_.displayname -notmatch "Update for"} | sort Displayname


            #Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\*\Installproperties" | Sort-Object DisplayName | ft @{n="Pscomputername"; e={$env:COMPUTERNAME}}, DisplayName, DisplayVersion, InstallDate,localPackage
        }

    }

    else{
            $64bitnode = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
            $32bitnode = "HKLM:\software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
            $installdir = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\*\InstallProperties"
            $uninstall = Get-ChildItem -Path $64bitnode,$32bitnode,$installdir | Get-ItemProperty
            $uninstall | Select-Object -Property Displayname, Displayversion, @{n='Uninstall';e={if($_.uninstallstring -match "msiexec"){$_.localpackage} else{$_.uninstallstring}}}, InstallDate | ?{$_.uninstall -ne $null -and $_.displayname -ne '' -and $_.displayname -ne $null -and $_.displayname -notmatch "Update for"} | sort Displayname


        #Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\*\Installproperties" | Sort-Object DisplayName | ft @{n="Pscomputername"; e={$env:COMPUTERNAME}}, DisplayName, DisplayVersion, InstallDate,localPackage

    }
                
}

Function Start-DSS{

    mstsc /v n001uvds01

}

Function Get-Hostname-From-Ip{
    <#
    .DESCRIPTION
    This will be useful for a windows machine with no DNS entry when all you have to go off of is the IP

    .EXAMPLE
    Get-Hostname-From-Ip -ip 10.236.19.84
    #>
    
    param(
    [string][Parameter(Mandatory=$true)]$ip
    )
    if(Test-Connection -ComputerName $ip -BufferSize 1 -Count 1 -ErrorVariable $err -ErrorAction SilentlyContinue){
    (((reg query \\$ip\HKLM\SYSTEM\CurrentControlSet\Control\Computername\Computername) -split "REG_SZ")[5]).trimstart()
    }
    else{
        Write-Host "$ip is not online" -ForegroundColor Red
    }

}

Function Start-JumpBox{

    Start C:\users\cartospd.ctr\Documents\Jump_server.rdp

}

Function Generate-Password{

    param(
        [string][Parameter(Mandatory=$true,Position=1)]$Length,
        [string][Parameter(Mandatory=$true,Position=2)]$NonAlphaChars
    )

    Add-Type -AssemblyName 'System.Web'

    [System.Web.Security.Membership]::GeneratePassword($Length,$NonAlphaChars)

}


Function SCCM-Install-Applications{
    
    [CmdletBinding()]
    Param
    (  
  
     [String][Parameter(Mandatory=$True, Position=1)] $Computername,  [String][Parameter(Mandatory=$True, Position=2)] $AppName,  [ValidateSet("Install","Uninstall")]
     [String][Parameter(Mandatory=$True, Position=3)] $Method
    )  
   
    Begin {
    $Application = (Get-CimInstance -ClassName CCM_Application -Namespace "root\ccm\clientSDK" -ComputerName $Computername | Where-Object {$_.Name -like $AppName})  
   
    $Args = @{EnforcePreference = [UINT32] 0 
    Id = "$($Application.id)"  
    IsMachineTarget = $Application.IsMachineTarget 
    IsRebootIfNeeded = $False 
    Priority = 'High'  
    Revision = "$($Application.Revision)" }  
   
    }  
   
    Process  
   
    {  
   
    Invoke-CimMethod -Namespace "root\ccm\clientSDK" -ClassName CCM_Application -ComputerName $Computername -MethodName $Method -Arguments $Args  
   
    }  
   
    End {}  
   
}

Function SCCM-Get-Applications{
    param(
    [string]$Computer
    )

    gwmi -ClassName CCM_Application -Namespace "root\ccm\clientSDK" -ComputerName $Computer | select Name, SoftwareVersion, InstallState, AllowedActions | sort name | ft

}

Function SCCM-Get-Updates{
    param(
    [string]$computer
    )

    (Get-WmiObject -Namespace "root\ccm\clientSDK" -Class CCM_SoftwareUpdate -ComputerName $computer | Where-Object { $_.EvaluationState -like "*$($AppEvalState0)*" -or $_.EvaluationState -like "*$($AppEvalState1)*"}) | Select Name, PercentComplete, ContentSize

}

Function SCCM-Run-Actions{
    param(
    [string]$Computer
    )

    Invoke-WMIMethod -ComputerName $computer -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000121}" ##Application Deployment Evaluation Cycle	
    Invoke-WMIMethod -ComputerName $computer -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000003}" ##Discovery Data Collection Cycle
    Invoke-WMIMethod -ComputerName $computer -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000010}" ##Hardware Inventory Cycle
    Invoke-WMIMethod -ComputerName $computer -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000001}" ##Machine Policy Retrieval Cycle
    Invoke-WMIMethod -ComputerName $computer -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000021}" ##Machine Policy Evaluation Cycle
    Invoke-WMIMethod -ComputerName $computer -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000022}" ##Machine Policy Evaluation Cycle
    Invoke-WMIMethod -ComputerName $computer -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000002}" ##Software Inventory Cycle
    Invoke-WMIMethod -ComputerName $computer -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000031}" ##Software Metering Usage Report Cycle
    Invoke-WMIMethod -ComputerName $computer -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000114}" ##Software Update Deployment Evaluation Cycle
    Invoke-WMIMethod -ComputerName $computer -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000113}" ##Software Update Scan Cycle
    Invoke-WMIMethod -ComputerName $computer -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000111}" ##State Message Refresh
    #Invoke-WMIMethod -ComputerName $computer -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000026}" ##User Policy Retrieval Cycle
    #Invoke-WMIMethod -ComputerName $computer -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000027}" ##User Policy Evaluation Cycle
    Invoke-WMIMethod -ComputerName $computer -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule "{00000000-0000-0000-0000-000000000032}" ##Windows Installers Source List Update Cycle

}

Function SCCM-Install-Updates{
    param(
    [string]$Computer
    )
    Invoke-Command -ComputerName $Computer -ScriptBlock{
        ([wmiclass]'ROOT\ccm\ClientSDK:CCM_SoftwareUpdatesManager').InstallUpdates([System.Management.ManagementObject[]] (get-wmiobject -query 'SELECT * FROM CCM_SoftwareUpdate' -namespace 'ROOT\ccm\ClientSDK'))
    }

}

Function SCCM-Repair{
    param(
    [string]$computer
    )
    
    $repair = [wmiclass]"\\$computer\root\ccm:sms_client"
    $repair.RepairClient()
}

Function Get-NetInfo{

    param(
    [string][Parameter(mandatory=$true)]$ip,
    [string]$mask,
    [int]$cidr
    )

    Function IP-toINT64 () {
        param ($ip)

        $octets = $ip.Split('.')
        return [int64]([int64]$octets[0]*16777216 + [int64]$octets[1]*65536 + [int64]$octets[2]*256 + [int64]$octets[3])

    }

    Function INT64-toIP () {
        param ([int64]$int)
        
        return (([math]::Truncate($int/16777216)).tostring()+"."+([math]::Truncate(($int%16777216)/65536)).tostring()+"."+([math]::Truncate(($int%65536)/256)).tostring()+'.'+([math]::Truncate($int%256)).tostring() )
    }

    if($ip){
        $ipaddr = [Net.IPAddress]::Parse($ip)
        $site = ((nltest /dsaddresstosite:$ip)[2]).trim()
    }
    if($cidr){
        $maskaddr = [Net.IPAddress]::Parse((INT64-toIP -int ([convert]::ToInt64(("1"*$cidr+"0"*(32-$cidr)),2))))
    }
    if($mask){
        $maskaddr = [Net.IPAddress]::Parse($mask)
    }
    if($ip){
        $networkaddr = new-object net.ipaddress ($maskaddr.address -band $ipaddr.address)
    }
    if($ip){
        $broadcastaddr = new-object net.ipaddress (([system.net.ipaddress]::parse("255.255.255.255").address -bxor $maskaddr.address -bor $networkaddr.Address))
    }
    if($mask){
        $octets = $mask.Split('.') | foreach {[system.convert]::tostring($_,2)}
        $cidrbits = ($octets -join '').TrimEnd('0')
        $cidr = $cidrbits.length
    }

    $startaddr = IP-toINT64 -ip $networkaddr.IPAddressToString
    $endaddr = IP-toINT64 -ip $broadcastaddr.IPAddressToString
    $start = INT64-toIP -int ($startaddr + 1)
    $end = INT64-toIP -int ($endaddr -1)
    $numberofips = $endaddr - $startaddr - 1

    ($maskaddr.ipaddresstoString).split(".") | foreach {
        if($_ -eq "255"){
            $wildcard += "0."
        }
        else{
            $wildcard += [string](255 - [int]$_) + "."
        }
    }
    $wildcard = $wildcard.trimend('.')

    $obj = New-Object psobject
    $obj | Add-Member NoteProperty IP -Value $ipaddr.ipaddresstostring
    $obj | Add-Member NoteProperty Mask -Value $maskaddr.ipaddresstostring
    $obj | Add-Member NoteProperty NetworkID -Value $networkaddr.IPAddressToString
    $obj | Add-Member NoteProperty Broadcase -Value $broadcastaddr.IPAddressToString
    $obj | Add-Member NoteProperty CIDR -Value $cidr
    $obj | Add-Member NoteProperty Usable -Value ($start + ' - ' + $end)
    $obj | Add-Member NoteProperty Wildcard -Value $wildcard
    $obj | Add-Member NoteProperty NumberofUsableIPs -Value $numberofips.tostring('N0')
    $obj | Add-Member NoteProperty ADSiteInfo -Value $site
    $obj | Select-Object *
}

## Fix Broken WinRM
Function Fix-WinRM{
<#
.DESCRIPTION
Sometimes the WinrRM service breaks due to the Network Service account being added incorrectly
This function will fix it

.EXAMPLE
Fix-Winrm -Computer "insert computer name"
#>

param(
[string]$Computer
)

$service = gwmi win32_service -ComputerName $computer -Filter "name='winrm'"

    if($service.state -eq "Stopped"){
        Write-Host "WinRM service is Stopped, fixing service now on $computer." -ForegroundColor Yellow
        $service.Change($null,$null,$null,$null,$null,$null,"NT AUTHORITY\NetworkService",$null,$null,$null,$null)
        $service.StartService()
    }
    else{
        Write-Host "WinRM service is already running on $computer" -ForegroundColor Green
    }

}

Function Cisco-7{
param(
[string]$string
)

$key = "dsfd;kfoA,.iyewrkldJKDHSUBsgvca69834ncxv9873254k;fg87"

$seed = [int]$string.Substring(0,2)

$plain = [regex]::Matches($string.Substring(2), '..').value | foreach{

    [char]([convert]::ToInt32($_,16) -bxor $key[$seed++])
    $seed = $seed % $key.Length

}

-join $plain

}