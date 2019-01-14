#
#   FTP Upload Process
#
#   Created by Ajdin Masic
#
#   This is a simple SFTP Upload script. This script in it's current base form handles only single file transfers
#   I will be updating the repository with multiple file transfers and more.
#
#   What this script does
#   ---------------------------
#
#   Grabs a file and uploads via SFTP
#
#   Uses Posh-SSH
#
#

#   Create New SFTPSession

[cmdletbinding()]
Param(

    [string]$logFile,
    [string]$sourceFile,
    [string]$sftpServer,
    [string]$sftpDest,
    [string]$username,
    [SecureString]$password

)

Import-Module Posh-SSH

    $sftpCredentials = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $username, $password

    "Variables created - Started File processing on $(Get-Date -UFormat '%Y-%m-%d') at $(Get-Date -UFormat %H:%M)"


    #
    # SFTP Connection Started
    #

    try {

        "SFTP session creation started" >> $logFile
        $session = New-SFTPSession -ComputerName $sftpServer -Credential $sftpCredentials -AcceptKey

        "Connection was a success" >> $logFile

    }

    catch {

        "Setting up SFTP session has failed..." >> $logFile
        $Error >> $logFile

    }

    #
    # Sets up the file to be transferred 
    #

    try {

        "Started transferring file to server" >> $logFile
        Set-SFTPFile -SessionId $session.SessionId -LocalFile $sourceFile -RemotePath $sftpDest -OverWrite

        "Transfer was successful" >> $logFile

    }

    catch {

        "SFTP transfer failed" >> $logFile
        $Error >> $logFile

    }

    #
    #   Disconnects all active SFTP sessions.
    #   For each session. There's only one but trying to future proof the system.
    #

    Get-SFTPSession | ForEach-Object { Remove-SFTPSession -SessionId ($session.SessionId) }
