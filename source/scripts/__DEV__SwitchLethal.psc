;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname __DEV__SwitchLethal Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If MyActor == None
	MyActor = AkSpeaker
EndIf
Manager.SwitchLethal(MyActor)
MyScript.Debugger("Digesting: "+MyActor.GetDisplayName(), "__DEV__SwitchLethal")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DevourmentRegistryScript Property Manager Auto
DevourmentNameScript 	Property MyScript 	Auto
Actor					Property MyActor	Auto
{Default: The Speaker}
