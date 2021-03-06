################################################################################
##  File:  Install-Ruby.ps1
##  Team:  CI-Platform
##  Desc:  Install Ruby for Windows
################################################################################

Import-Module -Name ImageHelpers

# Ruby versions are already available in the tool cache.

# Tool cache Ruby Path
$toolcacheRubyPath = 'C:\hostedtoolcache\windows\Ruby\2.5.*'

# Get Latest Ruby 2.5.x
$latestRubyBinPath2_5 = Get-ChildItem -Path $toolcacheRubyPath | Sort-Object {[System.Version]$_.Name} | Select-Object -Last 1 | ForEach-Object {
	Join-Path $_.FullName 'x64\bin'
}

Add-MachinePathItem $latestRubyBinPath2_5
$env:Path = Get-MachinePath
exit 0
