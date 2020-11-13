Scriptname PredDevourmentScript extends activemagiceffect  

float PreyHP
actor thePrey
actor thePred
race OriginalRace
int Timer
int Rand
int Level
float Damage
float MaxTime
bool digested
bool surrendered
bool mage
bool warrior
bool thief

bool isAlt
bool isArg
bool isBos
bool isBre
bool isDun
bool isImp
bool isKha
bool isNor
bool isOrs
bool isRed

int PredSex
bool digestAnyway=false

Event OnEffectStart(Actor akTarget, Actor akCaster)
thePred=akTarget
thePrey=akCaster
digested=false
surrendered=false
PreyHP=thePrey.getActorValue("Health") as int
predSex=thePred.getLeveledActorBase().getSex()
if(predSex==1)
	NetImmerse.setNodeScale(thePred,"NPC Belly",1, false)
	NetImmerse.setNodeScale(thePred,"Devourment Belly Envelope S",1, false)
	NetImmerse.setNodeScale(thePred,"Devourment Belly Envelope N",1, false)

	if(thePrey.hasMagicEffectWithKeyword(Surrender))
		surrendered=true
	endif
	if(thePrey.getLeveledActorBase().getSex()==1)
		thePred.addItem(FullnessFPrey,1,true)
		thePred.equipItem(FullnessFPrey,true,true)
	else
		thePred.addItem(FullnessMPrey,1,true)
		thePred.equipItem(FullnessMPrey,true,true)
	endif
	if(thePrey!=Game.GetPlayer())
		thePrey.moveTo(HerStomach)
	else
		thePrey.setPosition(thePred.getPositionX()+2000,thePred.getPositionY()+2000,thePred.getPositionZ())
		thePrey.setAlpha(0)
		thePrey.setGhost(true)
		Game.DisablePlayerControls(true, true, true, false, true, true, true, false, 0)
		Game.setCameraTarget(thePred)
		thePrey.addSpell(NotThere, false)
		thePrey.clearExtraArrows()
		thePrey.setPlayerControls(false)
		thePrey.stopCombatAlarm()
		thePrey.stopCombat()
		thePred.setAlert(false)
		thePred.evaluatePackage()
	endif
	float PredSkill=0
	if(thePred==Game.GetPlayer())
		PredSkill=(thePred.getAV("Variable05")+15)
	else
		PredSkill=thePred.getAV("Variable05")+(thePred.getLevel()*1.7) as Int
		if(PredSkill>100)
			PredSkill=100
		endif
	endif

	; damage calc
	Damage=3.0*(0.5 + PredSkill/100.0)
	if(thePred.hasPerk(Acid80))
		Damage*=2.5
	elseif(thePred.hasPerk(Acid60))
		Damage*=2.0
	elseif(thePred.hasPerk(Acid60))
		Damage*=1.5
	endif
	if(thePred!=Game.getPlayer())
		Damage*=2.5
	endif
	Damage=Damage*(1+thePred.getAV("Fame")/100)
	Damage=Damage*(1-thePrey.getAV("FavorsPerDay")/100)
	if (damage<3)
		damage=3
	endif
	Damage=Damage/DTime.getValue()
	
	; time calc
	MaxTime=8.0*(1 + PredSkill/100.0)
	if(thePred.hasPerk(IronStomach75))
		MaxTime*=2.5
	elseif(thePred.hasPerk(IronStomach50))
		MaxTime*=2
	elseif(thePred.hasPerk(IronStomach25))
		MaxTime*=1.5
	endif
	if(thePred!=Game.getPlayer())
		MaxTime*=2
	endif
	MaxTime=MaxTime+thePred.getAV("Infamy")
	if (maxTime<10)
		maxTime=10
	endif
	MaxTime=MaxTime*DTime.getValue()

	; gain swallowing skill
	if(thePred==Game.GetPlayer() && !thePrey.isDead())
		float LevelGain = (thePrey.getLevel()/2.0)*(1-(15+thePred.getAV("Variable05"))/100)
		if(LevelGain>1.0)
			LevelGain=1.0
		elseif(LevelGain<0.0)
			LevelGain=0.0
		endif
		LevelGain*=100
		if(LevelGain<20&&thePred.getAV("Variable05")<35)
			LevelGain=20
		elseif(LevelGain<10&&thePred.getAV("Variable05")<60)
			LevelGain=10
		elseif(LevelGain<5&&thePred.getAV("Variable05")<85)
			LevelGain=5
		elseif(thePred.getAV("Variable05")>=85)
			LevelGain=0
		endif
		thePred.modAV("Variable02",LevelGain)
		if(thePred.getAV("Variable02")>=100)
			thePred.modAV("Variable02",-100)
			thePred.modAV("Variable05",1)
			VSkillLevelUp.show()
			VSkillLevelSound.play(thePred)
		endif
	endif

	RegisterForSingleUpdate(1)
	Timer=0

	mage=false
	warrior=false
	thief=false
	if(SkillGain.getValue()==4)
		mage=true
		warrior=true
		thief=true
	elseif(SkillGain.getValue()==3)
		thief=true
	elseif(SkillGain.getValue()==2)
		warrior=true
	elseif(SkillGain.getValue()==1)
		mage=true
	endif
	if(thePrey.getAV("FavorsPerDay")>0)
		; Debug.messageBox("Fuxxor")
		thePrey.dispelAllSpells()
		digestAnyway=true
		thePrey.setAV("FavorsPerDay",2)
	endif
