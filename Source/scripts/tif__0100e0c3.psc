;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FR MENT INDEX 2
Scriptname TIF__0100E0C3 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.addSpell(RandomSwallowSpell)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property RandomSwallowSpell  Auto  
