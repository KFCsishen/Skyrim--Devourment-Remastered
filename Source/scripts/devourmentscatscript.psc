Scriptname DevourmentScatScript extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	RegisterForUpdate(0.2)
	thePoop=prey.getReference() as Actor
	thePred=getTargetActor()
	started=false
EndEvent

Event OnUpdate()
	if(thePred.isSneaking()&&started==false)
		started=true
		if(!thePoop.isEssential()&&!thePoop.getLeveledActorBase().isProtected()&&thePoop.getLeveledActorBase()==thePoop.getActorBase())
			thePoop.moveTo(thePred)
			thePoop.setPosition(thePred.getPositionX(), thePred.getPositionY(), thePred.getPositionZ())
			thePoop.SetCriticalStage(thePoop.CritStage_GooEnd)
			thePoop.attachAshPile(scatPile)
		else
			thePoop.disable()
			pile=thePred.placeAtMe(EssentialPoop)
			pile.setAngle(0,0,0)
			thePoop.removeAllItems(pile)
			thePoop.killessential(thePred)
		endif
		ScatSound.playAndWait(thePred)
		thePred.removeItem(Fullness,99,true)
	dispel()
	endif
EndEvent

ObjectReference pile
Actor thePoop
Actor thePred
bool started

ReferenceAlias Property prey  Auto  
Armor Property Fullness  Auto  
Activator Property scatPile Auto
Sound Property scatSound Auto
Container Property EssentialPoop Auto