$propertiesExist = Test-Path localDevDeploy.properties
$ErrorActionPreference = "Stop"

if ($propertiesExist -eq $true) {
    Write-Host ""
    Write-Host "Reading localDevDeploy.properties"
    Write-Host ""

    # Build the settings we will work with
    $properties = Get-Content localDevDeploy.properties
    $settings = @{""=""};
    foreach ($line in $properties) {
        $items = $line.Split("=")
        $settings.Add($items[0], $items[1])
    }

    # Ensure we know what things to operate on
    if($settings.ContainsKey("arma3Install") -eq $true -and $settings.ContainsKey("pboManagerInstall") -eq $true) {
        $oldExists = Test-Path DUWS-N_dev.Altis.pbo
        if($oldExists -eq $true) {
            Remove-Item DUWS-N_dev.Altis.pbo
        }

        # Pack the folder
        $command = """" + $settings["pboManagerInstall"] + "\PBOConsole.exe"" -pack .\source .\DUWS-N_dev.Altis.pbo"
        Invoke-Expression "& $command"

        # Ensure the SP destination exists
        $dirSPPath = $settings["arma3Install"] + "\Missions"
        $dirSPExists = Test-Path $dirSPPath
        if($dirSPExists -eq $false){
            New-Item $dirSPPath -type directory
        }

        # Ensure the SP destination is clear
        $oldPath = $settings["arma3Install"] + "\Missions\DUWS-N_dev.Altis.pbo"
        $oldExists = Test-Path $oldPath
        if($oldExists -eq $true) {
            Remove-Item $oldPath
        }
        # Pull other 'real' release out by renaming them to .bak
        $tmp = $settings["arma3Install"] + "\Missions\"
        $otherFiles = Get-ChildItem $tmp -filter "DUWS-N_*.pbo"
        foreach ($file in $otherFiles){
            if(-Not($file -eq "" -Or $file -eq $null)) {
                Write-Host "Attemping to rename " - $tmp$file $(" to ") - $tmp$file.bak
                Rename-Item "$tmp$file" "$tmp$file.bak"
            }
        }
        Copy-Item DUWS-N_dev.Altis.pbo $oldPath

        # Ensure the SP destination exists
        $dirMPPath = $settings["arma3Install"] + "\MPMissions"
        $dirMPExists = Test-Path $dirMPPath
        if($dirMPExists -eq $false){
            New-Item $dirMPPath -type directory
        }

        # Ensure the MP destination is clear
        $oldPath = $settings["arma3Install"] + "\MPMissions\DUWS-N_dev.Altis.pbo"
        $oldExists = Test-Path $oldPath
        if($oldExists -eq $true) {
            Remove-Item $oldPath
        }
        # Pull other 'real' release out by renaming them to .bak
        $tmp = $settings["arma3Install"] + "\MPMissions\"
        $otherFiles = Get-ChildItem $tmp -filter "DUWS-N_*.pbo"
            if(-Not($file -eq "" -Or $file -eq $null)) {
                Write-Host "Attemping to rename " - $tmp$file $(" to ") - $tmp$file.bak
                Rename-Item "$tmp$file" "$tmp$file.bak"
            }
        Copy-Item DUWS-N_dev.Altis.pbo $oldPath
        Remove-Item DUWS-N_dev.Altis.pbo
    } else {
        Write-Host "could not find arma3Install and pboManagerInstall keys in properties file"
    }

    Write-Host ""
} else {
    Write-Host ""
    Write-Host "Cannot find localDevDeploy.properties. Please create and configure the file then try again."
    Write-Host ""
}
