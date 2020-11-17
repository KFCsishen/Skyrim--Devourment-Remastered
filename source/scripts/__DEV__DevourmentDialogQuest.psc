;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname __DEV__DevourmentDialogQuest Extends Quest Hidden

;BEGIN ALIAS PROPERTY DialogPreyAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DialogPreyAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DialogPredAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DialogPredAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Manager.SendDialogEvent(0)
MyScript.Debugger("Stage10", "__DEV__DevourmentDialogQuest")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DevourmentRegistryScript Property Manager Auto
DevourmentNameScript 	Property MyScript 	Auto