
# 0002. Implement as Powershell
 
Date: 2018-08-09
 
## Status
 
Accepted
 
## Context

ADRS need to be created on a wide variety of platforms. For Windows developers and architects, Powershell comes out-of-the-box without pre-requisite installations.
 
## Decision
 
The tool was written and build as Powershell Module for better CLI support. A pure PS1 approach was considered but users would have to send prameters affront and requires more complex code. 
  
## Consequences
 
As Powershell is a scripting language, the implementation is very transparent. 