elseif(predSex!=1)
	thePred.killEssential()
	Dispel()
	Debug.MessageBox(predSex)
	UnregisterForUpdate()
endif
EndEvent

Event OnUpdate()
if(thePred.isDead())
	Dispel()
	UnregisterForUpdate()
elseif(thePrey.getItemCount(Ipecac)>0)
	thePrey.removeItem(Ipecac,1)
	Dispel()
	UnregisterForUpdate()
else
	RegisterForSingleUpdate(1)
	Timer=Timer+1
	PreyHP=PreyHP-Damage
	if(thePrey==Game.GetPlayer()&&thePrey.getAV("Health")>Damage)
		thePrey.damageAV("Health",Damage)
	endif

	thePred.restoreAV("Health",1)
	thePred.damageAV("Health",1)
	if(!thePred.hasPerk(Nourish))
		thePred.restoreAV("Health",Damage)
		thePred.restoreAV("Stamina",Damage)
	else
		thePred.restoreAV("Health", Damage*2)
		thePred.restoreAV("Stamina",Damage*2)
	endif

	if(thePred.hasPerk(NourishMagic))
		thePred.restoreAV("Magicka",Damage)
	endif

	if (thePrey.IsDead()||PreyHP<=0)
		unregisterForUpdate()
		digested=true
		if(thePrey.IsEssential() && KillEssential.getValue()==0 && !digestAnyway)
			digested=false
		endif
		dispel()
	elseif (Timer>=MaxTime && !surrendered)
		unregisterForUpdate()
		dispel()
	else
		Rand=Utility.RandomInt(0,100)
		if(Rand<20)
			StomachSound.play(thePred)
		endif
	endif
endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
thePred.dispelSpell(devourmentSpell)
if((thePrey.IsDead()||PreyHP<=0))
	digested=true
	if(thePrey.IsEssential() && KillEssential.getValue()==0 && !digestAnyway)
		digested=false
	endif
