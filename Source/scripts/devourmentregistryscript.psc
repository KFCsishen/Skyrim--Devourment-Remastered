Scriptname DevourmentRegistryScript extends Quest Conditional

Activator Property VomitActivator Auto

ActorBase Property Skeleton Auto

Actor Property VomitedPrey Auto

Armor Property FullnessDead Auto
Armor Property FullnessFPrey Auto
Armor Property FullnessMPrey Auto
Armor Property FullnessNonlethal Auto

Container Property Poop Auto

Explosion Property BoneExplosion Auto

Faction Property PlayerFaction Auto
Faction Property Follower Auto

FormList Property FullnessTypes Auto

GlobalVariable Property DTime Auto
GlobalVariable Property KillEssential Auto
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
GlobalVariable Property NewPlayerGlobal Auto
GlobalVariable Property PerkPoints Auto
GlobalVariable Property PrevPerkPoints Auto
GlobalVariable Property ScatGlobal Auto
GlobalVariable Property SkillGain Auto
GlobalVariable Property VictimsToPerk Auto
GlobalVariable Property WeightGlobal Auto
GlobalVariable Property TimeScale Auto
GlobalVariable Property DeadDigestionTime Auto
GlobalVariable Property ReadyToVomit Auto

Keyword Property Summoned Auto
Keyword Property Surrender Auto
Keyword Property NPC Auto

Message Property BonesMessage Auto
Message Property PerkMessage Auto
Message Property PlayerDigestMessage Auto
Message Property PoopMessage Auto
Message Property VSkillLevelUp Auto
Message Property UnclogMessage Auto
Message Property PukeMessage Auto

MiscObject Property Ipecac Auto

MusicType Property DeathMusic Auto

ObjectReference Property HerStomach Auto

Perk Property Acid30 Auto
Perk Property Acid60 Auto
Perk Property Acid90 Auto
Perk Property ConsumeEssence Auto
Perk Property IronStomach25 Auto
Perk Property IronStomach50 Auto
Perk Property IronStomach75 Auto
Perk Property Nourish Auto
Perk Property NourishMagic Auto
Perk Property SoulFood Auto

DevourmentNameScript Property NameQuest Auto

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

ReferenceAlias Property DialogPreyAlias Auto
ReferenceAlias Property DialogPredAlias Auto

Shout Property VomitMeShout Auto

SoulGem Property Soul Auto

Sound Property BoneSound Auto
Sound Property BurpSound Auto
Sound Property ScatSound Auto
Sound Property StomachSound Auto
Sound Property VSkillLevelSound Auto
Sound Property VomitSound Auto

Spell Property NotThere Auto
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
Spell Property DigestionVisualSpellToo Auto
Spell Property StayAtPredLocation Auto
Spell Property ScalingCancelSpell Auto
Spell Property VomitSpell Auto
Spell Property VomitSpellDead Auto
Spell Property VomitSpellScent Auto
Spell Property DummySpell Auto

Spell Property ScriptedSwallow Auto
Spell Property ScriptedEndo Auto

Topic Property Scream Auto

WordOfPower Property VomitWord Auto

DevourmentEventHandler[] handlers
int numHandlers

Actor[] predArray
Actor[] preyArray
int[] digestionFlags
float[] digestionTimers
float[] digestionDamage
bool[] digestionSurrender
int numDigestions

Actor[] vomitPredArray
Actor[] vomitPreyArray
int[] vomitTypeArray
int[] vomitFlagsArray
int numVomits
int vomitFailsafeTimer

Actor[] tummyPredArray
Actor[] tummyPreyArray
int[] tummyTimers
int[] tummyMaximumTimers
int[] tummyFlags
int numTummies

Actor[] blockArray
int numBlocks

Race[] modPredators
Idle[] modPredatorIdles
Armor[] modPredatorBellies
int numModPredators

float lastTimeProcessed
int playerDigestionReminder

bool Property activatedDialog Auto Conditional
bool Property playerPrey Auto Conditional
bool Property lethal Auto Conditional

float B1=0.22
float S1=2.7
float N1=0.7

Event OnInit()
	handlers=new DevourmentEventHandler[128]
	numHandlers=0

	predArray=new Actor[128]
	preyArray=new Actor[128]
	digestionFlags=new int[128]
	digestionTimers=new float[128]
	digestionDamage=new float[128]
	digestionSurrender=new bool[128]
	numDigestions=0

	vomitPredArray=new Actor[128]
	vomitPreyArray=new Actor[128]	
	vomitTypeArray=new int[128]
	vomitFlagsArray=new int[128]
	numVomits=0
	vomitFailsafeTimer=0

	tummyPredArray=new Actor[128]
	tummyPreyArray=new Actor[128]
	tummyTimers=new int[128]
	tummyMaximumTimers=new int[128]
	tummyFlags=new int[128]
	numTummies=0
	
	blockArray=new Actor[128]
	numBlocks=0

	modPredators=new Race[128]
	modPredatorIdles=new Idle[128]
	modPredatorBellies=new Armor[128]
	numModPredators=0
	
	lastTimeProcessed=Utility.getCurrentGameTime()
	playerDigestionReminder=0

	RegisterForKey(34)
	RegisterForSingleUpdate(0.1)
EndEvent

Function ZeroPointSevenUpdate()
	digestionFlags=new int[128]
	handlers=new DevourmentEventHandler[128]
	numHandlers=0
	modPredators=new Race[128]
	modPredatorIdles=new Idle[128]
	modPredatorBellies=new Armor[128]
	numModPredators=0
	vomitFlagsArray=new int[128]
	tummyFlags=new int[128]
	RegisterForKey(34)
EndFunction

