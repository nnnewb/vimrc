Set-StrictMode -Version 3
$ErrorActionPreference = "Stop"

Copy-Item -Destination $HOME\_vimrc -Path .\vimrc
Copy-Item -Destination $HOME\_gvimrc -Path .\gvimrc
Copy-Item -Destination $HOME\vimfiles -Path .\vim -Recurse

