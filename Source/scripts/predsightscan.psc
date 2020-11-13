Scriptname PredSightScan extends ActiveMagicEffect  

Actor thePrey
Actor thePred

Event OnEffectStart(Actor akTarget, Actor akCaster)
	thePrey=akTarget
	thePred=akCaster

	; Chance of swallowing: Exp(- (HP/Max) - 0.5*(STAM/Max))*(1+(SkillDiff/100))*(perkmult)*(enchmult)*(1+(.5 if unaware))
	float HP=thePrey.GetActorValuePercentage("Health")
	float STAM=thePrey.GetActorValuePercentage("Stamina")
	float PredSkill=0
	if(thePred==Game.GetPlayer())
		PredSkill=(thePred.getAV("Variable05")+15)
	else
		PredSkill=15+thePred.getAV("Variable05")+(thePred.getLevel()*1.7) as Int
		if(predSkill>100)
			predSkill=100
		endif
	endif
	float PreySkill=0
	if(thePrey==Game.GetPlayer())
		PreySkill=(thePrey.getAV("Variable05")+15)
	else
		PreySkill=thePrey.getAV("Variable05")+thePrey.getLevel()+15
	endif
	float PerkMult=1
	if(thePred.hasPerk(Voracious80))
		PerkMult=2
	elseif(thePred.hasPerk(Voracious60))
		PerkMult=1.8
	elseif(thePred.hasPerk(Voracious40))
		PerkMult=1.6
	elseif(thePred.hasPerk(Voracious20))
		PerkMult=1.4
	elseif(thePred.hasPerk(Voracious00))
		PerkMult=1.2
	endif
	Float swallowChance=(1.0 + (PredSkill-PreySkill)/100.0)*perkMult*Math.pow(2.71828,-HP-(0.5*STAM))
	if(!thePred.isDetectedBy(thePrey))
		swallowChance=(swallowChance*1.5)
	endif
	
	if(thePred!=Game.GetPlayer())
		swallowChance=(swallowChance*NPCBonus.getValue())
	endif

	swallowChance=swallowChance*(1+thePred.getAV("FavorActive")/100)
	swallowChance=swallowChance*(1-thePrey.getAV("FavorPointsBonus")/100)

	if(thePred.hasPerk(SilentSwallow)&&thePrey.getSleepState()>2)
		swallowChance=1
	endif
	
	if(swallowChance<(MinChance.getValue()/100.0))
		swallowChance=(MinChance.getValue()/100.0)
	endif

	if(thePrey.isDead()||thePrey.isBleedingOut()||thePrey.HasMagicEffectWithKeyword(Surrender))
		SwallowChance=1
	endif

	PredSightMessage.show(swallowChance*100)

EndEvent

Perk Property Voracious80 Auto
Perk Property Voracious60 Auto
Perk Property Voracious40 Auto
Perk Property Voracious20 Auto
Perk Property Voracious00 Auto

Perk Property SilentSwallow Auto

GlobalVariable Property NPCBonus Auto
GlobalVariable Property MinChance Auto

Message Property PredSightMessage Auto
Keyword Property Surrender Auto