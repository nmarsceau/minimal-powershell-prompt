Function Prompt {
    # Load Config
    $configPath = "$PSScriptRoot\config.json";
    $config = If (Test-Path -Path $configPath -PathType Leaf) {Get-Content $configPath | ConvertFrom-Json;} Else {[PSCustomObject]@{};};

    # Show Runtime of Previous Command
    If ($null -ne $config.showRuntimeThreshold) {
        $lastCommand = Get-History -Count 1;
        If ($lastCommand) {
            If ($lastCommand.Duration.TotalSeconds -gt $config.showRuntimeThreshold) {
                $formatString = '%s\s';
                If ($lastCommand.Duration.Minutes -gt 0) {$formatString = '%m\m\ ' + $formatString;}
                If ($lastCommand.Duration.Hours -gt 0) {$formatString = '%h\h\ ' + $formatString;}
                If ($lastCommand.Duration.Days -gt 0) {$formatString = '%d\d\ ' + $formatString;}
                Write-Host "`nRuntime: $($lastCommand.Duration.ToString($formatString))`n" -ForegroundColor Yellow;
            }
        }
    }

    # Print Working Directory
    If ($null -ne $config.pathSegmentsToShow -and 0 -ne $config.pathSegmentsToShow) {
        $pathSegments = $pwd.ToString().split('\');
        If ('all' -eq $config.pathSegmentsToShow -or $config.pathSegmentsToShow -ge $pathSegments.Length) {$path = $pwd;}
        Else {
            $displayPathSegments = [System.Collections.ArrayList]@('...');
            $null = For ($i = $config.pathSegmentsToShow; $i -gt 0; $i--) {
                $displayPathSegments.Add($pathSegments[-$i]);
            };
            $path = $displayPathSegments -join '\';
        }
        Write-Host "$path" -ForegroundColor Blue -NoNewline;
    }

    # Print Prompt String
    $prompt = If ($null -eq $config.promptString) {' > '} Else {$config.promptString};
    If ($null -eq $config.pathSegmentsToShow -or 0 -eq $config.pathSegmentsToShow) {
        $prompt = $prompt.TrimStart();
    }
    return $prompt;
}
