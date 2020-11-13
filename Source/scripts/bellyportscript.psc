Scriptname BellyportScript extends ActiveMagicEffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
if(akCaster.getItemCount(Fullness)>0)
	StomachCapacity.show()
	dispel()
elseif(akCaster.getLeveledActorBase().getSex()==1)
	akTarget.placeatme(graphics)
	predSpell.cast(akTarget,akCaster)
endif
EndEvent

SPELL Property predSpell Auto
Explosion Property Graphics Auto
FormList Property Fullness Auto
Message Property StomachCapacity Auto