Function RegisterDigestion(Actor pred, Actor prey, int flags)
; Debug.messageBox("REGISTERING "+pred+"/"+prey+" in slot "+numDigestions+" with flags "+flags)
if(pred.getLeveledActorBase().getSex()==1 || (!pred.hasKeyword(NPC)&&isModPredatorRace(pred.getLeveledActorBase().getRace())))

	predArray[numDigestions]=pred
	preyArray[numDigestions]=prey
	digestionFlags[numDigestions]=flags
	digestionSurrender[numDigestions]=prey.hasMagicEffectWithKeyword(Surrender)

	NetImmerse.setNodeScale(pred,"NPC Belly",1, false)
	NetImmerse.setNodeScale(pred,"Devourment Belly Envelope S",1, false)
	NetImmerse.setNodeScale(pred,"Devourment Belly Envelope N",1, false)

	if(flags>0)
		if(!isModPredatorRace(pred.getLeveledActorBase().getRace()))
			if(prey.getLeveledActorBase().getSex()==1)
				pred.addItem(FullnessFPrey,1,true)
				pred.equipItem(FullnessFPrey,true,true)
			else
				pred.addItem(FullnessMPrey,1,true)
				pred.equipItem(FullnessMPrey,true,true)
			endif
		else
			Armor belly=modPredatorBellies[modPredators.find(pred.getLeveledActorBase().getRace())]
			pred.addItem(belly,1,true)
			pred.equipItem(belly,true,true)
		endif
	else
		if(!isModPredatorRace(pred.getLeveledActorBase().getRace()))
			pred.addItem(FullnessNonlethal,1,true)
			pred.equipItem(FullnessNonlethal,true,true)
		else
			Armor belly=modPredatorBellies[modPredators.find(pred.getLeveledActorBase().getRace())]
			pred.addItem(belly,1,true)
			pred.equipItem(belly,true,true)
		endif
		if(prey==Game.getPlayer())
				prey.setPlayerControls(false)
				prey.enableAI(false)
				if(pred.isInFaction(follower) && prey==Game.getPlayer())
					pred.setPlayerControls(true)
					pred.EnableAI(true)
				endif
				PukeMessage.show()
				game.unlockWord(VomitWord)
				prey.equipShout(VomitMeShout)
				prey.equipSpell(DummySpell,1)
				prey.equipSpell(DummySpell,0)
				prey.unequipSpell(DummySpell,1)
				prey.unequipSpell(DummySpell,0)
				prey.setVoiceRecoveryTime(0)
		endif
	endif

	if(prey!=Game.GetPlayer())
		prey.moveTo(HerStomach)
	else
		StayAtPredLocation.cast(prey, pred)
		prey.setPosition(pred.getPositionX()+2000,pred.getPositionY()+2000,pred.getPositionZ())
		prey.setAlpha(0)
		prey.setGhost(true)
		if(flags>0)
			Game.DisablePlayerControls(true, true, true, false, true, true, true, false, 0)
		else
			Game.DisablePlayerControls(false, false, false, false, false, true, true, false, 0)
		endif
		Game.setCameraTarget(pred)
		prey.addSpell(NotThere, false)
		prey.clearExtraArrows()
		prey.setPlayerControls(false)
		prey.stopCombatAlarm()
		prey.stopCombat()
		pred.stopCombat()
		pred.setAlert(false)
		pred.evaluatePackage()
	endif

	if(flags>0)
		digestionTimers[numDigestions]=getDigestionTime(pred)*5
		digestionDamage[numDigestions]=getDigestionDamage(pred,prey)/5
	
		if(pred==Game.GetPlayer() && !prey.isDead())
			float LevelGain = (prey.getLevel()/2.0)*(1-(15+pred.getAV("Variable05"))/100)
			if(LevelGain>1.0)
				LevelGain=1.0
			elseif(LevelGain<0.0)
				LevelGain=0.0
			endif
			LevelGain*=100
			if(LevelGain<20&&pred.getAV("Variable05")<35)
				LevelGain=20
			elseif(LevelGain<10&&pred.getAV("Variable05")<60)
				LevelGain=10
			elseif(LevelGain<5&&pred.getAV("Variable05")<85)
				LevelGain=5
			elseif(pred.getAV("Variable05")>=85)
				LevelGain=0
			endif
			pred.modAV("Variable02",LevelGain)
			if(pred.getAV("Variable02")>=100)
				pred.modAV("Variable02",-100)
				pred.modAV("Variable05",1)
				VSkillLevelUp.show()
				VSkillLevelSound.play(pred)
			endif
		endif
	endif

	numDigestions=numDigestions+1
	SendDevourmentEvent(1,pred,prey,flags,0,false)
endif
EndFunction

float Function getDigestionTime(Actor pred)
	float maxTime=0

	float PredSkill=0
	if(pred==Game.GetPlayer())
		PredSkill=(pred.getAV("Variable05")+15)
	else
		PredSkill=pred.getAV("Variable05")+(pred.getLevel()*1.7) as Int
		if(PredSkill>100)
			PredSkill=100
		endif
	endif

	maxTime=8.0*(1 + PredSkill/100.0)
	if(pred.hasPerk(IronStomach75))
		maxTime*=2.5
	elseif(pred.hasPerk(IronStomach50))
		maxTime*=2
	elseif(pred.hasPerk(IronStomach25))
		maxTime*=1.5
	endif
	if(pred!=Game.getPlayer())
		maxTime*=2
	endif
	maxTime=maxTime+pred.getAV("Infamy")
	if (maxTime<10)
		maxTime=10
	endif
	maxTime=maxTime*DTime.getValue()

	return maxTime
EndFunction

float Function getDigestionDamage(Actor pred, Actor prey)
	float damage=0

	float PredSkill=0
	if(pred==Game.GetPlayer())
		PredSkill=(pred.getAV("Variable05")+15)
	else
		PredSkill=pred.getAV("Variable05")+(pred.getLevel()*1.7) as Int
		if(PredSkill>100)
			PredSkill=100
		endif
	endif

	Damage=3.0*(0.5 + PredSkill/100.0)
	if(pred.hasPerk(Acid90))
		Damage*=2.5
	elseif(pred.hasPerk(Acid60))
		Damage*=2.0
	elseif(pred.hasPerk(Acid30))
		Damage*=1.5
	endif
	if(pred!=Game.getPlayer())
		Damage*=2.5
	endif
	Damage=Damage*(1+pred.getAV("Fame")/100)
	if(prey!=pred)
		Damage=Damage*(1-prey.getAV("FavorsPerDay")/100)
	endif
	if (damage<3)
		damage=3
	endif
	Damage=Damage/DTime.getValue()

	return damage
EndFunction

Function Digest(int index, int times)
	Actor pred=predArray[index]
	Actor prey=preyArray[index]

	if(Utility.RandomInt(0,100)<3)
		StomachSound.play(pred)
	endif

	if(digestionFlags[index]<0)
		if(pred.isInFaction(follower)&&prey==Game.getPlayer()&&pred.getAnimationVariableBool("bInJumpState"))
			prey.PushActorAway(pred,0)
		endif
		if(prey==game.getPlayer()&&prey.getVoiceRecoveryTime()>0)
			prey.unequipShout(VomitMeShout)
			prey.removeShout(VomitMeShout)
			registerVomit(prey,1)
			pred.setPlayerControls(false)
			pred.EnableAI(true)
		endif
		return
	endif

	if(pred.isDead())
		registerVomit(prey,1)
		return
	elseif(prey.getItemCount(Ipecac)>0)
		prey.removeItem(Ipecac,1)
		registerVomit(prey,1)
		return
	endif

	int realtimes=0
	if(times<=digestionTimers[index])
		realtimes=times
		digestionTimers[index]=digestionTimers[index]-times
	else
		realtimes=digestionTimers[index] as Int
		digestionTimers[index]=0
	endif

	prey.damageAV("Health",digestionDamage[index]*realtimes)

	if(!pred.hasPerk(Nourish))
		pred.restoreAV("Health",digestionDamage[index]*realtimes)
		pred.restoreAV("Stamina",digestionDamage[index]*realtimes)
	else
		pred.restoreAV("Health",digestionDamage[index]*2*realtimes)
		pred.restoreAV("Stamina",digestionDamage[index]*2*realtimes)
	endif

	if(pred.hasPerk(NourishMagic))
		pred.restoreAV("Magicka",digestionDamage[index]*realtimes)
	endif

	SendDevourmentEvent(3,pred,prey,digestionFlags[index],realtimes,false)
	
	if(prey.isDead()||prey.getAV("Health")<0||(prey==game.getPlayer()&&prey.getAVPercentage("Health")<0.05))
		if(prey.isEssential() && KillEssential.getValue()==0)
			RegisterVomit(prey,1)
			return
		endif
		FinishDigestion(index)
		return
	endif

	if(digestionTimers[index]<=0 && !digestionSurrender[index])
		RegisterVomit(prey,1)
		return
	endif