endif
if(digested)
; gain some of the prey's skills and stats, possibly capture their soul
		if(!thePrey.isDead())
			if(thePred==Game.GetPlayer()) ;Only the player earns race perks
			;find out her race
			if(thePred.getRace()==Alt || thePred.getRace()==AltV)
				isAlt=true
			elseif(thePred.getRace()==Arg || thePred.getRace()==ArgV)
				isArg=true
			elseif(thePred.getRace()==Bos || thePred.getRace()==BosV)
				isBos=true
			elseif(thePred.getRace()==Bre || thePred.getRace()==BreV)
				isBre=true
			elseif(thePred.getRace()==Dun || thePred.getRace()==DunV)
				isDun=true
			elseif(thePred.getRace()==Imp || thePred.getRace()==ImpV)
				isImp=true
			elseif(thePred.getRace()==Kha || thePred.getRace()==KhaV)
				isKha=true
			elseif(thePred.getRace()==Nor || thePred.getRace()==NorV)
				isNor=true
			elseif(thePred.getRace()==Ors || thePred.getRace()==OrsV)
				isOrs=true
			elseif(thePred.getRace()==Red || thePred.getRace()==RedV)
				isRed=true
			endif

			if(thePrey.getRace()==Alt || thePrey.getRace()==AltV)
				EatAltmer.setValue(EatAltmer.getValue()+1)
				if(EatAltmer.getValue()==1)
					thePred.addSpell(Alt1)
				elseif(EatAltmer.getValue()==2)
					thePred.addSpell(Alt2)
					thePred.removeSpell(Alt1)
				elseif(EatAltmer.getValue()==4)
					thePred.addSpell(Alt4)
					thePred.removeSpell(Alt2)
				elseif(EatAltmer.getValue()==8)
					thePred.addSpell(Alt8)
					thePred.removeSpell(Alt4)
				elseif(EatAltmer.getValue()==16)
					thePred.addSpell(Alt16)
					thePred.removeSpell(Alt8)
				elseif(EatAltmer.getValue()==32)
					if(isAlt)
						thePred.addSpell(SameRace32)
					else
						thePred.addSpell(AltPower)
					endif
				endif
			elseif(thePrey.getRace()==Arg || thePrey.getRace()==ArgV)
				EatArgonian.setValue(EatArgonian.getValue()+1)
				if(EatArgonian.getValue()==1)
					thePred.addSpell(Arg1)
				elseif(EatArgonian.getValue()==2)
					thePred.addSpell(Arg2)
					thePred.removeSpell(Arg1)
				elseif(EatArgonian.getValue()==4)
					thePred.addSpell(Arg4)
					thePred.removeSpell(Arg2)
				elseif(EatArgonian.getValue()==8)
					thePred.addSpell(Arg8)
					thePred.removeSpell(Arg4)
				elseif(EatArgonian.getValue()==16)
					thePred.addSpell(Arg16)
					thePred.removeSpell(Arg8)
				elseif(EatArgonian.getValue()==32)
					if(isArg)
						thePred.addSpell(SameRace32)
					else
						thePred.addSpell(ArgPower)
					endif
				endif
			elseif(thePrey.getRace()==Bos || thePrey.getRace()==BosV)
				EatBosmer.setValue(EatBosmer.getValue()+1)
				if(EatBosmer.getValue()==1)
					thePred.addSpell(Bos1)
				elseif(EatBosmer.getValue()==2)
					thePred.addSpell(Bos2)
					thePred.removeSpell(Bos1)
				elseif(EatBosmer.getValue()==4)
					thePred.addSpell(Bos4)
					thePred.removeSpell(Bos2)
				elseif(EatBosmer.getValue()==8)
					thePred.addSpell(Bos8)
					thePred.removeSpell(Bos4)
				elseif(EatBosmer.getValue()==16)
					thePred.addSpell(Bos16)
					thePred.removeSpell(Bos8)
				elseif(EatBosmer.getValue()==32)
					if(isBos)
						thePred.addSpell(SameRace32)
					else
						thePred.addSpell(BosPower)
					endif
				endif
			elseif(thePrey.getRace()==Bre || thePrey.getRace()==BreV)
				EatBreton.setValue(EatBreton.getValue()+1)
				if(EatBreton.getValue()==1)
					thePred.addSpell(Bre1)
				elseif(EatBreton.getValue()==2)
					thePred.addSpell(Bre2)
					thePred.removeSpell(Bre1)
				elseif(EatBreton.getValue()==4)
					thePred.addSpell(Bre4)
					thePred.removeSpell(Bre2)
				elseif(EatBreton.getValue()==8)
					thePred.addSpell(Bre8)
					thePred.removeSpell(Bre4)
				elseif(EatBreton.getValue()==16)
					thePred.addSpell(Bre16)
					thePred.removeSpell(Bre8)
				elseif(EatBreton.getValue()==32)
					if(isBre)
						thePred.addSpell(SameRace32)
					else
						thePred.addSpell(BrePower)
					endif
				endif
			elseif(thePrey.getRace()==Dun || thePrey.getRace()==DunV)
				EatDunmer.setValue(EatDunmer.getValue()+1)
				if(EatDunmer.getValue()==1)
					thePred.addSpell(Dun1)
				elseif(EatDunmer.getValue()==2)
					thePred.addSpell(Dun2)
					thePred.removeSpell(Dun1)
				elseif(EatDunmer.getValue()==4)
					thePred.addSpell(Dun4)
					thePred.removeSpell(Dun2)
				elseif(EatDunmer.getValue()==8)
					thePred.addSpell(Dun8)
					thePred.removeSpell(Dun4)
				elseif(EatDunmer.getValue()==16)
					thePred.addSpell(Dun16)
					thePred.removeSpell(Dun8)
				elseif(EatDunmer.getValue()==32)
					if(isDun)
						thePred.addSpell(SameRace32)
					else
						thePred.addSpell(DunPower)
					endif
				endif
			elseif(thePrey.getRace()==Imp || thePrey.getRace()==ImpV)
				EatImperial.setValue(EatImperial.getValue()+1)
				if(EatImperial.getValue()==1)
					thePred.addSpell(Imp1)
				elseif(EatImperial.getValue()==2)
					thePred.addSpell(Imp2)
					thePred.removeSpell(Imp1)
				elseif(EatImperial.getValue()==4)
					thePred.addSpell(Imp4)
					thePred.removeSpell(Imp2)
				elseif(EatImperial.getValue()==8)
					thePred.addSpell(Imp8)
					thePred.removeSpell(Imp4)
				elseif(EatImperial.getValue()==16)
					thePred.addSpell(Imp16)
					thePred.removeSpell(Imp8)
				elseif(EatImperial.getValue()==32)
					if(isImp)
						thePred.addSpell(SameRace32)
					else
						thePred.addSpell(ImpPower)
					endif
				endif
			elseif(thePrey.getRace()==Kha || thePrey.getRace()==KhaV)
				EatKhajiit.setValue(EatKhajiit.getValue()+1)
				if(EatKhajiit.getValue()==1)
					thePred.addSpell(Kha1)
				elseif(EatKhajiit.getValue()==2)
					thePred.addSpell(Kha2)
					thePred.removeSpell(Kha1)
				elseif(EatKhajiit.getValue()==4)
					thePred.addSpell(Kha4)
					thePred.removeSpell(Kha2)
				elseif(EatKhajiit.getValue()==8)
					thePred.addSpell(Kha8)
					thePred.removeSpell(Kha4)
				elseif(EatKhajiit.getValue()==16)
					thePred.addSpell(Kha16)
					thePred.removeSpell(Kha8)
				elseif(EatKhajiit.getValue()==32)
					if(isKha)
						thePred.addSpell(SameRace32)
					else
						thePred.addSpell(KhaPower)
					endif
				endif
			elseif(thePrey.getRace()==Nor || thePrey.getRace()==NorV)
				EatNord.setValue(EatNord.getValue()+1)
				if(EatNord.getValue()==1)
					thePred.addSpell(Nor1)
				elseif(EatNord.getValue()==2)
					thePred.addSpell(Nor2)
					thePred.removeSpell(Nor1)
				elseif(EatNord.getValue()==4)
					thePred.addSpell(Nor4)
					thePred.removeSpell(Nor2)
				elseif(EatNord.getValue()==8)
					thePred.addSpell(Nor8)
					thePred.removeSpell(Nor4)
				elseif(EatNord.getValue()==16)
					thePred.addSpell(Nor16)
					thePred.removeSpell(Nor8)
				elseif(EatNord.getValue()==32)
					if(isNor)
						thePred.addSpell(SameRace32)
					else
						thePred.addSpell(NorPower)
					endif
				endif
			elseif(thePrey.getRace()==Ors || thePrey.getRace()==OrsV)
				EatOrsimer.setValue(EatOrsimer.getValue()+1)
				if(EatOrsimer.getValue()==1)
					thePred.addSpell(Ors1)
				elseif(EatOrsimer.getValue()==2)
					thePred.addSpell(Ors2)
					thePred.removeSpell(Ors1)
				elseif(EatOrsimer.getValue()==4)
					thePred.addSpell(Ors4)
					thePred.removeSpell(Ors2)
				elseif(EatOrsimer.getValue()==8)
					thePred.addSpell(Ors8)
					thePred.removeSpell(Ors4)
				elseif(EatOrsimer.getValue()==16)
					thePred.addSpell(Ors16)
					thePred.removeSpell(Ors8)
				elseif(EatOrsimer.getValue()==32)
					if(isOrs)
						thePred.addSpell(SameRace32)
					else
						thePred.addSpell(OrsPower)
					endif
				endif
			elseif(thePrey.getRace()==Red || thePrey.getRace()==RedV)
				EatRedguard.setValue(EatRedguard.getValue()+1)
				if(EatRedguard.getValue()==1)
					thePred.addSpell(Red1)
				elseif(EatRedguard.getValue()==2)
					thePred.addSpell(Red2)
					thePred.removeSpell(Red1)
				elseif(EatRedguard.getValue()==4)
					thePred.addSpell(Red4)
					thePred.removeSpell(Red2)
				elseif(EatRedguard.getValue()==8)
					thePred.addSpell(Red8)
					thePred.removeSpell(Red4)
				elseif(EatRedguard.getValue()==16)
					thePred.addSpell(Red16)
					thePred.removeSpell(Red8)
				elseif(EatRedguard.getValue()==32)
					if(isRed)
						thePred.addSpell(SameRace32)
					else
						thePred.addSpell(RedPower)
					endif
				endif
			endif
			else ; track NPC kills
				thePred.modAV("FavorsPerDayTimer",1)
			endif

			String highest=""
			Float highestVal=0
			
			if(mage)
			if(thePrey.getav("Illusion")>highestVal && thePrey.getAV("Illusion")>thePred.getAV("Illusion"))
				highest="Illusion"
				highestVal=thePrey.getAV("Illusion")
			endif
			if(thePrey.getav("Conjuration")>highestVal && thePrey.getAV("Conjuration")>thePred.getAV("Conjuration"))
				highest="Conjuration"
				highestVal=thePrey.getAV("Conjuration")
			endif
			if(thePrey.getav("Restoration")>highestVal && thePrey.getAV("Restoration")>thePred.getAV("Restoration"))
				highest="Restoration"
				highestVal=thePrey.getAV("Restoration")
			endif
			if(thePrey.getav("Destruction")>highestVal && thePrey.getAV("Destruction")>thePred.getAV("Destruction"))
				highest="Destruction"
				highestVal=thePrey.getAV("Destruction")
			endif
			if(thePrey.getav("Alteration")>highestVal && thePrey.getAV("Alteration")>thePred.getAV("Alteration"))
				highest="Alteration"
				highestVal=thePrey.getAV("Alteration")
			endif
			if(thePrey.getav("Enchanting")>highestVal && thePrey.getAV("Enchanting")>thePred.getAV("Enchanting"))
				highest="Enchanting"
				highestVal=thePrey.getAV("Enchanting")
			endif
			endif

			if(warrior)
			if(thePrey.getav("Smithing")>highestVal && thePrey.getAV("Smithing")>thePred.getAV("Smithing"))
				highest="Smithing"
				highestVal=thePrey.getAV("Smithing")
			endif
			if(thePrey.getav("OneHanded")>highestVal && thePrey.getAV("OneHanded")>thePred.getAV("OneHanded"))
				highest="OneHanded"
				highestVal=thePrey.getAV("OneHanded")
			endif
			if(thePrey.getav("TwoHanded")>highestVal && thePrey.getAV("TwoHanded")>thePred.getAV("TwoHanded"))
				highest="TwoHanded"
				highestVal=thePrey.getAV("TwoHanded")
			endif
			if(thePrey.getav("Marksman")>highestVal && thePrey.getAV("Marksman")>thePred.getAV("Marksman"))
				highest="Marksman"
				highestVal=thePrey.getAV("Marksman")
			endif
			if(thePrey.getav("Block")>highestVal && thePrey.getAV("Block")>thePred.getAV("Block"))
				highest="Block"
				highestVal=thePrey.getAV("Block")
			endif
			if(thePrey.getav("HeavyArmor")>highestVal && thePrey.getAV("HeavyArmor")>thePred.getAV("HeavyArmor"))
				highest="HeavyArmor"
				highestVal=thePrey.getAV("HeavyArmor")
			endif
			endif

			if(thief)
			if(thePrey.getav("LightArmor")>highestVal && thePrey.getAV("LightArmor")>thePred.getAV("LightArmor"))
				highest="LightArmor"
				highestVal=thePrey.getAV("LightArmor")
			endif
			if(thePrey.getav("Pickpocket")>highestVal && thePrey.getAV("Pickpocket")>thePred.getAV("Pickpocket"))
				highest="Pickpocket"
				highestVal=thePrey.getAV("Pickpocket")
			endif
			if(thePrey.getav("Lockpicking")>highestVal && thePrey.getAV("Lockpicking")>thePred.getAV("Lockpicking"))
				highest="Lockpicking"
				highestVal=thePrey.getAV("Lockpicking")
			endif
			if(thePrey.getav("Sneak")>highestVal && thePrey.getAV("Sneak")>thePred.getAV("Sneak"))
				highest="Sneak"
				highestVal=thePrey.getAV("Sneak")
			endif
			if(thePrey.getav("Alchemy")>highestVal && thePrey.getAV("Alchemy")>thePred.getAV("Alchemy"))
				highest="Alchemy"
				highestVal=thePrey.getAV("Alchemy")
			endif
			if(thePrey.getav("Speechcraft")>highestVal && thePrey.getAV("Speechcraft")>thePred.getAV("Speechcraft"))
				highest="Speechcraft"
				highestVal=thePrey.getAV("Speechcraft")
			endif
			endif
			
			if(highestVal!=0)
				if(thePred==Game.GetPlayer())
					Game.IncrementSkill(highest)
				else
					thePred.setAV(highest, thePred.getBaseAV(highest)+1)
				endif
				; Debug.MessageBox("Skill growth!")
			endif
			
			if(thePrey.getBaseActorValue("Health")>thePred.getBaseActorValue("Health"))
				if(thePred.hasPerk(ConsumeEssence))
					thePred.setActorValue("Health",thePred.getBaseActorValue("Health")+2)
				else
					thePred.setActorValue("Health",thePred.getBaseActorValue("Health")+1)
				endif
			endif
			if(thePrey.getBaseActorValue("Stamina")>thePred.getBaseActorValue("Stamina"))
				if(thePred.hasPerk(ConsumeEssence))
					thePred.setActorValue("Stamina",thePred.getBaseActorValue("Stamina")+2)
				else
					thePred.setActorValue("Stamina",thePred.getBaseActorValue("Stamina")+1)
				endif
			endif
			if(thePrey.getBaseActorValue("Magicka")>thePred.getBaseActorValue("Magicka"))
				if(thePred.hasPerk(ConsumeEssence))
					thePred.setActorValue("Magicka",thePred.getBaseActorValue("Magicka")+2)
				else
					thePred.setActorValue("Magicka",thePred.getBaseActorValue("Magicka")+1)
				endif
			endif

			if(thePred.hasPerk(SoulFood))
				thePred.addItem(Soul,1,true)
			endif

			; gain perk point
			if(thePred==Game.getPlayer())
			victimsToPerk.setValue(victimsToPerk.getValue()+1)
			if(victimsToPerk.getValue()>= (3+prevPerkPoints.getValue()))
				perkMessage.show()
				VSkillLevelSound.play(thePred)
				victimsToPerk.setValue(0)
				perkPoints.setValue(perkPoints.getValue()+1)
				prevPerkPoints.setValue(prevPerkPoints.getValue()+1)
			endif
			endif
		endif

		; enable player digestion viewing
		if(thePrey==Game.getPlayer())
			playerDigestMessage.show()
			thePrey.say(playerDeathScream,thePrey,true)
			deathMusic.add()
			thePrey.resethealthandlimbs()
		endif

		;thePrey.setPosition(thePred.getPositionX(),thePred.getPositionY(),thePred.getPositionZ())
		bool protected=false
		BurpSound.playAndWait(thePred)
		; thePrey.setScale(1)
		thePrey.enable(0)
		if(thePrey.getLeveledActorBase().isProtected())
			protected=true
			thePrey.getLeveledActorBase().setProtected(false)
		endif
		if(thePrey!=Game.getPlayer())
			thePrey.killEssential(thePred)
		endif
		if(protected)
			thePrey.GetLeveledActorBase().setProtected(true)
		endif
		
		int oldweight=thePred.getLeveledActorBase().getWeight() as Int
		; Debug.messageBox(weight)
		if(oldweight<100&&weightGlobal.getValueInt()>0)
			int weight=oldweight+weightGlobal.getValueInt()
			; Debug.messageBox(weight)
			if(weight>100)
				weight=100
			endif
			float neckdelta=(weight/100)-(oldweight/100)
			thePred.getLeveledActorBase().setWeight(weight)
			thePred.updateWeight(neckdelta)
			thePred.QueueNiNodeUpdate()
		endif

		if(thePrey.hasKeyword(summoned))
			thePrey.removeAllItems()
		endif

		; replace fullness with dead character
		thePred.removeItem(fullnessTypes,99,true)
		thePred.equipItem(fullnessDead,true,true)

		DigestionVisualSpell.cast(thePred)
		int digestionFailsafeTimer=0

		; delay prey's final fate until digestion is complete
		if(thePrey==Game.getPlayer())
			int reminder=0
			while(thePred.hasMagicEffect(DigestionVisualSpellEffect))
				Rand=Utility.RandomInt(0,1000)
				if(Rand<20)
					StomachSound.play(thePred)
				endif
				; thePrey.setPosition(thePred.getPositionX()+50,thePred.getPositionY()+50,thePred.getPositionZ()+2000)
				thePred.restoreAV("Health",1)
				thePred.damageAV("Health",1)
				if(!thePred.hasPerk(Nourish))
					thePred.restoreAV("Health",Damage)
					thePred.restoreAV("Stamina",Damage)
				else
					thePred.restoreAV("Health", Damage*2)
					thePred.restoreAV("Stamina",Damage*2)
				endif
				if(thePred.hasPerk(NourishMagic))
					thePred.restoreAV("Magicka",Damage)
				endif
				utility.wait(0.1)
				reminder+=1
				if(reminder>99)
					reminder=0
					playerDigestMessage.show()
				endif
				if(Input.IsKeyPressed(44))
					thePred.addSpell(DigestionVisualCancelSpell)
				endif
				digestionFailsafeTimer=digestionFailsafeTimer+1
				if(digestionFailsafeTimer>minTime.getValueInt()+20)
					Debug.MessageBox("Digestion scaling failsafe activated. Please make a bug report.")
					thePred.dispelSpell(DigestionVisualSpell)
				endif
			endwhile
			thePrey.removeSpell(NotThere)
			thePrey.moveto(thePred)
			if(NewPlayerGlobal.getValueInt()==0)
				thePrey.killEssential(thePred)
			endif
		else
			while(thePred.hasMagicEffect(DigestionVisualSpellEffect))
				Rand=Utility.RandomInt(0,100)
				if(Rand<20)
					StomachSound.play(thePred)
				endif
				Utility.wait(1)
				thePred.restoreAV("Health",1)
				thePred.damageAV("Health",1)
				if(!thePred.hasPerk(Nourish))
					thePred.restoreAV("Health",2)
					thePred.restoreAV("Stamina",2)
				else
					thePred.restoreAV("Health", 4)
					thePred.restoreAV("Stamina",4)
				endif
				if(thePred.hasPerk(NourishMagic))
					thePred.restoreAV("Magicka",2)
				endif
				digestionFailsafeTimer=digestionFailsafeTimer+10
				if(digestionFailsafeTimer>minTime.getValueInt()+20)
					Debug.MessageBox("Digestion scaling failsafe activated. Please make a bug report.")
					thePred.dispelSpell(DigestionVisualSpell)
				endif
			endwhile
		endif

		; make sure followers don't dump in your house
		if(thePred.isPlayerTeammate()&&ScatGlobal.getValue()!=0)
			while(thePred.getParentCell().getFactionOwner()==playerFaction)
				Utility.wait(2)
			endwhile
		endif

		; finally, get rid of the prey
		if(ScatGlobal.getValue()==1)
			if(thePred==Game.GetPlayer())
				PoopMessage.show()
				While(!thePred.isSneaking())
					Utility.Wait(0.1)
				EndWhile
				ObjectReference deadPlayer=thePred.placeatme(Poop)
				deadPlayer.setAngle(0,0,0)
				thePrey.removeAllItems(deadPlayer,false,true)
				DigestionVisualSpellToo.cast(thePred)
				ScatSound.playAndWait(thePred)
				thePred.removeItem(FullnessTypes,99,true)
			else
				ObjectReference deadPlayer=thePred.placeatme(Poop)
				deadPlayer.setAngle(0,0,0)
				thePrey.removeAllItems(deadPlayer,false,true)
				if(thePrey!=Game.GetPlayer())
				else
					thePrey.moveTo(thePred)
					thePrey.setPosition(thePred.getPositionX(), thePred.getPositionY(), thePred.getPositionZ())
				endif
				DigestionVisualSpellToo.cast(thePred)
				ScatSound.playAndWait(thePred)
				thePred.removeItem(FullnessTypes,99,true)
			endif
		elseif (ScatGlobal.getValue()==2)
			tempPrey.forceRefTo(thePrey)
			tempPred.forceRefTo(thePred)
			TempHP.setValue(0)
			TempDigested.setValue(1)
			if(thePrey==Game.GetPlayer())
				TempHp.setValue(thePrey.getAV("Health"))
			endif
			pukeGlobal.setValue(2)
			DigestionVisualSpellToo.cast(thePred)
			PukeQueue.start()
			PukeQueue.registerForUpdate(0.1)	
		elseif (ScatGlobal.getValue()==3)
			if(thePred==Game.GetPlayer())
				BonesMessage.show()
				While(!thePred.isSneaking())
					Utility.Wait(0.1)
				EndWhile
				DigestionVisualSpellToo.cast(thePred)
				BoneSound.play(thePred)
				Actor deadPlayer=thePred.placeatme(skeleton) as Actor
				deadPlayer.setPosition(thePred.getPositionX(),thePred.getPositionY(),thePred.getPositionZ())
				deadPlayer.setScale(0.5)
				; deadPlayer.setAngle(0,69,0)
				deadPlayer.kill()
				ObjectReference boom=deadPlayer.placeAtMe(BoneExplosion)
				; deadPlayer.setAngle(0,90,0)
				thePrey.removeAllItems(deadPlayer,false,true)
				; thePred.pushActorAway(deadPlayer,4)
				Utility.wait(0.1)
				deadPlayer.setScale(1)
				Utility.wait(0.5)
				thePred.removeItem(FullnessTypes,99,true)
			else
				DigestionVisualSpellToo.cast(thePred)
				BoneSound.play(thePred)
				Actor deadPlayer=thePred.placeatme(skeleton) as Actor
				deadPlayer.setPosition(thePred.getPositionX(),thePred.getPositionY(),-20+thePred.getPositionZ())
				; deadPlayer.setAngle(0,69,0)
				deadPlayer.setScale(0.5)
				deadPlayer.kill()
				ObjectReference boom=deadPlayer.placeAtMe(BoneExplosion)
				thePrey.removeAllItems(deadPlayer,false,true)
				if(thePrey!=Game.GetPlayer())

				else
					thePrey.moveTo(thePred)
					thePrey.setPosition(thePred.getPositionX(), thePred.getPositionY(), thePred.getPositionZ())
				endif
				Utility.wait(0.1)
				deadPlayer.setScale(1)
				Utility.wait(0.5)
				thePred.removeItem(FullnessTypes,99,true)
			endif
		else
			DigestionVisualSpellToo.cast(thePred)
			thePrey.removeAllItems(thePred,false,true)
			thePred.removeItem(FullnessTypes,99,true)
		endif

		if(thePrey==Game.GetPlayer()&&NewPlayerGlobal.getValueInt()!=0&&Game.getPlayer().getActorBase().getSex()==1)
				NameQuest.switchPlayer(thePred, thePrey)
		endif
