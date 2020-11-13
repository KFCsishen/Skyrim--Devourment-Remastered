Scriptname SmellsYummyScript extends ActiveMagicEffect  

bool protected
Actor me
bool recast=false

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.addSpell(Smell)
	protected=akTarget.getLeveledActorBase().isProtected()
	akTarget.getLeveledActorBase().setEssential(true)
	RegisterForUpdate(0.1)
	me=akTarget
	me.setAV("FavorsPerDay",4)
EndEvent

Event OnUpdate()
	if(me.isBleedingOut())
		me.restoreav("Health",10)
		recast=true
		dispel()
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.removeSpell(Smell)
	akTarget.getLeveledActorBase().setEssential(protected)
	if(recast)
		SmellApply.cast(akTarget)
	endif
EndEvent

SPELL Property Smell Auto
SPELL Property SmellApply Auto