EndFunction

Function FinishDigestion(int index)
	Actor pred=predArray[index]
	Actor prey=preyArray[index]

	bool isAlt=false
	bool isArg=false
	bool isBos=false
	bool isBre=false
	bool isDun=false
	bool isImp=false
	bool isKha=false
	bool isNor=false
	bool isOrs=false
	bool isRed=false

	if(pred==Game.getPlayer())
		if(pred.getRace()==Alt || pred.getRace()==AltV)
			isAlt=true
		elseif(pred.getRace()==Arg || pred.getRace()==ArgV)
			isArg=true
		elseif(pred.getRace()==Bos || pred.getRace()==BosV)
			isBos=true
		elseif(pred.getRace()==Bre || pred.getRace()==BreV)
			isBre=true
		elseif(pred.getRace()==Dun || pred.getRace()==DunV)
			isDun=true
		elseif(pred.getRace()==Imp || pred.getRace()==ImpV)
			isImp=true
		elseif(pred.getRace()==Kha || pred.getRace()==KhaV)
			isKha=true
		elseif(pred.getRace()==Nor || pred.getRace()==NorV)
			isNor=true
		elseif(pred.getRace()==Ors || pred.getRace()==OrsV)
			isOrs=true
		elseif(pred.getRace()==Red || pred.getRace()==RedV)
			isRed=true
		endif

			if(prey.getRace()==Alt || prey.getRace()==AltV)
				EatAltmer.setValue(EatAltmer.getValue()+1)
				if(EatAltmer.getValue()==1)
					pred.addSpell(Alt1)
				elseif(EatAltmer.getValue()==2)
					pred.addSpell(Alt2)
					pred.removeSpell(Alt1)
				elseif(EatAltmer.getValue()==4)
					pred.addSpell(Alt4)
					pred.removeSpell(Alt2)
				elseif(EatAltmer.getValue()==8)
					pred.addSpell(Alt8)
					pred.removeSpell(Alt4)
				elseif(EatAltmer.getValue()==16)
					pred.addSpell(Alt16)
					pred.removeSpell(Alt8)
				elseif(EatAltmer.getValue()==32)
					if(isAlt)
						pred.addSpell(SameRace32)
					else
						pred.addSpell(AltPower)
					endif
				endif
			elseif(prey.getRace()==Arg || prey.getRace()==ArgV)
				EatArgonian.setValue(EatArgonian.getValue()+1)
				if(EatArgonian.getValue()==1)
					pred.addSpell(Arg1)
				elseif(EatArgonian.getValue()==2)
					pred.addSpell(Arg2)
					pred.removeSpell(Arg1)
				elseif(EatArgonian.getValue()==4)
					pred.addSpell(Arg4)
					pred.removeSpell(Arg2)
				elseif(EatArgonian.getValue()==8)
					pred.addSpell(Arg8)
					pred.removeSpell(Arg4)
				elseif(EatArgonian.getValue()==16)
					pred.addSpell(Arg16)
					pred.removeSpell(Arg8)
				elseif(EatArgonian.getValue()==32)
					if(isArg)
						pred.addSpell(SameRace32)
					else
						pred.addSpell(ArgPower)
					endif
				endif
			elseif(prey.getRace()==Bos || prey.getRace()==BosV)
				EatBosmer.setValue(EatBosmer.getValue()+1)
				if(EatBosmer.getValue()==1)
					pred.addSpell(Bos1)
				elseif(EatBosmer.getValue()==2)
					pred.addSpell(Bos2)
					pred.removeSpell(Bos1)
				elseif(EatBosmer.getValue()==4)
					pred.addSpell(Bos4)
					pred.removeSpell(Bos2)
				elseif(EatBosmer.getValue()==8)
					pred.addSpell(Bos8)
					pred.removeSpell(Bos4)
				elseif(EatBosmer.getValue()==16)
					pred.addSpell(Bos16)
					pred.removeSpell(Bos8)
				elseif(EatBosmer.getValue()==32)
					if(isBos)
						pred.addSpell(SameRace32)
					else
						pred.addSpell(BosPower)
					endif
				endif
			elseif(prey.getRace()==Bre || prey.getRace()==BreV)
				EatBreton.setValue(EatBreton.getValue()+1)
				if(EatBreton.getValue()==1)
					pred.addSpell(Bre1)
				elseif(EatBreton.getValue()==2)
					pred.addSpell(Bre2)
					pred.removeSpell(Bre1)
				elseif(EatBreton.getValue()==4)
					pred.addSpell(Bre4)
					pred.removeSpell(Bre2)
				elseif(EatBreton.getValue()==8)
					pred.addSpell(Bre8)
					pred.removeSpell(Bre4)
				elseif(EatBreton.getValue()==16)
					pred.addSpell(Bre16)
					pred.removeSpell(Bre8)
				elseif(EatBreton.getValue()==32)
					if(isBre)
						pred.addSpell(SameRace32)
					else
						pred.addSpell(BrePower)
					endif
				endif
			elseif(prey.getRace()==Dun || prey.getRace()==DunV)
				EatDunmer.setValue(EatDunmer.getValue()+1)
				if(EatDunmer.getValue()==1)
					pred.addSpell(Dun1)
				elseif(EatDunmer.getValue()==2)
					pred.addSpell(Dun2)
					pred.removeSpell(Dun1)
				elseif(EatDunmer.getValue()==4)
					pred.addSpell(Dun4)
					pred.removeSpell(Dun2)
				elseif(EatDunmer.getValue()==8)
					pred.addSpell(Dun8)
					pred.removeSpell(Dun4)
				elseif(EatDunmer.getValue()==16)
					pred.addSpell(Dun16)
					pred.removeSpell(Dun8)
				elseif(EatDunmer.getValue()==32)
					if(isDun)
						pred.addSpell(SameRace32)
					else
						pred.addSpell(DunPower)
					endif
				endif
			elseif(prey.getRace()==Imp || prey.getRace()==ImpV)
				EatImperial.setValue(EatImperial.getValue()+1)
				if(EatImperial.getValue()==1)
					pred.addSpell(Imp1)
				elseif(EatImperial.getValue()==2)
					pred.addSpell(Imp2)
					pred.removeSpell(Imp1)
				elseif(EatImperial.getValue()==4)
					pred.addSpell(Imp4)
					pred.removeSpell(Imp2)
				elseif(EatImperial.getValue()==8)
					pred.addSpell(Imp8)
					pred.removeSpell(Imp4)
				elseif(EatImperial.getValue()==16)
					pred.addSpell(Imp16)
					pred.removeSpell(Imp8)
				elseif(EatImperial.getValue()==32)
					if(isImp)
						pred.addSpell(SameRace32)
					else
						pred.addSpell(ImpPower)
					endif
				endif
			elseif(prey.getRace()==Kha || prey.getRace()==KhaV)
				EatKhajiit.setValue(EatKhajiit.getValue()+1)
				if(EatKhajiit.getValue()==1)
					pred.addSpell(Kha1)
				elseif(EatKhajiit.getValue()==2)
					pred.addSpell(Kha2)
					pred.removeSpell(Kha1)
				elseif(EatKhajiit.getValue()==4)
					pred.addSpell(Kha4)
					pred.removeSpell(Kha2)
				elseif(EatKhajiit.getValue()==8)
					pred.addSpell(Kha8)
					pred.removeSpell(Kha4)
				elseif(EatKhajiit.getValue()==16)
					pred.addSpell(Kha16)
					pred.removeSpell(Kha8)
				elseif(EatKhajiit.getValue()==32)
					if(isKha)
						pred.addSpell(SameRace32)
					else
						pred.addSpell(KhaPower)
					endif
				endif
			elseif(prey.getRace()==Nor || prey.getRace()==NorV)
				EatNord.setValue(EatNord.getValue()+1)
				if(EatNord.getValue()==1)
					pred.addSpell(Nor1)
				elseif(EatNord.getValue()==2)
					pred.addSpell(Nor2)
					pred.removeSpell(Nor1)
				elseif(EatNord.getValue()==4)
					pred.addSpell(Nor4)
					pred.removeSpell(Nor2)
				elseif(EatNord.getValue()==8)
					pred.addSpell(Nor8)
					pred.removeSpell(Nor4)
				elseif(EatNord.getValue()==16)
					pred.addSpell(Nor16)
					pred.removeSpell(Nor8)
				elseif(EatNord.getValue()==32)
					if(isNor)
						pred.addSpell(SameRace32)
					else
						pred.addSpell(NorPower)
					endif
				endif
			elseif(prey.getRace()==Ors || prey.getRace()==OrsV)
				EatOrsimer.setValue(EatOrsimer.getValue()+1)
				if(EatOrsimer.getValue()==1)
					pred.addSpell(Ors1)
				elseif(EatOrsimer.getValue()==2)
					pred.addSpell(Ors2)
					pred.removeSpell(Ors1)
				elseif(EatOrsimer.getValue()==4)
					pred.addSpell(Ors4)
					pred.removeSpell(Ors2)
				elseif(EatOrsimer.getValue()==8)
					pred.addSpell(Ors8)
					pred.removeSpell(Ors4)
				elseif(EatOrsimer.getValue()==16)
					pred.addSpell(Ors16)
					pred.removeSpell(Ors8)
				elseif(EatOrsimer.getValue()==32)
					if(isOrs)
						pred.addSpell(SameRace32)
					else
						pred.addSpell(OrsPower)
					endif
				endif
			elseif(prey.getRace()==Red || prey.getRace()==RedV)
				EatRedguard.setValue(EatRedguard.getValue()+1)
				if(EatRedguard.getValue()==1)
					pred.addSpell(Red1)
				elseif(EatRedguard.getValue()==2)
					pred.addSpell(Red2)
					pred.removeSpell(Red1)
				elseif(EatRedguard.getValue()==4)
					pred.addSpell(Red4)
					pred.removeSpell(Red2)
				elseif(EatRedguard.getValue()==8)
					pred.addSpell(Red8)
					pred.removeSpell(Red4)
				elseif(EatRedguard.getValue()==16)
					pred.addSpell(Red16)
					pred.removeSpell(Red8)
				elseif(EatRedguard.getValue()==32)
					if(isRed)
						pred.addSpell(SameRace32)
					else
						pred.addSpell(RedPower)
					endif
				endif
			endif
	else
		pred.modAV("FavorsPerDayTimer",1)
	endif

	bool mage=false
	bool warrior=false
	bool thief=false
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

			String highest=""
			Float highestVal=0
			
			if(mage)
			if(prey.getav("Illusion")>highestVal && prey.getAV("Illusion")>pred.getAV("Illusion"))
				highest="Illusion"
				highestVal=prey.getAV("Illusion")
			endif
			if(prey.getav("Conjuration")>highestVal && prey.getAV("Conjuration")>pred.getAV("Conjuration"))
				highest="Conjuration"
				highestVal=prey.getAV("Conjuration")
			endif
			if(prey.getav("Restoration")>highestVal && prey.getAV("Restoration")>pred.getAV("Restoration"))
				highest="Restoration"
				highestVal=prey.getAV("Restoration")
			endif
			if(prey.getav("Destruction")>highestVal && prey.getAV("Destruction")>pred.getAV("Destruction"))
				highest="Destruction"
				highestVal=prey.getAV("Destruction")
			endif
			if(prey.getav("Alteration")>highestVal && prey.getAV("Alteration")>pred.getAV("Alteration"))
				highest="Alteration"
				highestVal=prey.getAV("Alteration")
			endif
			if(prey.getav("Enchanting")>highestVal && prey.getAV("Enchanting")>pred.getAV("Enchanting"))
				highest="Enchanting"
				highestVal=prey.getAV("Enchanting")
			endif
			endif

			if(warrior)
			if(prey.getav("Smithing")>highestVal && prey.getAV("Smithing")>pred.getAV("Smithing"))
				highest="Smithing"
				highestVal=prey.getAV("Smithing")
			endif
			if(prey.getav("OneHanded")>highestVal && prey.getAV("OneHanded")>pred.getAV("OneHanded"))
				highest="OneHanded"
				highestVal=prey.getAV("OneHanded")
			endif
			if(prey.getav("TwoHanded")>highestVal && prey.getAV("TwoHanded")>pred.getAV("TwoHanded"))
				highest="TwoHanded"
				highestVal=prey.getAV("TwoHanded")
			endif
			if(prey.getav("Marksman")>highestVal && prey.getAV("Marksman")>pred.getAV("Marksman"))
				highest="Marksman"
				highestVal=prey.getAV("Marksman")
			endif
			if(prey.getav("Block")>highestVal && prey.getAV("Block")>pred.getAV("Block"))
				highest="Block"
				highestVal=prey.getAV("Block")
			endif
			if(prey.getav("HeavyArmor")>highestVal && prey.getAV("HeavyArmor")>pred.getAV("HeavyArmor"))
				highest="HeavyArmor"
				highestVal=prey.getAV("HeavyArmor")
			endif
			endif

			if(thief)
			if(prey.getav("LightArmor")>highestVal && prey.getAV("LightArmor")>pred.getAV("LightArmor"))
				highest="LightArmor"
				highestVal=prey.getAV("LightArmor")
			endif
			if(prey.getav("Pickpocket")>highestVal && prey.getAV("Pickpocket")>pred.getAV("Pickpocket"))
				highest="Pickpocket"
				highestVal=prey.getAV("Pickpocket")
			endif
			if(prey.getav("Lockpicking")>highestVal && prey.getAV("Lockpicking")>pred.getAV("Lockpicking"))
				highest="Lockpicking"
				highestVal=prey.getAV("Lockpicking")
			endif
			if(prey.getav("Sneak")>highestVal && prey.getAV("Sneak")>pred.getAV("Sneak"))
				highest="Sneak"
				highestVal=prey.getAV("Sneak")
			endif
			if(prey.getav("Alchemy")>highestVal && prey.getAV("Alchemy")>pred.getAV("Alchemy"))
				highest="Alchemy"
				highestVal=prey.getAV("Alchemy")
			endif
			if(prey.getav("Speechcraft")>highestVal && prey.getAV("Speechcraft")>pred.getAV("Speechcraft"))
				highest="Speechcraft"
				highestVal=prey.getAV("Speechcraft")
			endif
			endif
			
			if(highestVal!=0)
				if(pred==Game.GetPlayer())
					Game.IncrementSkill(highest)
				else
					pred.setAV(highest, pred.getBaseAV(highest)+1)
				endif
				; Debug.MessageBox("Skill growth!")
			endif
			
			if(prey.getBaseActorValue("Health")>pred.getBaseActorValue("Health"))
				if(pred.hasPerk(ConsumeEssence))
					pred.setActorValue("Health",pred.getBaseActorValue("Health")+2)
				else
					pred.setActorValue("Health",pred.getBaseActorValue("Health")+1)
				endif
			endif
			if(prey.getBaseActorValue("Stamina")>pred.getBaseActorValue("Stamina"))
				if(pred.hasPerk(ConsumeEssence))
					pred.setActorValue("Stamina",pred.getBaseActorValue("Stamina")+2)
				else
					pred.setActorValue("Stamina",pred.getBaseActorValue("Stamina")+1)
				endif
			endif
			if(prey.getBaseActorValue("Magicka")>pred.getBaseActorValue("Magicka"))
				if(pred.hasPerk(ConsumeEssence))
					pred.setActorValue("Magicka",pred.getBaseActorValue("Magicka")+2)
				else
					pred.setActorValue("Magicka",pred.getBaseActorValue("Magicka")+1)
				endif
			endif

	if(pred.hasPerk(SoulFood))
		pred.addItem(Soul,1,true)
	endif

	if(pred==Game.getPlayer())
		victimsToPerk.setValue(victimsToPerk.getValue()+1)
		if(victimsToPerk.getValue()>= (3+prevPerkPoints.getValue()))
			perkMessage.show()
			VSkillLevelSound.play(pred)
			victimsToPerk.setValue(0)
			perkPoints.setValue(perkPoints.getValue()+1)
			prevPerkPoints.setValue(prevPerkPoints.getValue()+1)
		endif
	endif

	if(prey==Game.getPlayer())
		playerDigestMessage.show()
		prey.say(Scream,prey,true)
		deathMusic.add()
		prey.resethealthandlimbs()
	endif

	BurpSound.play(pred)

	bool protected=false ; Deal with protected characters
	prey.enable(0)

	if(prey.getLeveledActorBase().isProtected())
		protected=true
		prey.getLeveledActorBase().setProtected(false)
	endif

	if(prey!=Game.getPlayer())
		prey.killEssential(pred)
	endif

	if(protected)
		prey.getLeveledActorBase().setProtected(true)
	endif

	int oldweight=pred.getLeveledActorBase().getWeight() as Int
	if(oldweight<100&&weightGlobal.getValueInt()>0)
		int weight=oldweight+weightGlobal.getValueInt()
		if(weight>100)
			weight=100
		endif
		float neckdelta=(weight/100)-(oldweight/100)
		pred.getLeveledActorBase().setWeight(weight)
		pred.updateWeight(neckdelta)
		pred.QueueNiNodeUpdate()
	endif

		if(prey.hasKeyword(summoned))
			prey.removeAllItems()
		endif

	pred.removeItem(fullnessTypes,99,true)
	pred.equipItem(fullnessDead,true,true)

	SendDevourmentEvent(4,pred,prey,digestionFlags[index],0,false)
	
	RegisterShrinkingTummy(index)
