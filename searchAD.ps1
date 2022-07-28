$days = 1
$windowsepochts = [datetime]::Now.ToFileTime()
$comparedts =$windowsepochts-(86400000*$days)
$search = [adsisearcher]"(&(ObjectCategory=Person)(ObjectClass=User)(cn=*admin*)(lastlogontimestamp<=$comparedts))"
#$search = [adsisearcher]"(&(ObjectCategory=Person)(ObjectClass=User)(lastlogontimestamp<=$comparedts))"
$users = $search.FindAll()
foreach($user in $users) {
    $CN = $user.Properties['CN']
    $DisplayName = $user.Properties['DisplayName']
    $SamAccountName = $user.Properties['SamAccountName']
	$groupMembership = $user.Properties['Membership']
	$lastlogon = $user.Properties['lastlogontimestamp']
	#[datetime]::FromFileTime([int64][string]$ts)
	$flastlogon = [datetime]::FromFileTime([int64][string]$lastlogon) 
	#$user.Properties	
    "CN is $CN"
    "Display Name is $DisplayName"
    "SamAccountName is $SamAccountName"
	"Last Logon was $flastlogon"
}
