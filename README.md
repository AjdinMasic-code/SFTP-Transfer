# SFTP-Transfer
A template for file transfers via SFTP
<br />
<br />
<b>Requirements:</b>
<br />
Posh-SSH
Powershell Version 3+
<br />
<br />
<b>Parameters to pass:</b>
<br />
sftpUpload.ps1
<br />
&nbsp;&nbsp;&nbsp;[-logFile <String>]
         <br />
&nbsp;&nbsp;&nbsp;[-sourceFile <String>]
         <br />
&nbsp;&nbsp;&nbsp;[-sftpServer <String>]
         <br />
&nbsp;&nbsp;&nbsp;[-sftpDest <String>]
         <br />
&nbsp;&nbsp;&nbsp;[-username <String>]
         <br />
&nbsp;&nbsp;&nbsp;[-password <SecureString>]
<br />
<br />
<b>How to use:</b>
<br />
<br />
.\sftpUpload.ps1 -logFile "C:\LogFile_$(Get-Date -UFormat %Y%m%d%H%M).txt" -sourceFile "C:\bla.txt" -sftpServer "server.bla.com" -sftpDest "/foo/bar" -username "username" -password (ConvertTo-SecureString "password" -AsPlainText -Force)
<br />
<br />
<b>Notes:</b>
<br />
Password is passed as secure string for security purposes. You can, but I don't recommend, change how the Param is set up.
<br />
I.E.
<br />
Param(
<br/>
&nbsp;&nbsp;&nbsp;[string]$logFile,
    <br />
&nbsp;&nbsp;&nbsp;[string]$sourceFile,
    <br />
&nbsp;&nbsp;&nbsp;[string]$sftpServer,
    <br />
&nbsp;&nbsp;&nbsp;[string]$sftpDest,
    <br />
&nbsp;&nbsp;&nbsp;[string]$username,
     <br />
&nbsp;&nbsp;&nbsp;[SecureString]$password
<br />
)
<br />
TO:
Param(
<br />
&nbsp;&nbsp;&nbsp;[string]$logFile,
    <br />
&nbsp;&nbsp;&nbsp;[string]$sourceFile,
    <br />
&nbsp;&nbsp;&nbsp;[string]$sftpServer,
    <br />
&nbsp;&nbsp;&nbsp;[string]$sftpDest,
    <br />
&nbsp;&nbsp;&nbsp;[string]$username,
    <br />
&nbsp;&nbsp;&nbsp;[string]$password
<br />
)
<br />
And the above code block:
$password = ConvertTo-SecureString "$password" -AsPlainText -Force)
<br />
That way you can avoid converting the password to SecureString when passing the parameter to the script. <b>Again I don't recommend doing this for security reasons</b>
<br />
<br />
<h3><b>I will be updating this repository with more SFTP scripts like handling multiple files, directories, etc.</b></h3>
