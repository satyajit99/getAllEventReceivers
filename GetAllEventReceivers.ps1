if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null) 
{
    Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}

$site = Get-SPSite -Identity http://applications10.aflacsps-dev.com/sites/lgs

foreach ( $web in $site.AllWebs )
{
    Write-Host "Looking in web: " $web.Url
    foreach ($list in $web.Lists)
    {
        #Write-Host $list.Title
        #$list.EventReceivers | Select Name
        #Write-Host "***************"

        if ($list.EventReceivers.Count -gt 0){
            Write-Host $list.Title " has " $list.EventReceivers.Count " event receiver(s)"
            Write-Host "***********************************************************************************"
            $list.EventReceivers.Name
            Write-Host "***********************************************************************************"

        }
    }
}