else
		tempPrey.forceRefTo(thePrey)
		tempPred.forceRefTo(thePred)
		TempHP.setValue(PreyHP)
		TempDigested.setValue(0)
		if(thePrey==Game.GetPlayer())
			TempHp.setValue(thePrey.getAV("Health"))
		endif
		pukeGlobal.setValue(2)
		PukeQueue.start()
		PukeQueue.registerForUpdate(0.1)	
endif
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if(thePrey==Game.getPlayer())
		thePrey.setPosition(thePred.getPositionX()+2000,thePred.getPositionY()+2000,thePred.getPositionZ())
		thePrey.moveTo(thePred)
	endif
EndEvent

Event OnCellAttach()
	if(thePrey==Game.getPlayer())
		thePrey.setPosition(thePred.getPositionX()+2000,thePred.getPositionY()+2000,thePred.getPositionZ())
		thePrey.moveTo(thePred)
	endif
EndEvent

ReferenceAlias Property TempPrey auto
ReferenceAlias Property TempPred auto
GlobalVariable Property PukeGlobal auto
Quest Property PukeQueue auto

GlobalVariable Property ScatGlobal auto
GlobalVariable Property TempHP auto
GlobalVariable Property TempDigested auto
ReferenceAlias Property PreyAlias auto
SPELL Property DevourmentSpell  Auto  
ObjectReference Property HerStomach Auto

