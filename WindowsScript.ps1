param (
    $localPath = "C:\Users\****\Documents\***downloads\Files",
    $remotePath= "*********************"
    )

try
{
    Add-Type -Path "C:\Program Files (x86)\WinSCP\WinSCPnet.dll"

    $sessionOptions = New-Object WinSCP.SessionOptions -Property @{
        Protocol = [WinSCP.Protocol]::Sftp
        HostName = "**********.com"
        UserName = "*****************"
        Password = "************"
        sshHostKeyFingerprint = "ssh-rsa 2048 *******************"

    }

    $session = New-Object Winscp.Session

     try
    {
        $session.Open($sessionOptions)
        $transferOptions = New-Object WinSCP.TransferOptions
        $transferOptions.TransferMode = [WinSCP.TransferMode]::Binary
        $TransferResult =
            $session.GetFiles("*", "C:\Users\*****\******\Files", $False, $transferOptions)

        $transferResult.Check()

        foreach ($transfer in $transferResult.Transfers)
        {
            Write-Host "Download of $($transfer.FileName) to $localPath succeeded"
            $transferResult.Transfers
        }

        }

        finally
            {
                $session.Close()
        }

         exit 0

    }

            catch
            {
                Write-Host "Error: $($_.Exception.Message)"
                exit 1

            }