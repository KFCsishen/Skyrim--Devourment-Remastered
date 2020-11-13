Scriptname DetectVHelperScript extends ActiveMagicEffect  

Actor caster

 ent OnEffectStart(Actor akTarget, Actor akCaster)
	caster=akCaster
	RegisterForSingleUpdate(0.1)
EndEvent

Event OnUpdate()
	ScanSpell.cast(caster)
	RegisterForSingleUpdate(0.1)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if(IMOD!=None)
		IMOD.remove()
	endif
EndEvent

SPELL Property ScanSpell Auto
ImageSpaceModifier Property IMOD Auto