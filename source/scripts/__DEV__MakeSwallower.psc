;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 0
Scriptname __DEV__MakeSwallower Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
RandomSwallowSpell = Game.GetFormFromFile(0X0000E0C4, "devourment.esm") as Spell
akSpeaker.addSpell(RandomSwallowSpell)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property RandomSwallowSpell  Auto Hidden
