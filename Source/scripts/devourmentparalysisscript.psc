Scriptname DevourmentParalysisScript extends activemagiceffect 

Event OnEffectStart(Actor akTarget, Actor akCaster)
	RegisterForUpdate(1)
EndEvent

Event OnUpdate()
	dispel()
EndEvent