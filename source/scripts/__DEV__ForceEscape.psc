;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname __DEV__ForceEscape Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If Escapee == None
	Escapee = AkSpeakerRef as Actor
EndIf
Manager.ForceEscape(Escapee, OralEscape)
MyScript.Debugger(AkSpeaker.GetDisplayName()+" Is escaping", "__DEV__ForceEscape")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DevourmentRegistryScript 	Property Manager 			Auto
DevourmentNameScript 		Property MyScript 			Auto
Actor						Property Escapee			Auto
{Default: The Speaker}
Bool						Property OralEscape = True	Auto
{Default: True}
