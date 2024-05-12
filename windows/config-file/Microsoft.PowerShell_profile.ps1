Invoke-Expression (&starship init powershell)

Import-Module PSReadLine
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

#$ENV:STARSHIP_CONFIG = "C:\Users\刘帅\.config\starship.toml"


