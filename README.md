# Minimal PowerShell Prompt

This script alters the default PowerShell prompt to create a more useful experience while trying to remain as minimal as possible.

## Installation

1. Clone this repository to your computer.
2. Add the following line to your PowerShell profile:

    `. C:\path\to\minimal-powershell-profile.ps1`

## Features

### Customized Command Prompt

To keep the command prompt short, only the last 3 segments of the working directory will be printed.

![Only three segments of the working directory path are shown at the prompt.](https://github.com/nmarsceau/minimal-powershell-prompt/assets/53009141/40b6f7f8-9f7f-46e8-9a11-706da7a9090d)


### Show the Runtime of the Previous Command
If the previous command took longer than 5 seconds to run, its runtime will be displayed before the prompt is printed.

![The runtime of the previous command is displayed at the prompt.](https://github.com/nmarsceau/minimal-powershell-prompt/assets/53009141/71049530-4d82-48ab-bda4-505c3c129242)


### Administrator Warning
When running PowerShell as an Administrator, a very bold warning will be displayed at the beginning of the prompt.

![A PowerShell prompt running with elevated privileges.](https://github.com/nmarsceau/minimal-powershell-prompt/assets/53009141/80d395bb-366c-4774-9f5c-08fda02e8226)

