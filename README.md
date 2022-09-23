# ad
This is a respository for active directory related scripts.
The idea is to have a toolkit to query ad for security related reasons:
Prio 1
- Show AD Group Members (DomainAdmin, Schema Admin etc.)
- Show Group Membership of a users (based on certain attribute)

Prio 2
- Users not logged in since 90days
- non human accounts locked out
- etc.


Tooling:
- https://learn.microsoft.com/en-us/sysinternals/downloads/adexplorer

Sources:
- https://www.alkanesolutions.co.uk/2021/03/03/search-active-directory-using-adsisearcher-filters/
- https://www.secuinfra.com/de/techtalk/adsisearcher-get-the-object-of-interest-suchen-nach-spezifischen-usern-und-computern/
- https://learn.microsoft.com/en-us/dotnet/api/system.directoryservices.directorysearcher?view=dotnet-plat-ext-6.0
