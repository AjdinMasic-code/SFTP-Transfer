# SFTP-Transfer
A template for file transfers via SFTP

<h1><b>SFTP Transfer</b></h1>
<br />
<br />
<b>Requirements</b>
<br />
Posh-SSH
Powershell Version 3+
<br />
<br />
<b>Parameters to pass</b>
<br />
ConvertTo-Html
         [-logFile <String>]
         [-sourceFile <String>]
         [-sftpServer <String>]
         [-sftpDest <String>]
         [-username <String>]
         [-password <SecureString>]
<br />
<br />
<b>How to use:</b>
<br />
<br />
.\sftpUpload.ps1 -logFile "C:\LogFile_$(Get-Date -UFormat %Y%m%d%H%M).txt" -sourceFile "C:\bla.txt" -sftpServer "server.bla.com" -sftpDest "/foo/bar" -username "username" -password (ConvertTo-SecureString "password" -AsPlainText -Force)
<br />
<br />
<b>Notes</b>
Password is passed as secure string for security purposes. You can, but I don't recommend, change how the Param is set up.
<br />
I.E.
<br />
Param(
<br/>
    [string]$logFile,
    [string]$sourceFile,
    [string]$sftpServer,
    [string]$sftpDest,
    [string]$username,
    [SecureString]$password
<br />
)
<br />
TO:
Param(
<br />
    [string]$logFile,
    [string]$sourceFile,
    [string]$sftpServer,
    [string]$sftpDest,
    [string]$username,
    [string]$password
<br />
)
<br />
And then immediatelly after that:
$password = ConvertTo-SecureString "$password" -AsPlainText -Force)
<br />
That way you can avoid converting the password to SecureString when passing the parameter to the script. <b>Again I don't recommend doing this for security reasons</b>
<br />
<br />
<h2><b>I will be updating this repository with more SFTP scripts like handling multiple files, directories, etc.</b></h2>
