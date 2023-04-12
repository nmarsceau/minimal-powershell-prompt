function Prompt {
    # Runtime of Previous Command
    $lastCommand = Get-History -Count 1;
    if ($lastCommand) {
        if ($lastCommand.Duration.TotalSeconds -gt 5) {
            $formatString = '%s\s';
            if ($lastCommand.Duration.Minutes -gt 0) {$formatString = '%m\m\ ' + $formatString;}
            if ($lastCommand.Duration.Hours -gt 0) {$formatString = '%h\h\ ' + $formatString;}
            if ($lastCommand.Duration.Days -gt 0) {$formatString = '%d\d\ ' + $formatString;}
            Write-Host "`nRuntime: $($lastCommand.Duration.ToString($formatString))`n" -ForegroundColor 'Yellow';
        }
    }

    # Administrator Indicator
    $isAdministrator = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator);
    if ($isAdministrator) {
        Write-Host " Administrator " -ForegroundColor 'White' -BackgroundColor 'Red' -NoNewline;
        Write-Host " " -NoNewline;
    }

    # Working Directory
    $pathSegments = $pwd.ToString().split('\');
    if ($pathSegments.Length -le 3) {$path = $pwd;}
    else {
        $displayPathSegments = [System.Collections.ArrayList]@('...');
        $null = For ($i = 3; $i -gt 0; $i--) {
            $displayPathSegments.Add($pathSegments[-$i]);
        };
        $path = $displayPathSegments -join '\';
    }
    Write-Host "$path" -ForegroundColor 'Blue' -NoNewline;

    # Prompt String
    return ' > ';
}
