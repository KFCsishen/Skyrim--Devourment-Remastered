Scriptname AssimilateScript extends ActiveMagicEffect  

ObjectReference the le

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.placeatme(Kaboom).setScale(0.75)
	akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateStart)
	akTarget.attachAshPile(Remains)
	akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateEnd)
	akCaster.restoreav("Health",50)
	akCaster.restoreav("Stamina",50)
EndEvent

VisualEffect Property BloodFX Auto
Activator Property Remains Auto
Explosion Property Kaboom Auto
ObjectReference Property HerStomach Auto