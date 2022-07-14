$search = [adsisearcher]"(&(ObjectCategory=Person)(ObjectClass=User)(cn=*admin*))"
$users = $search.FindAll()
foreach($user in $users) {
    $CN = $user.Properties['CN']
    $DisplayName = $user.Properties['DisplayName']
    $SamAccountName = $user.Properties['SamAccountName']
	  $groupMembership = $user.Properties['Membership']
	#$user.Properties	
    "CN is $CN"
    "Display Name is $DisplayName"
    "SamAccountName is $SamAccountName"
	"SamAccountName is $lastlogon"
}
