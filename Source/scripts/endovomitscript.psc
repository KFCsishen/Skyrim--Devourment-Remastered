Scriptname EndoVomitScript extends activemagiceffect  

Event OnEffectStart(Actor akCaster, Actor akTarget)
	if(ManagerQuest.hasLivePrey(akTarget))
		ManagerQuest.registerAllVomits(akTarget)
	elseif(akTarget==Game.getPlayer() && akCaster==Game.getPlayer())
		noPreyMessage.show()
	endif
EndEvent

DevourmentRegistryScript Property ManagerQuest Auto
Message Property NoPreyMessage Auto