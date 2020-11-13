Scriptname DevourmentSmellStage2Script extends ActiveMagicEffect  

Spell Property StageTwoSpell Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	stageTwoSpell.cast(akTarget)
	dispel()
EndEvent