EndFunction

Function UnregisterDigestion(int index, bool dead)
	if(index<0)
		return
	endif
	int tempIndex=index
	while(tempIndex<127)
		predArray[tempIndex]=predArray[tempIndex+1]
		preyArray[tempIndex]=preyArray[tempIndex+1]
		digestionFlags[tempIndex]=digestionFlags[tempIndex+1]
		digestionTimers[tempIndex]=digestionTimers[tempIndex+1]
		digestionDamage[tempIndex]=digestionDamage[tempIndex+1]
		digestionSurrender[tempIndex]=digestionSurrender[tempIndex+1]
		tempIndex=1+tempIndex
	endWhile
	predArray[127]=None
	preyArray[127]=None
	digestionFlags[127]=0
	digestionTimers[127]=0
	digestionDamage[127]=0
	digestionSurrender[127]=false
	numDigestions=-1+numDigestions
EndFunction

Function RegisterAllVomits(Actor pred)
	int index=0
	while(index<numDigestions)
		if(predArray[index]==pred)
			registerVomit(preyArray[index],1)
		endif
		index=index+1
	endWhile
EndFunction

Function RegisterVomit(Actor prey, int type) ; type 1=alive, type 2=dead, type 3=scent
	int index=preyArray.find(prey)
	if(index<0)
		return
	endif

	vomitPredArray[numVomits]=predArray[index]
	vomitPreyArray[numVomits]=preyArray[index]
	vomitTypeArray[numVomits]=type
	vomitFlagsArray[numVomits]=digestionFlags[index]
	
	numVomits=numVomits+1
	vomitFailsafeTimer=0
	
	RemoveGhost(prey)
	
	UnregisterDigestion(index, type==2)
