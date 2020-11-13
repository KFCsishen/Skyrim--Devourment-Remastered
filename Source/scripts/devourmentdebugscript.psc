Scriptname DevourmentDebugScript extends ActiveMagicEffect  

DevourmentRegistryScript Property manager Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	manager.DebugDump()
EndEvent