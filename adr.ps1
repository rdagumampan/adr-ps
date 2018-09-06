Param(
)

Clear

#get current script location
Set-Location $PSScriptRoot;
	
#initalize adr folder
function Initialize {
	Set-Location $PSScriptRoot;

	#create adr folder
	New-Item -ItemType Directory -Force -Path "\decisions"

	#create readme.md file
	New-Item ReadMe.md -type file -force -value "
	# Read Me
	"
}

#find the latest adr sequence
function FindNextSequence{
}

#slugify title
function SlugiyTitle {
}

#create adr entry
function CreateAdrEntry{
	New-Item ReadMe.md -type file -force -value 
	"
	{adr-number} {adr-title}
	{adr-status}
	{adr-context}
	{adr-decision}
	{adr-consequences}
	"
}

InitAdr