Sound Property BurpSound Auto
Sound Property StomachSound Auto

Idle Property NormalIdle  Auto  

Armor Property FullnessFPrey  Auto  
Armor Property FullnessMPrey Auto
Armor Property FullnessDead Auto
Armor Property FullnessShrinking Auto
FormList Property FullnessTypes Auto

SPELL Property PoopSpell  Auto  

Perk Property IronStomach25 Auto
Perk Property IronStomach50 Auto
Perk Property IronStomach75 Auto

Perk Property Acid30 Auto
Perk Property Acid60 Auto
Perk Property Acid80 Auto

Perk Property Nourish Auto
Perk Property NourishMagic Auto

Perk Property ConsumeEssence Auto

Perk Property SoulFood Auto
SoulGem Property Soul Auto

Message Property VSkillLevelUp Auto
Sound Property VSkillLevelSound Auto
Message Property perkMessage  Auto  

GlobalVariable Property perkPoints  Auto  

GlobalVariable Property prevPerkPoints  Auto  

GlobalVariable Property victimsToPerk  Auto  

GlobalVariable Property DTime  Auto  

GlobalVariable Property SkillGain  Auto  

GlobalVariable Property KillEssential  Auto  

GlobalVariable Property EatAltmer Auto
GlobalVariable Property EatArgonian Auto
GlobalVariable Property EatBosmer Auto
GlobalVariable Property EatBreton Auto
GlobalVariable Property EatDunmer Auto
GlobalVariable Property EatImperial Auto
GlobalVariable Property EatKhajiit Auto
GlobalVariable Property EatNord Auto
GlobalVariable Property EatOrsimer Auto
GlobalVariable Property EatRedguard Auto

