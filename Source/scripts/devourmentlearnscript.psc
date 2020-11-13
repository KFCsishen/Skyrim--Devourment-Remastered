Scriptname DevourmentLearnScript extends ObjectReference  

Actor theplayer

Event OnActivate(ObjectReference akActionRef)
	if(akActionRef==Game.getPlayer())
		Game.GetPlayer().enableAI(true)
		ActorBase PlayerBase = Game.GetPlayer().GetBaseObject() as ActorBase
		if (PlayerBase.GetSex() == 0)
  			NoMalesMessage.show()
			if(!Game.getPlayer().hasSpell(Aura)||!Game.getPlayer().hasSpell(OptionSpell))
				Game.GetPlayer().addSpell(Aura, true)
				Game.GetPlayer().addSpell(OptionSpell,true)
			else
				AlreadyActiveMessage.show()
			endif
		else
			if(!Game.getPlayer().hasSpell(Aura))
				DevourmentLearnMessage.show()
				theplayer=Game.getPlayer()
				; ThePlayer.removeShout(DevourmentShout)
				ThePlayer.addSpell(SwallowSpell)
				ThePlayer.addSpell(EndoSpell)
				ThePlayer.addSpell(SkillTree)
				ThePlayer.addSpell(Aura, true)
				ThePlayer.addPerk(SwallowCorpse)
				if(Theplayer.getLevel()>Theplayer.getAV("variable05"))
					int startlevel=thePlayer.getLevel()
					if(startLevel>35)
						startLevel=35
					endif
					Theplayer.setAV("variable05",startlevel)
					DevourmentSkillMessage.show(startlevel+15)
				endif
			else
				AlreadyActiveMessage.show()
			endif
		endif
	endif
EndEvent

Shout Property DevourmentShout  Auto  

SPELL Property SwallowSpell  Auto  

SPELL Property EndoSpell  Auto  

SPELL Property SkillTree Auto

SPELL Property Aura Auto

Message Property DevourmentLearnMessage  Auto  

Message Property NoMalesMessage  Auto  

Perk Property SwallowCorpse  Auto  

Message Property DevourmentSkillMessage Auto

Message Property AlreadyActiveMessage Auto

SPELL Property OptionSpell Auto