EndFunction

Function RegisterDeadVomit(Actor pred, Actor prey)
	int index=tummyPreyArray.find(prey)

	vomitPredArray[numVomits]=pred
	vomitPreyArray[numVomits]=prey
	vomitTypeArray[numVomits]=2
	vomitFlagsArray[numVomits]=tummyFlags[index]
	
	numVomits=numVomits+1
	vomitFailsafeTimer=0
	
	RemoveGhost(prey)
EndFunction

Function ProduceVomit()
	vomitPredArray[0].dispelSpell(StayAtPredLocation)
	if(ReadyToVomit.getValue()==0)
		Debug.sendAnimationEvent(vomitPredArray[0],"shoutStart")
		VomitSound.playAndWait(vomitPredArray[0])
		vomitPredArray[0].removeItem(FullnessTypes,99,true)
		Debug.sendAnimationEvent(vomitPredArray[0],"shoutStop")
		vomitedPrey=vomitPreyArray[0]
		vomitFailsafeTimer=0
		ReadyToVomit.setValue(1)

		if(vomitTypeArray[0]==1)
			VomitSpell.Cast(vomitPredArray[0])
			SendDevourmentEvent(2,vomitPredArray[0],vomitPreyArray[0],vomitFlagsArray[0],0,false)
		elseif(vomitTypeArray[0]==2)
			VomitSpellDead.cast(vomitPredArray[0])
		else
			VomitSpellScent.cast(vomitPredArray[0])
			vomitPredArray[0].restoreav("Health",1)
			vomitPredArray[0].damageav("Health",1)
			vomitPredArray[0].restoreav("Health",1)
			SendDevourmentEvent(2,vomitPredArray[0],vomitPreyArray[0],vomitFlagsArray[0],0,false)
		endif
	elseif(vomitFailsafeTimer>30)
		unclogMessage.show()
		vomitedPrey=vomitPreyArray[0]
		vomitFailsafeTimer=0
		vomitPredArray[0].removeItem(FullnessTypes,99,true)
		Game.GetPlayer().placeAtMe(vomitActivator)
		SendDevourmentEvent(2,vomitPredArray[0],vomitPreyArray[0],vomitFlagsArray[0],0,false)
	else
		vomitFailsafeTimer=vomitFailsafeTimer+1
	endif
EndFunction

Actor Function GetVomitPrey()
	return vomitPreyArray[0]
EndFunction

