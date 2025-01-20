Import-Module posh-git
Import-Module oh-my-posh
# Set-Theme ys
oh-my-posh --init --shell pwsh --config D:/repos/dotfiles/powershell/mine.omp.json | Invoke-Expression
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
