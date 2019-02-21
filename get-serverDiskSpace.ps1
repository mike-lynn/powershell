param ([String]$svrName = "localhost") { }

$ds, $dfs

foreach ($disk in (Get-WmiObject Win32_LogicalDisk -ComputerName $svrName)) 
{
    
    if($disk.Size -eq 0 -Or $disk.Size -eq $null)
    { $ds = 1 }
    else {$ds = $disk.Size}

    if ($disk.freespace -eq 0 -Or $disk.Freespace -eq $null)
    {$dfs = 1}
    else {$dfs = $disk.freespace}
    
    "drive $($disk.name) ($($disk.Volumename)) has as size of {0:#.0} GB and {1:#.0} GB free or {2:#.0} % free" `
        -f ($ds/1GB), ($dfs/1GB), (($dfs / $ds)*100)
       
    Clear-Variable ds
    Clear-Variable dfs

}
