;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname __DEV__DigestActor Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If MyActor == None
	MyActor = AkSpeakerRef
EndIf
Manager.switchLethal(MyActor as Actor)
Manager.disableEscape(MyActor as Actor)
MyScript.Debugger("We will now Digest "+MyActor.GetDisplayName(), "__DEV__DigestActor")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DevourmentRegistryScript Property Manager Auto
DevourmentNameScript 	Property MyScript 	Auto
ObjectReference		Property MyActor	Auto
{Default: The Speaker}
