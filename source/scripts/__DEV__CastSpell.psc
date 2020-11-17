;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 0
Scriptname __DEV__CastSpell Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If MySpell == None
	MySpell = Game.GetFormFromFile(0X0000D5F1, "devourment.esm") as Spell
EndIf
If Caster == None
	Caster = AkSpeakerRef
EndIf
If Target == None
	Target = Game.GetPlayer()
EndIf

MySpell.cast(Caster, Target)
MyScript.Debugger("Caster: "+Caster.GetDisplayName()+" ; Target: "+Target.GetDisplayName()+" ; Spell: "+MySpell.GetName(), "__DEV__CastSpell")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DevourmentNameScript 	Property MyScript 	Auto
SPELL               			Property MySpell	Auto
{The spell you want to cast.									(Default: EndoSpell)} 
ObjectReference     		Property Caster		Auto
{Thing casting said Spell (CAN be an object OR NPC)			(Default: The person speaking)}
ObjectReference     		Property Target		Auto
{Thing the spell is being Casted AT.							(Default: The Player)}