Function UnregisterVomit()
	ReadyToVomit.setValue(0)
	vomitFailsafeTimer=0
	int notZero=0
	while(notZero<127)
		vomitPredArray[notZero]=vomitPredArray[notZero+1]
		vomitPreyArray[notZero]=vomitPreyArray[notZero+1]
		vomitTypeArray[notZero]=vomitTypeArray[notZero+1]
		notZero=notZero+1
	endwhile
	vomitPredArray[127]=None
	vomitPreyArray[127]=None
	vomitTypeArray[127]=0
	numVomits=-1+numVomits
EndFunction

Function RegisterShrinkingTummy(int index)
	tummyPredArray[numTummies]=predArray[index]
	tummyPreyArray[numTummies]=preyArray[index]
	tummyTimers[numTummies]=DeadDigestionTime.getValueInt()
	tummyMaximumTimers[numTummies]=DeadDigestionTime.getValueInt()
	tummyFlags[numTummies]=digestionFlags[index]
	numTummies=numTummies+1

	UnregisterDigestion(index,true)
EndFunction

Function ShrinkTummy(int index, int times)
	Actor prey=tummyPreyArray[index]
	Actor pred=tummyPredArray[index]
if(tummyTimers[index]>0&&!pred.isDead())
	int digestionMultiplier=1
	if(tummyPredArray[index].getCombatState()>0 || tummyPredArray[index].hasSpell(ScalingCancelSpell))
		digestionMultiplier=50
	endif

	if(digestionMultiplier*times<=tummyTimers[index])
		tummyTimers[index]=tummyTimers[index]-(digestionMultiplier*times)
	else
		tummyTimers[index]=0
	endif

	scaleNodes(pred,tummyMaximumTimers[index],tummyTimers[index],1,0,1.0,B1,1.0,S1,1.0,N1)
	if(Utility.randomInt(0,100)<3)
		StomachSound.play(pred)
	endif

	if(!pred.hasPerk(Nourish))
		pred.restoreAV("Health",2*times)
		pred.restoreAV("Stamina",2*times)
	else
		pred.restoreAV("Health",4*times)
		pred.restoreAV("Stamina",4*times)
	endif

	if(pred.hasPerk(NourishMagic))
		pred.restoreAV("Magicka",2*times)
	endif

	if(prey==Game.getPlayer())
		playerDigestionReminder+=1
		if(playerDigestionReminder>9)
			playerDigestionReminder=0
			playerDigestMessage.show()
		endif
		if(Input.IsKeyPressed(44))
			ExpelRemains(index)
		endif
	endif
	
	SendDevourmentEvent(5,pred,prey,tummyFlags[index],(TummyTimers[index] as Float)/(TummyMaximumTimers[index] as Float),false)
	
elseif(pred.isDead()||ScatGlobal.getValue()==0||!(pred.isPlayerTeammate()&&pred.getParentCell().getFactionOwner()==playerFaction))
	ExpelRemains(index)
endif
EndFunction

Function scaleNodes(Actor pred, float totalTime, float currentTime, float startTime, float endTime, float BA, float BB, float SA, float SB, float NA, float NB)
	float scaleTime=(currentTime-(totalTime*endTime))/((startTime-endTime)*totalTime)
	float scaleB=scaleTime*(BA-BB)+BB
	float scaleS=scaleTime*(SA-SB)+SB
	float scaleN=scaleTime*(NA-NB)+NB
	NetImmerse.setNodeScale(pred,"NPC Belly",scaleB, false)
	NetImmerse.setNodeScale(pred,"Devourment Belly Envelope S",scaleS, false)
	NetImmerse.setNodeScale(pred,"Devourment Belly Envelope N",scaleN, false)
EndFunction

Function ExpelRemains(int index)
	Actor pred=tummyPredArray[index]
	Actor prey=tummyPreyArray[index]
	bool NotOverYet=false

	if(prey==Game.getPlayer())
		prey.removeSpell(NotThere)
		prey.moveTo(pred)
		pred.dispelSpell(StayAtPredLocation)
		if(NewPlayerGlobal.getValueInt()==0)
			prey.killEssential(pred)
		endif
	endif

	if(ScatGlobal.getValue()==1)
		if(pred==Game.GetPlayer())
			if(!pred.isSneaking())
				PoopMessage.show()
				NotOverYet=true
			else
				ObjectReference dead=pred.placeatme(Poop)
				dead.setAngle(0,0,0)
				prey.removeAllItems(dead,false,true)
				DigestionVisualSpellToo.cast(pred)
				ScatSound.play(pred)
				pred.removeItem(FullnessTypes,99,true)
			endif
		else
			ObjectReference dead=pred.placeatme(Poop)
			dead.setAngle(0,0,0)
			prey.removeAllItems(dead,false,true)
			if(prey!=Game.GetPlayer())
			else
				prey.moveTo(pred)
				prey.setPosition(pred.getPositionX(), pred.getPositionY(), pred.getPositionZ())
			endif
			DigestionVisualSpellToo.cast(pred)
			ScatSound.play(pred)
			pred.removeItem(FullnessTypes,99,true)
		endif
	elseif(ScatGlobal.getValue()==2)
		RegisterDeadVomit(pred,prey)
	elseif(ScatGlobal.getValue()==3)
		if(pred==Game.GetPlayer())
			if(!pred.isSneaking())
				BonesMessage.show()
				NotOverYet=true
			else
				DigestionVisualSpellToo.cast(pred)
				BoneSound.play(pred)
				Actor dead=pred.placeatme(skeleton) as Actor
				dead.setPosition(pred.getPositionX(),pred.getPositionY(),pred.getPositionZ())
				dead.setScale(0.5)
				dead.kill()
				ObjectReference boom=dead.placeAtMe(BoneExplosion)
				prey.removeAllItems(dead,false,true)
				Utility.wait(0.1)
				dead.setScale(1)
				pred.removeItem(FullnessTypes,99,true)
			endif
		else
			DigestionVisualSpellToo.cast(pred)
			BoneSound.play(pred)
			Actor dead=pred.placeatme(skeleton) as Actor
			dead.setPosition(pred.getPositionX(),pred.getPositionY(),-20+pred.getPositionZ())
			dead.setScale(0.5)
			dead.kill()
			ObjectReference boom=dead.placeAtMe(BoneExplosion)
			prey.removeAllItems(dead,false,true)
			if(prey!=Game.GetPlayer())

			else
				prey.moveTo(pred)
				prey.setPosition(pred.getPositionX(), pred.getPositionY(), pred.getPositionZ())
			endif
			Utility.wait(0.1)
			dead.setScale(1)
			pred.removeItem(FullnessTypes,99,true)
		endif
	else
		DigestionVisualSpellToo.cast(pred)
		prey.removeAllItems(pred,false,true)
		pred.removeItem(FullnessTypes,99,true)
	endif

		if(prey==Game.GetPlayer()&&NewPlayerGlobal.getValueInt()!=0&&Game.getPlayer().getActorBase().getSex()==1&&pred.hasKeyword(NPC))
				NameQuest.switchPlayer(pred, prey)
				SendDevourmentEvent(8,pred,prey,TummyFlags[index],0,false)
		endif
	if(!NotOverYet)
		UnregisterCompletedTummy(index)
		SendDevourmentEvent(6,pred,prey,TummyFlags[index],0,false)
	endif
