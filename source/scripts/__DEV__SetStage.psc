;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname __DEV__SetStage Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(MyStage)
MyScript.Debugger("Stage "+MyStage as Int+" Requested", "__DEV__SetStage")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DevourmentRegistryScript Property Manager Auto
DevourmentNameScript 	Property MyScript 	Auto
Int						Property MyStage	Auto
