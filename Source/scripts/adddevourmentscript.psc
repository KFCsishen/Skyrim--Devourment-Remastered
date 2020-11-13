Scriptname AddDevourmentScript extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if((akTarget.hasKeyword(NPC)&&akTarget.GetLeveledActorBase().GetSex()==1)||(!akTarget.hasKeyword(NPC)&&Manager.isModPredatorRace(akTarget.getLeveledActorBase().getRace())))
		if(akTarget!=Game.GetPlayer())
			DevourmentNPC.cast(akTarget)
			; Debug.MessageBox(akTarget.getLeveledActorBase().getRace())
			;if(akTarget.hasMagicEffect(DevourmentNPCEffect))
			;	Debug.MessageBox(akTarget)
			;	Debug.MessageBox("Success")
			;endif
		endif
	endif
EndEvent

Spell Property TheAddSpell Auto
Spell Property DevourmentNPC Auto
MagicEffect Property DevourmentNPCEffect Auto
Spell Property Devourment Auto
Spell Property Endo Auto
Spell Property Options Auto
Shout Property DevourmentShoutNPC Auto
Keyword Property NPC Auto
DevourmentRegistryScript Property Manager Auto