EndFunction

Function UnregisterCompletedTummy(int index)
	int tempIndex=index
	while(tempIndex<127)
		tummyPredArray[tempIndex]=tummyPredArray[tempIndex+1]
		tummyPreyArray[tempIndex]=tummyPreyArray[tempIndex+1]
		tummyTimers[tempIndex]=tummyTimers[tempIndex+1]
		tummyMaximumTimers[tempIndex]=tummyMaximumTimers[tempIndex+1]
		tempIndex=1+tempIndex
	endWhile
	tummyPredArray[127]=None
	tummyPreyArray[127]=None
	tummyTimers[127]=0
	tummyMaximumtimers[127]=0
	numTummies=-1+numTummies
EndFunction

Event OnUpdate()
	int index=0
	int times=((Utility.getCurrentGameTime()-lastTimeProcessed)/(TimeScale.getValue())*865000) as Int
	if(times<=0)
		times=1
	endif

	while(index<numDigestions)
		digest(index,times)
		index=index+1
	endwhile
		
	index=0
	while(index<numTummies)
		shrinkTummy(index,times)
		index=index+1
	endwhile
	
	if(numVomits>0)
		produceVomit()
	endif

	lastTimeProcessed=Utility.getCurrentGameTime()
	RegisterForSingleUpdate(0.1)
EndEvent

Function DebugDump()
	blockArray=new Actor[128]
	numBlocks=0
	
	Debug.messageBox("Beginning debug dump with "+numDigestions+" active digestions.")
	
	int index=0
	while(index<numDigestions)
		Debug.messageBox(predArray[index]+" ate "+preyArray[index]+" with flags "+digestionFlags[index]+" and will digest them for "+digestionTimers[index]+" ticks, dealing "+digestionDamage[index]+" damage per tick.")
		index=index+1
	endWhile
	index=0
	while(index<numTummies)
		Debug.messageBox(tummyPredArray[index]+" ate "+tummyPreyArray[index]+", killed them, and will digest them for "+tummyTimers[index]+" ticks.")
		index=index+1
	endWhile
	index=0
	while(index<numVomits)
		Debug.messageBox(vomitPredArray[index]+" is waiting to puke up "+vomitPreyArray[index]+" with type "+vomitTypeArray[index]+". Failsafe timer is "+vomitFailsafeTimer)
		index=index+1
	endWhile
	
	Debug.messageBox("Mod predators...")
	
	index=0
	while(index<numModPredators)
		Debug.messageBox("Race "+modPredators[index]+" is registered with armor "+modPredatorBellies[index]+" and animation "+modPredatorIdles[index])
		index=index+1
	endWhile
	
	Debug.messageBox("Event handlers...")
	
	index=0
	while(index<numHandlers)
		Debug.messageBox("Event handler "+handlers[index]+" is registered.")
		index=index+1
	endWhile
EndFunction

Function RegisterBlock(Actor toBlock)
	blockArray[numBlocks]=toBlock
	numBlocks=numBlocks+1
EndFunction

Bool Function IsBlocked(Actor person)
	return blockArray.find(person)!=-1
EndFunction

Function UnregisterBlock(Actor toUnblock)
	int index=blockArray.find(toUnblock)
	if(index==-1)
		return
	endif
	while(index<127)
		blockArray[index]=blockArray[index+1]
		index=index+1
	endwhile
	blockArray[127]=None
	numBlocks=-1+numBlocks
EndFunction

Function SendDevourmentEvent(int eventType, Actor pred, Actor prey, int flags, float fraction, bool oral)
	; Debug.messageBox("Event handler activated...")
	int index=0
	while(index<numHandlers)
		; Debug.messageBox("Firing off event type "+eventType+" to handler "+handlers[index])
		if(eventType==1)
			handlers[index].onSwallow(pred,prey,flags)
		elseif(eventType==2)
			handlers[index].onEscape(pred,prey,flags,oral)
		elseif(eventType==3)
			handlers[index].onDigestionTick(pred,prey,flags,fraction)
		elseif(eventType==4)
			handlers[index].onPreyDeath(pred,prey,flags)
		elseif(eventType==5)
			handlers[index].onDeadDigestionTick(pred,prey,flags,fraction)
		elseif(eventType==6)
			handlers[index].onExcretion(pred,prey,flags)
		elseif(eventType==7)
			handlers[index].onDialog(pred,prey,flags)
		elseif(eventType==8)
			handlers[index].onNewCharacter(pred,prey,flags)
		elseif(eventType==9)
			handlers[index].onCustomEvent(pred,prey,flags,fraction)
		endif
		index=index+1
	endWhile
EndFunction

Function DoDialog(Actor pred, Actor prey, int flags)
	if(digestionFlags[preyArray.find(prey)]<0)
		lethal=false
	else
		lethal=true
	endif
	DialogPredAlias.ForceRefTo(pred)
	DialogPreyAlias.ForceRefTo(prey)
	SendDevourmentEvent(7,pred,prey,flags,0,false)
	prey.moveTo(pred)
	StayAtPredLocation.cast(prey, pred)
	prey.setAlpha(0)
	prey.setGhost(true)
	prey.addSpell(NotThere, false)
	prey.clearExtraArrows()
	prey.stopCombatAlarm()
	prey.stopCombat()
	Utility.wait(0.5)
	if(pred==Game.getPlayer())
		if(!prey.activate(pred,true))
			activatedDialog=false
			return
		endif
	else
		if(!pred.activate(prey,true))
			activatedDialog=false
			return
		endif
	endif
	Utility.wait(0.5)
	while((pred==Game.GetPlayer()&&prey.isInDialogueWithPlayer())||pred.isInDialogueWithPlayer())
		Utility.wait(1)
	endWhile
	if(prey!=game.getPlayer()&&whoAte(prey)!=None)
		prey.moveTo(HerStomach)
		prey.removeSpell(NotThere)
		prey.setAlpha(100)
		prey.setGhost(false)
	endif
	activatedDialog=false
EndFunction

Function removeGhost(Actor prey)
	if(prey!=game.getPlayer())
		prey.moveTo(HerStomach)
		prey.removeSpell(NotThere)
		prey.setAlpha(100)
		prey.setGhost(false)
	endif
EndFunction

Event OnKeyDown(int KeyCode)
if(!activatedDialog)
	activatedDialog=true
	int index=preyArray.find(Game.getPlayer())
	if(index>-1)
		playerPrey=true
		DoDialog(predArray[index],preyArray[index],digestionFlags[index])
	else
		index=predArray.find(Game.getPlayer())
		if(index>-1)
			playerPrey=false
			DoDialog(predArray[index],preyArray[index],digestionFlags[index])
		else
			activatedDialog=false
		endif
	endif
endif
EndEvent

; ----PUBLIC API FUNCTIONS BELOW THIS POINT----

Function RegisterEventHandler(DevourmentEventHandler yourMod)
	if(numHandlers<128)
		handlers[numHandlers]=yourMod
		numHandlers=numHandlers+1
	else
		Debug.messageBox("Error: 128 event handlers are already registered! I am genuinely impressed.")
	endif
EndFunction

Bool Function IsHandlerRegistered(DevourmentEventHandler yourMod)
	return handlers.find(yourMod)>-1
EndFunction

