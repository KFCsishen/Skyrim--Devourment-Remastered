Scriptname PlayerStayAtPredLocation extends activemagiceffect  

Actor thePred
Actor thePrey

Event OnEffectStart(Actor akTarget, Actor akCaster)
	thePrey=akTarget
	thePred=akCaster
	RegisterForUpdate(0.1)
EndEvent

Event OnUpdate()
	thePrey.moveto(thePred)
EndEvent