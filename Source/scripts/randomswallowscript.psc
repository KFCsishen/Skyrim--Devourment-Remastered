Scriptname RandomSwallowScript extends activemagiceffect  

Actor thePred
int RandomNom

Event OnEffectStart(Actor akTarget, Actor akCaster)
	thePred=akCaster
	RegisterForUpdate(1)
EndEvent

Event OnUpdate()
if(thePred.getItemCount(Fullness)==0&&thePred.getCombatState()==0)
	if(thePred.getDistance(Game.getPlayer())<169)
		randomNom=Utility.randomInt()
		if(randomNom==69)
			Swallow.cast(thePred, Game.getPlayer())
		endif
	endif
endif
EndEvent

Spell Property Swallow Auto
FormList Property Fullness Auto