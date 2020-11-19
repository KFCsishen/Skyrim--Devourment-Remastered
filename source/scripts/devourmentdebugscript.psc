Scriptname DevourmentDebugScript extends ActiveMagicEffect  

DevourmentRegistryScript Property manager Auto
GlobalVariable Property Debugger Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	manager.DebugDump()
	If Debugger.GetValue() == 0
		Debugger.SetValue(1)
	EndIf
EndEvent