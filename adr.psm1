#initalize adr folder
function Adr-Init () {
	Set-Location $PSScriptRoot;

	#create adr repo folder only if its not there yet
	$destinationDirectory = "$PSScriptRoot\doc\adr"
	if(!(Test-Path -Path $destinationDirectory )){
		#create adr folder
		New-Item -ItemType Directory -Force -Path "doc\adr"

		#create readme.md file
		New-Item "doc\adr\ReadMe.md" -type file -force -value "# Adr

Documentations of architecturally significant functional and non-functional decisions through out solution lifetime."
	} else {
		Write-Warning -Message "Adr target folder $destinationDirectory already exists"
	}

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
		$nextSequenceInt = [int]$latestFile.Substring(0,4) + 1
		$nextSequenceNo = $nextSequenceInt.ToString("0000")
	}

	#slugify title
	$slugifiedTitle = $title.ToLower().Replace(" ","-")
	$datePosted = Get-Date -Format "yyyy-MM-dd
	"
	New-Item "doc\adr\$nextSequenceNo-$slugifiedTitle.md" -type file -force -value "
# $nextSequenceNo. $title
 
Date: $datePosted
 
## Status
 
Accepted
 
## Context

{adr-decision-context} 
 
## Decision
 
{adr-decision} 
  
## Consequences
 
{adr-decision-consequences} 
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
