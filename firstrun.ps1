#### PowerShell Script that will rename, set static IP address and join Active Directory domain
#### Compiled by David Starkweather

wmic computersystem where name="%COMPUTERNAME%" 
     call rename name="NEW-NAME"
     
netsh int ipv4 set address name=<interface name> source=<'static' | 'dhcp'> [address=<IP address[/bitmask]>] [mask=<netmask>] [gateway=<gateway>]
netsh int ipv4 set dns name=<interface name> source=<'static' | 'dhcp'> [address=<address | 'none'>] [register=<'none' | 'primary' | 'both'>] [validate=<'yes' | 'no'>]

$domain = "myDomain"
$password = "myPassword!" | ConvertTo-SecureString -asPlainText -Force
$username = "$domain\myUserAccount" 
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
Add-Computer -DomainName $domain -Credential $credential
