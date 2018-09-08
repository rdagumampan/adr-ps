
#initalize adr folder
function Adr-Init () {
	Set-Location $PSScriptRoot;

	#create adr folder
	New-Item -ItemType Directory -Force -Path "doc\adr"

	#create readme.md file
	New-Item "doc\adr\ReadMe.md" -type file -force -value "# Read Me
	"
}

#find the latest adr sequence
function Adr-FindLastSequence(){
	$folderName = "doc\adr"	
	$latestFile = Get-ChildItem -Filter "*.md" -Name -File $folderName | Sort-Object | Select-Object -First 1
	if ($latestFile -eq "ReadMe.md"){
		return "0000"
	} else {
		return "0001"
	}
}

#create adr entry
function Adr-New ($title) {
	Set-Location $PSScriptRoot;

	#find the latest adr sequence
	$folderName = "doc\adr"	
	$latestFile = Get-ChildItem -Filter "*.md" -Name -File $folderName | Sort-Object | Select-Object -First 1

	$nextSequenceNo = "0000"
	if ($latestFile -eq "ReadMe.md"){
		$nextSequenceNo = "0001"
	} else {
		$nextSequenceNo = "0002"
	}

	#slugify title
	$formattedTitle = "$nextSequenceNo-$title"
	New-Item "doc\adr\$formattedTitle.md" -type file -force -value "
# {adr-sequence-no}. {adr-friendly-title}
 
Date: {yyyy--mm-dd}
 
## Status
 
{adr-status}
 
## Context

{adr-context} 
 
## Decision
 
{adr-decision} 
  
## Consequences
 
{adr-consequences} 
"
}

function Adr-Help(){
}

Export-ModuleMember -Function 'Adr-Init'
Export-ModuleMember -Function 'Adr-New'
Export-ModuleMember -Function 'Adr-Help'
Export-ModuleMember -Function 'Adr-FindLastSequence'

#Import-Module .\adr.psm1
#Remove-Module adr
#powershell –ExecutionPolicy Bypass

#https://kevinmarquette.github.io/2017-05-27-Powershell-module-building-basics/
#http://www.tomsitpro.com/articles/powershell-modules,2-846.html
