Scriptname DevourmentRapidDigestion extends ActiveMagicEffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.addSpell(DigestionCancelSpell, false)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.removeSpell(DigestionCancelSpell)
EndEvent

Spell Property DigestionCancelSpell Auto