Spell Property Alt1 Auto
Spell Property Alt2 Auto
Spell Property Alt4 Auto
Spell Property Alt8 Auto
Spell Property Alt16 Auto
Spell Property AltPower Auto

Spell Property Arg1 Auto
Spell Property Arg2 Auto
Spell Property Arg4 Auto
Spell Property Arg8 Auto
Spell Property Arg16 Auto
Spell Property ArgPower Auto

Spell Property Bos1 Auto
Spell Property Bos2 Auto
Spell Property Bos4 Auto
Spell Property Bos8 Auto
Spell Property Bos16 Auto
Spell Property BosPower Auto

Spell Property Bre1 Auto
Spell Property Bre2 Auto
Spell Property Bre4 Auto
Spell Property Bre8 Auto
Spell Property Bre16 Auto
Spell Property BrePower Auto

Spell Property Dun1 Auto
Spell Property Dun2 Auto
Spell Property Dun4 Auto
Spell Property Dun8 Auto
Spell Property Dun16 Auto
Spell Property DunPower Auto

Spell Property Imp1 Auto
Spell Property Imp2 Auto
Spell Property Imp4 Auto
Spell Property Imp8 Auto
Spell Property Imp16 Auto
Spell Property ImpPower Auto

Spell Property Kha1 Auto
Spell Property Kha2 Auto
Spell Property Kha4 Auto
Spell Property Kha8 Auto
Spell Property Kha16 Auto
Spell Property KhaPower Auto

