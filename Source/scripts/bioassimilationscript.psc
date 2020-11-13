Scriptname BioAssimilationScript extends ActiveMagicEffect  

Actor  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	me=akCaster
	RegisterForSingleUpdate(0)
EndEvent

Event OnUpdate()
	BioAssimilation.cast(me)
	RegisterForSingleUpdate(1)
EndEvent

Spell Property BioAssimilation Auto