Function ForceSwallow(Actor pred, Actor prey, int flags)
	if(flags>0)
		ScriptedSwallow.cast(pred, prey)
	else
		ScriptedEndo.cast(pred, prey)
	endif
	; 2DO handle unbirth once it's added
EndFunction

Function ForceEscape(Actor prey, bool oralEscape) ; If false, gives them a "full tour"
	if(preyArray.Find(prey)>-1)
		RegisterVomit(prey,1)
	endif
	; TODO handle full tour once the animation update is released
EndFunction

Function ForceRegurgitate(Actor pred, bool oralEscape) ; see above
	if(predArray.Find(pred)>-1)
		int index=0
		while(index<numDigestions)
			if(predArray[index]==pred)
				RegisterVomit(preyArray[index],1)
			endif
			index=index+1
		endWhile
	endif
	; TODO handle full tour once the animation update is released
EndFunction

Bool Function ForceDialog(Actor pred, Actor prey)
	int index=0
	bool done=false
	while(index<numDigestions)
		if(preyArray[index]==Game.getPlayer() && predArray[index]==pred)
			DoDialog(predArray[index],Game.getPlayer(),digestionFlags[index])
			done=true
		endif
		index=index+1
	endWhile
	if(!done)
		index=0
		while(index<numDigestions)
			if(predArray[index]==Game.getPlayer() && preyArray[index]==prey)
				DoDialog(Game.getPlayer(),preyArray[index],digestionFlags[index])
				done=true
			endif
			index=index+1
		endWhile
	endif
	return done
EndFunction

Function AccelerateDigestion(Actor pred, int ticks)
	int index=0
	while(index<numDigestions)
		if(predArray[index]==pred)
			Digest(index,ticks)
		endif
		index=index+1
	endWhile
EndFunction

Int Function getNumEaten(Actor pred, int flags)
	int index=0
	int numEaten=0
	while(index<numDigestions)
		if(predArray[index]==pred)
			numEaten=numEaten+1
		endif
		index=index+1
	endWhile
	while(index<numTummies)
		if(tummyPredArray[index]==pred)
			numEaten=numEaten+1
		endif
		index=index+1
	endWhile
	return numEaten
EndFunction

Actor Function whoAte(Actor prey)
	int index=0
	while(index<numDigestions)
		if(preyArray[index]==prey)
			return predArray[index]
		endif
		index=index+1
	endWhile
	index=0
	while(index<numTummies)
		if(tummyPreyArray[index]==prey)
			return tummyPredArray[index]
		endif
		index=index+1
	endWhile
	return None
EndFunction

Actor[] Function whoSheAte(Actor pred, int flags)
	int index=0
	int newIndex=0
	Actor[] who=new Actor[128]
	
	while(index<numDigestions)
		if(predArray[index]==pred)
			who[newIndex]=preyArray[index]
			newIndex=newIndex+1
		endif
		index=index+1
	endWhile
	index=0
	while(index<numTummies)
		if(tummyPredArray[index]==pred)
			who[newIndex]=tummyPreyArray[index]
			newIndex=newIndex+1
		endif
		index=index+1
	endWhile
	
	return who
EndFunction

Bool Function hasLivePrey(Actor pred)
	return (predArray.find(pred)>-1)
EndFunction

Actor[] Function getPredArray()
	return predArray
EndFunction

Actor[] Function getPreyArray()
	return preyArray
EndFunction

int[] Function getTypeFlagArray()
	return digestionFlags
EndFunction

float[] Function getDigestionTimeArray()
	return digestionTimers
EndFunction

Actor[] Function getDeadPredArray()
	return tummyPredArray
EndFunction

Actor[] Function getDeadPreyArray()
	return tummyPreyArray
EndFunction

Function disableEscape(Actor prey)
	int index=0
	while(index<numDigestions)
		if(preyArray[index]==prey)
			digestionTimers[index]=2147483647
			return
		endif
		index=index+1
	endWhile
EndFunction

float Function getDeadDigestionCompletion(Actor prey)
	int index=0
	while(index<numTummies)
		if(tummyPreyArray[index]==prey)
			return (tummyTimers[index] as Float)/(tummyMaximumTimers[index] as Float)
		endif
		index=index+1
	endWhile
	return 0
EndFunction

int Function getDeadDigestionTicks(Actor prey)
	int index=0
	while(index<numTummies)
		if(tummyPreyArray[index]==prey)
			return tummyTimers[index]
		endif
		index=index+1
	endWhile
	return 0
EndFunction

Function setDeadDigestionTicks(Actor pred, int ticks)
	int index=0
	while(index<numTummies)
		if(tummyPredArray[index]==pred)
			tummyTimers[index]=ticks
		endif
		index=index+1
	endWhile
EndFunction

Function addPredatorRace(Race predRace, Idle swallowAnim, Armor belly)
	if(numModPredators<128)
		modPredators[numModPredators]=predRace
		modPredatorIdles[numModPredators]=swallowAnim
		modPredatorBellies[numModPredators]=belly
		FullnessTypes.addForm(belly)
		numModPredators=numModPredators+1
	else
		Debug.messageBox("Error: 128 predator races are already registered! I am genuinely impressed.")
	endif
EndFunction

bool Function isModPredatorRace(Race predRace)
	return modPredators.find(predRace)>-1
EndFunction

Idle Function getModPredatorIdle(Race predRace)
	int index=modPredators.find(predRace)
	if(index>-1)
		return modPredatorIdles[index]
	endif
	return None
EndFunction

Armor Function getModPredatorBelly(Race predRace)
	int index=modPredators.find(predRace)
	if(index>-1)
		return modPredatorBellies[index]
	endif
	return None
EndFunction

Int Function addIngestionMethod(Idle swallowAnim) ; returns type flag
	; TODO when animations become possible
EndFunction

bool Function isInitialized() ; confirms that all Devourment content is ready
	; Debug.messageBox(modPredators.Length)
	return modPredators.Length==128
EndFunction

bool Function switchLethal(Actor prey)
	int index=preyArray.find(prey)
	Actor pred=predArray[index]
	if(index>-1)
		if(digestionFlags[index])<0
			digestionDamage[index]=getDigestionDamage(pred,prey)/5
			digestionTimers[index]=getDigestionTime(pred)*5
			pred.removeItem(FullnessNonlethal,1,true)
			if(prey.getLeveledActorBase().getSex()==1)
				pred.addItem(FullnessFPrey,1,true)
				pred.equipItem(FullnessFPrey,true,true)
			else
				pred.addItem(FullnessMPrey,1,true)
				pred.equipItem(FullnessMPrey,true,true)
			endif
			SendDevourmentEvent(1,predArray[index],preyArray[index],digestionFlags[index],0,false)
		else
			pred.removeItem(FullnessTypes,99,true)
			pred.addItem(FullnessNonlethal,1,true)
			pred.equipItem(FullnessNonlethal,true,true)
		endif
		digestionFlags[index]=(-1)*digestionFlags[index]
		return true
	endif
	return false
EndFunction

bool Function sendDialogEvent(float customID)
	int index=preyArray.find(DialogPreyAlias.getActorRef())
	if(index>-1)
		sendDevourmentEvent(9,predArray[index],preyArray[index],digestionFlags[index],customID,false)
		return true
	endif
	return false
EndFunction