#bei 25 Tagen kommt er in die fliesskomma darstellung
$days = 10
[int64] $windowsepochts = [datetime]::Now.ToFileTime()
[int64] $comparedts =$windowsepochts-(86400000*$days)
"$windowsepochts - $comparedts"
#users with admin name and without login since
$search = [adsisearcher]"(&(ObjectCategory=Person)(ObjectClass=User)(cn=*admin*)(lastlogontimestamp<=$comparedts))"


$search.SearchRoot = [ADSI]"LDAP://DC=<lorem>,DC=<lorem>"

#$search = [adsisearcher]"(&(ObjectCategory=Person)(ObjectClass=User)(lastlogontimestamp<=$comparedts))"
$users = $search.FindAll()
$count = $users.count
"Results is $count"
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
