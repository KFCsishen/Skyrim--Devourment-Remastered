;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FR MENT INDEX 6
Scriptname TIF__0100D5EF Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
EndoSpell.cast(akSpeakerRef, Game.getPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property EndoSpell  Auto  
