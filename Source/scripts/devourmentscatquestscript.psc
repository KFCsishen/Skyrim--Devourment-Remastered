Scriptname DevourmentScatQuestScript extends Quest  

Actor pred
Actor prey

Event OnUpdate()
	if(Game.getPlayer().isSneaking()&&pred.getRace()!=theDummy.getRace())
		pred=thePred.getActorRef()
		prey=thePrey.getActorRef()
		prey.moveTo(pred)
		prey.setPosition(pred.getPositionX(), pred.getPositionY(), pred.getPositionZ())
		prey.SetCriticalStage(prey.CritStage_GooEnd)
		prey.attachAshPile(scatPile)
		stop()
		unregisterForUpdate()
		ScatSound.playAndWait(pred)
		pred.setRace(theDummy.getRace())
	endif
EndEvent

ReferenceAlias Property thePrey  Auto  

ReferenceAlias Property thePred  Auto  

Sound Property ScatSound  Auto  

Activator Property ScatPile  Auto  

Quest Property theQuest  Auto  

Actor Property theDummy Auto
