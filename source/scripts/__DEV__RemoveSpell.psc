;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname __DEV__RemoveSpell Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If MyActor == None
	MyActor = AkSpeaker as Actor
EndIf
MyActor.removeSpell(MySpell)
MyScript.Debugger("Removed Spell: "+MySpell.GetName()+" From: "+MyActor.GetDisplayName(), "__DEV__RemoveSpell")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DevourmentNameScript 	Property MyScript 	Auto
SPELL               			Property MySpell	Auto
{The spell you want to cast.									(Default: NONE)} 
Actor			     		Property MyActor	Auto
{Actor the spell is being removed from						(Default: The person speaking)}
