;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname __DEV__DevBounty Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Actor Player = Game.GetPlayer()
Player.addItem(Gold,BountyGlobal.getValueInt())
MyScript.Debugger(Player.GetName()+" has recieved "+BountyGlobal.getValueInt()+" gold from DEV Bounty", "__DEV__DevBounty")
BountyGlobal.setValue(0)
MyScript.Debugger("Bounty reset to "+BountyGlobal.getValueInt()+" (Expecting 0)","__DEV__DevBounty")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable 			Property BountyGlobal  	Auto  
DevourmentNameScript 	Property MyScript 		Auto
MiscObject 				Property Gold  			Auto  