Spell Property Nor1 Auto
Spell Property Nor2 Auto
Spell Property Nor4 Auto
Spell Property Nor8 Auto
Spell Property Nor16 Auto
Spell Property NorPower Auto

Spell Property Ors1 Auto
Spell Property Ors2 Auto
Spell Property Ors4 Auto
Spell Property Ors8 Auto
Spell Property Ors16 Auto
Spell Property OrsPower Auto

Spell Property Red1 Auto
Spell Property Red2 Auto
Spell Property Red4 Auto
Spell Property Red8 Auto
Spell Property Red16 Auto
Spell Property RedPower Auto

Spell Property SameRace32 Auto

Race Property Alt Auto
Race Property AltV Auto

Race Property Arg Auto
Race Property ArgV Auto

Race Property Bos Auto
Race Property BosV Auto

Race Property Bre Auto
Race Property BreV Auto

Race Property Dun Auto
Race Property DunV Auto

Race Property Imp Auto
Race Property ImpV Auto

Race Property Kha Auto
Race Property KhaV Auto

Race Property Nor Auto
Race Property NorV Auto

Race Property Ors Auto
Race Property OrsV Auto

Race Property Red Auto
Race Property RedV Auto
SPELL Property PoopSpellNPC  Auto  

EffectShader Property NoPlayerShader  Auto  

GlobalVariable Property MinTime Auto

MiscObject Property Ipecac Auto

Container Property Poop Auto
Sound Property ScatSound Auto
Message Property PoopMessage Auto
Keyword Property Surrender  Auto  
Keyword Property Summoned Auto

GlobalVariable Property WeightGlobal Auto

Message Property BonesMessage Auto
Explosion Property BoneExplosion Auto
Sound Property BoneSound Auto

Message Property playerDigestMessage Auto
Topic Property playerDeathScream Auto
MusicType property deathMusic Auto
Spell Property NotThere Auto

Message Property NewPlayerMessage  Auto 
GlobalVariable Property NewPlayerGlobal  Auto  
DevourmentNameScript Property NameQuest Auto

Spell Property Scent Auto
Spell Property ScentSpell Auto

ActorBase Property Skeleton Auto

Spell Property DigestionVisualSpell Auto
Spell Property DigestionVisualCancelSpell Auto
Spell Property DigestionVisualSpellToo Auto
MagicEffect Property DigestionVisualSpellEffect Auto

Faction Property playerFaction Auto