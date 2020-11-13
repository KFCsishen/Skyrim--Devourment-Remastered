Scriptname TKGrappleScript extends activemagiceffect  

Actor caster
Actor me

Ev t OnEffectStart(Actor akTarget, Actor akCaster)
	me=akTarget
	caster=akCaster
	RegisterForUpdate(0.01)
EndEvent

Event OnUpdate()
	if(me.hasMagicEffectWithKeyword(BeingSwallowed))
		dispel()
	endif
EndEvent

Keyword Property BeingSwallowed Auto