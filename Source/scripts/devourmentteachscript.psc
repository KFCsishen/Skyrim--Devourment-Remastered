Scriptname DevourmentTeachScript extends ObjectReference

Event OnActivate(ObjectReference akActionRef)
	if(akActionRef==Game.getPlayer())
		ActorBase PlayerBase = Game.GetPlayer().GetBaseObject() as ActorBase
		if (PlayerBase.GetSex() == 0)
  			Game.GetPlayer().damageAV("Health", 100)
			pushActorAway(Game.getPlayer(), 100)
		else
			if(Game.getPlayer().hasSpell(Devourment))
				if(ScatEnabled.getValue()==0)
					ScatEnabled.setValue(1)
					EnableMessage.show()
				else
					ScatEnabled.setValue(0)
					DisableMessage.show()
				endif
			else
				TeachMessage.show()
				Game.teachWord(Bahlok)
				Game.teachWord(Du)
				Game.teachWord(Diivon)
				Game.unlockWord(Bahlok)
				Game.unlockWord(Du)
				Game.unlockWord(Diivon)
			endif
		endif
	endif
EndEvent

WordOfPower Property Bahlok  Auto  

WordOfPower Property Du  Auto  

WordOfPower Property Diivon  Auto  

GlobalVariable Property ScatEnabled  Auto  

Shout Property Devourment  Auto  

Message Property EnableMessage  Auto  

Message Property DisableMessage  Auto  

Message Property TeachMessage  Auto  
