scriptName devourmentregistryscript extends Quest conditional

;-- Properties --------------------------------------

;_wetcoldbreathaction Property Breathe Auto <--- WHY was this here????
Int digestionMultiplier

GlobalVariable			Property _WerewolfEaten			Auto
GlobalVariable			Property _VampireEaten 			Auto
GlobalVariable			Property _DogEaten 				Auto
GlobalVariable			Property _WomenEaten			Auto
GlobalVariable			Property EatDunmer				Auto
GlobalVariable			Property cockvore				Auto
GlobalVariable			Property _DwarvenMachineEaten 	Auto
GlobalVariable			Property _FalmerEaten 			Auto
GlobalVariable			Property _DeerEaten 			Auto
GlobalVariable			Property _MudcrabEaten 			Auto
GlobalVariable			Property _ScaleBelly 			Auto
GlobalVariable			Property _BearEaten 			Auto
GlobalVariable			Property _TrollEaten 			Auto
GlobalVariable			Property _DremoraEaten 			Auto
GlobalVariable			Property _FoxEaten 				Auto
GlobalVariable			Property TimeScale 				Auto
GlobalVariable			Property DTime 					Auto
GlobalVariable			Property facialanim 			Auto
GlobalVariable			Property _HorseEaten 			Auto
GlobalVariable			Property _DragonPriestEaten 	Auto
GlobalVariable			Property _SpiderEaten 			Auto
GlobalVariable			Property _ChaurusEaten 			Auto
GlobalVariable			Property PrevPerkPoints 		Auto
GlobalVariable			Property EatKhajiit 			Auto
GlobalVariable			Property HungerPoints 			Auto
GlobalVariable			Property EatRedguard 			Auto
GlobalVariable			Property PerkPoints 			Auto
GlobalVariable			Property _SabrecatEaten 		Auto
GlobalVariable			Property struggletoggle 		Auto
GlobalVariable			Property UnwillingAudio 		Auto
GlobalVariable			Property MorphOnly 				Auto
GlobalVariable			Property _GiantEaten 			Auto
GlobalVariable			Property _HagravenEaten 		Auto
GlobalVariable			Property _ChickenEaten 			Auto
GlobalVariable			Property _DragonEaten 			Auto
GlobalVariable			Property _HorkerEaten 			Auto
GlobalVariable			Property _HareEaten 			Auto
GlobalVariable			Property _GoatEaten 			Auto
GlobalVariable			Property SkillGain 				Auto
GlobalVariable			Property _FishEaten 			Auto
GlobalVariable			Property NoEscape 				Auto
GlobalVariable			Property _WolfEaten 			Auto
GlobalVariable			Property ReadyToVomit 			Auto
GlobalVariable			Property NewPlayerGlobal 		Auto
GlobalVariable			Property EatBreton 				Auto
GlobalVariable			Property WeightGlobal 			Auto
GlobalVariable			Property AnimBelly 				Auto
GlobalVariable			Property _MenEaten 				Auto
GlobalVariable			Property preysize 				Auto
GlobalVariable			Property _noreturn 				Auto
GlobalVariable			Property _MammothEaten 			Auto
GlobalVariable			Property _CowEaten 				Auto
GlobalVariable			Property _DraugrEaten 			Auto
GlobalVariable			Property KillEssential 			Auto
GlobalVariable			Property EatBosmer 				Auto
GlobalVariable			Property acidamagemodifier 		Auto
GlobalVariable			Property breastvore 			Auto
GlobalVariable			Property strip 					Auto
GlobalVariable			Property DeadDigestionTime 		Auto
GlobalVariable			Property VictimsToPerk 			Auto
GlobalVariable			Property ScatGlobal 			Auto
GlobalVariable			Property ScatMoans 				Auto
GlobalVariable			Property EatArgonian 			Auto
GlobalVariable			Property Shititems 				Auto
GlobalVariable			Property EatOrsimer 			Auto
GlobalVariable			Property EatImperial 			Auto
GlobalVariable			Property EatAltmer 				Auto
GlobalVariable			Property EatNord 				Auto

Race					Property Red 					Auto
Race					Property _Sabrecat 				Auto
Race					Property RedV 					Auto
Race					Property Arg 					Auto
Race					Property BreV 					Auto
Race					Property Kha 					Auto
Race					Property Alt 					Auto
Race					Property _SpiderLarge 			Auto
Race					Property _Werewolf 				Auto
Race					Property _DwarvenSphere Auto
Race					Property _SpiderGiant Auto
Race					Property _DraugrMagic Auto
Race					Property Ors Auto
Race					Property _SabrecatSnow Auto
Race					Property _Wolf Auto
Race					Property DunV Auto
Race					Property _BearBrown Auto
Race					Property Bos Auto
Race					Property _GoatDomestic Auto
Race					Property AltV Auto
Race					Property _Hare Auto
Race					Property _Dog Auto
Race					Property _Cow Auto
Race					Property _Falmer Auto
Race					Property Nor Auto
Race					Property Imp Auto
Race					Property _Horker Auto
Race					Property _Chicken Auto
Race					Property _Spider Auto
Race					Property _DragonPriest Auto
Race					Property _BearBlack Auto
Race					Property _Elk Auto
Race					Property _Fish Auto
Race					Property _Chaurus Auto
Race					Property _Horse Auto
Race					Property _Fox Auto
Race					Property _Mudcrab Auto
Race					Property _Deer Auto
Race					Property _Mammoth Auto
Race					Property Bre Auto
Race					Property _TrollFrost Auto
Race					Property KhaV Auto
Race					Property _Hagraven Auto
Race					Property ImpV Auto
Race					Property _DwarvenCenturion Auto
Race					Property _Troll Auto
Race					Property _DwarvenSpider Auto
Race					Property _Giant Auto
Race					Property _ChaurusReaper Auto
Race					Property BosV Auto
Race					Property Dun Auto
Race					Property _Goat Auto
Race					Property ArgV Auto
Race					Property _Draugr Auto
Race					Property _Dragon Auto
Race					Property _BearSnow Auto
Race					Property NorV Auto
Race					Property _Dremora Auto
Race					Property OrsV Auto

Spell					Property ScriptedEndo Auto
Spell					Property Bos2 Auto
Spell					Property Red4 Auto
Spell					Property SameRace32 Auto
Spell					Property Arg2 Auto
Spell					Property Imp2 Auto
Spell					Property Ors2 Auto
Spell					Property DummySpell Auto
Spell					Property VomitSpellScent Auto
Spell					Property VomitSpellDead Auto
Spell					Property VomitSpell Auto
Spell					Property RedPower Auto
Spell					Property Bre16 Auto
Spell					Property Red16 Auto
Spell					Property Red8 Auto
Spell					Property NorPower Auto
Spell					Property Red2 Auto
Spell					Property Nor2 Auto
Spell					Property Ors16 Auto
Spell					Property Red1 Auto
Spell					Property Imp16 Auto
Spell					Property BosPower Auto
Spell					Property OrsPower Auto
Spell					Property ScalingCancelSpell Auto
Spell					Property Ors1 Auto
Spell					Property Nor16 Auto
Spell					Property Nor4 Auto
Spell					Property Nor1 Auto
Spell					Property Dun4 Auto
Spell					Property Kha16 Auto
Spell					Property Kha2 Auto
Spell					Property Kha8 Auto
Spell					Property Kha4 Auto
Spell					Property Arg4 Auto
Spell					Property ImpPower Auto
Spell					Property Imp8 Auto
Spell					Property Ors8 Auto
Spell					Property Ors4 Auto
Spell					Property DunPower Auto
Spell					Property NotThere Auto
Spell					Property BrePower Auto
Spell					Property Dun8 Auto
Spell					Property KhaPower Auto
Spell					Property Bre2 Auto
Spell					Property StayAtPredLocation Auto
Spell					Property Dun1 Auto
Spell					Property Bos16 Auto
Spell					Property Bre8 Auto
Spell					Property Alt1 Auto
Spell					Property Alt16 Auto
Spell					Property ScriptedSwallow Auto
Spell					Property Arg1 Auto
Spell					Property Imp1 Auto
Spell					Property Alt4 Auto
Spell					Property Bos4 Auto
Spell					Property Bos1 Auto
Spell					Property Bre4 Auto
Spell					Property Dun2 Auto
Spell					Property Bre1 Auto
Spell					Property Alt2 Auto
Spell					Property ArgPower Auto
Spell					Property Arg16 Auto
Spell					Property Arg8 Auto
Spell					Property Nor8 Auto
Spell					Property Kha1 Auto
Spell					Property Alt8 Auto
Spell					Property AltPower Auto
Spell					Property Imp4 Auto
Spell					Property Bos8 Auto
Spell					Property Dun16 Auto
Spell					Property DigestionVisualSpellToo Auto
Spell					Property WellRested Auto
Spell					Property RaiseDead Auto
Spell					Property Buffnord Auto
Spell					Property Buffredguard Auto
Spell					Property Buffimperial Auto
Spell					Property Buffbreton Auto
Spell					Property Buffdunmer Auto
Spell					Property Buffbosmer Auto
Spell					Property Buffaltmer Auto
Spell					Property Buffargonian Auto
Spell					Property Buffkhajiit Auto
Spell					Property Bufforsimer Auto


message property PukeMessage Auto
message property BonesMessage Auto
message property UnclogMessage Auto
message property PlayerDigestMessage Auto
message property PerkMessage Auto


perk property Nourish Auto
perk property NourishMagic Auto
perk property ConsumeEssence Auto
perk property SoulFood Auto
perk property Acid60 Auto
VisualEffect Property Breath Auto
activator property VomitActivator Auto
armor property FullnessMPrey Auto
Bool property lethal Auto conditional
Bool property activatedDialog Auto conditional
wordofpower property VomitWord Auto
bool isburping
bool weightbool = True
topic property Scream Auto
keyword property Surrender Auto
miscobject property Ipecac Auto
container property PoopDragon Auto
sound property StomachSound Auto
sound property BoneSound Auto
sound property FFSound Auto
sound property BurpSound Auto
sound property ScatSound Auto
int stomach
faction property Follower Auto
keyword property _Vampire Auto
objectreference property HerStomach Auto
devourmentnamescript property NameQuest Auto
referencealias property DialogPreyAlias Auto
explosion property BoneExplosion Auto
container property PoopOrc Auto
container property PoopOrcF Auto
container property PoopOrcM Auto
container property absorbcont Auto
sound property MMSound Auto
soulgem property SoulBlack Auto
soulgem property SoulGrand Auto
soulgem property SoulGreater Auto
soulgem property SoulCommon Auto
soulgem property SoulLesser Auto
soulgem property SoulPetty Auto
message property PoopMessage Auto
perk property IronStomach75 Auto
sound property VSkillLevelSound Auto
Armor Property nakedbody Auto
container property PoopKhajiit Auto
int strugglebar = 0


container property PoopHorse Auto
keyword property Summoned Auto
sound property FMSound Auto
musictype property DeathMusic Auto
Bool property playerPrey Auto conditional
faction property PlayerFaction Auto
armor property FullnessNonlethal Auto
shout property VomitMeShout Auto
sound property MaleScatSound Auto
referencealias property DialogPredAlias Auto
sound property VomitSound Auto
sound property MFSound Auto
message property VSkillLevelUp Auto
ObjectReference Property DeepStorageContainer Auto
container property PoopArgonian Auto
container property PoopArgonianF Auto
container property Poop Auto
container property PoopArgonianM Auto
container property PoopNA Auto
actorbase property Skeleton Auto
keyword property NPC Auto
formlist property FullnessTypes Auto
perk property IronStomach50 Auto
actor property VomitedPrey Auto
perk property IronStomach25 Auto
perk property Acid30 Auto
sound property FemScatSound Auto
sound Property CFSound Auto
sound Property CMSound Auto
int CFinstance
int CMinstance
float timesinceweight
container property PoopElf Auto
container property PoopElfF Auto
container property PoopElfM Auto
armor property FullnessDead Auto
armor property FullnessFPrey Auto
perk property Acid90 Auto
Keyword property morphvore Auto
keyword property creature Auto
Keyword property beingswallowed Auto
keyword Property weaponitem Auto
perk Property strongback Auto
string nodescale

Idle Property fullidle Auto
Idle Property resetidle Auto

perk Property SD00 Auto
perk Property SD20 Auto
perk Property SD40 Auto
perk Property SD60 Auto
perk Property SD80 Auto
perk Property R00 Auto
perk Property R20 Auto
perk Property R40 Auto
perk Property R60 Auto
perk Property R80 Auto

perk Property DE Auto
perk Property PG Auto
Perk Property CO Auto
Perk property RD Auto

int Property kSlotMask30 = 0x00000001 AutoReadOnly ; HEAD
int Property kSlotMask32 = 0x00000004 AutoReadOnly ; BODY
int Property kSlotMask33 = 0x00000008 AutoReadOnly ; Hands
int Property kSlotMask37 = 0x00000080 AutoReadOnly ; Feet

actor actingprey
PlayerVampireQuestScript Property PlayerVampireQuest	Auto	

int tick = 0
int burptick = 0
bool showmessage = True
bool idleplaying = False
bool wasdead = True
int choosekey = 0
int choosekeyold = 0
float scatsize = 1.0
float headanim = 1.0
float Larmanim = 1.0
float Rarmanim = 1.0
float LLeganim = 1.0
float RLeganim = 1.0
int headmod = 1
int randomanim
string morphstring
sound property Gurgle Auto

float starttimer
float timer = 10.0
bool counttimer = True
int burpinstance
actor forcepred
actor forceprey

;-- Variables ---------------------------------------

Float S1 = 2.70000
Bool[] digestionSurrender
Idle[] modPredatorIdles
Race[] modPredators
Bool scalebool
DevourmentEventHandler[] handlers
Actor[] tummyPreyArray
Actor[] preyArray
Actor[] predArray
Actor[] vomitPreyArray
Actor[] blockArray
Actor[] tummyPredArray
Actor[] vomitPredArray
Armor[] modPredatorBellies
Int[] tummyTimers
Int[] digestionFlags
Int[] vomitTypeArray
Int[] tummyFlags
Int[] vomitFlagsArray
Int[] tummyMaximumTimers
Int numVomits
Int numDigestions
Int numTummies
Int instanceMM
Int vomitFailsafeTimer
Int numHandlers
Int instanceMF
Int numModPredators
Int numBlocks
Int playerDigestionReminder
Int instanceFF
Int instanceFM
Float[] digestionDamage
Float[] digestionTimers
Float B1 = 0.22
Float N1 = 0.700000
Float lastTimeProcessed
;-- Functions ---------------------------------------

; Skipped compiler generated GotoState
function RegisterDigestion(actor pred, actor prey, Int flags)

	NameQuest.Debugger(Pred.GetDisplayName()+" is Pred; "+Prey.GetDisplayName()+" is Prey", "DevourmentRegistryScript")
		pred.modav("variable09",1)
		if (pred.getav("variable09") <= 0)
			pred.modav("variable09",(pred.getav("variable09")*-1) + 1)
		endif
		pred.modav("variable08",1)
		headanim = 1.1
		LArmAnim = 0.3
		RArmAnim = 0.3
		strugglebar = 0
		predArray[numDigestions] = pred
		preyArray[numDigestions] = prey
		actingprey = prey
		digestionFlags[numDigestions] = flags
        digestionSurrender[numDigestions] = prey.hasMagicEffectWithKeyword(Surrender)
        Race MyRace = prey.getLeveledActorBase().getRace()
		if prey.hasKeyword(NPC)&&!prey.haskeyword(creature)&&!MyRace == _Horse
			pred.setav("variable10",1.1) 
			scatsize = 1.1
		elseIf (MyRace == _Hare)
			pred.setav("variable10",0.2) 
			scatsize = 0.3
		elseIf (MyRace == _Wolf)
			pred.setav("variable10",0.9) 
			scatsize = 0.9
		elseIf (MyRace == _Dragon)
			pred.setav("variable10",5) 
			scatsize = 1
		elseIf (MyRace == _Falmer)
			pred.setav("variable10",1) 
			scatsize = 1
		elseIf (MyRace == _Giant)
			pred.setav("variable10",3) 
			scatsize = 3
		elseIf (MyRace == _Mammoth)
			pred.setav("variable10",5) 
			scatsize = 5
		elseIf (MyRace == _Mudcrab)
			pred.setav("variable10",0.5)
			scatsize = 0.5 
		elseIf (MyRace == _Horse)
			pred.setav("variable10",3) 
			scatsize = 1
		elseIf (MyRace == _Troll || MyRace == _TrollFrost)
			pred.setav("variable10",2) 
			scatsize = 2
		elseIf (MyRace == _Cow)
			pred.setav("variable10",2.5)
			scatsize = 2.5 
		elseIf (MyRace == _Hagraven)
			pred.setav("variable10",1) 
			scatsize = 1
		elseIf (MyRace == _DwarvenSpider)
			pred.setav("variable10",0.7) 
			scatsize = 0.7
		elseIf (MyRace == _DwarvenSphere)
			pred.setav("variable10",1.3) 
			scatsize = 1.3
		elseIf (MyRace == _DwarvenCenturion)
			pred.setav("variable10",4) 
			scatsize = 4
		elseIf (MyRace == _BearBlack || MyRace == _BearBrown || MyRace == _BearSnow)
			pred.setav("variable10",2.5) 
			scatsize = 2.5
		elseIf (MyRace == _Sabrecat || MyRace == _SabrecatSnow)
			pred.setav("variable10",2.5) 
			scatsize = 2.5
		elseIf (MyRace == _Draugr || MyRace == _DraugrMagic)
			pred.setav("variable10",1.1)
			scatsize = 1.1
		elseIf (MyRace == _Fox)
			pred.setav("variable10",0.7)
			scatsize = 0.7
		elseIf (MyRace == _Goat || MyRace == _GoatDomestic)
			pred.setav("variable10",0.85)
			scatsize = 0.85
		elseIf (MyRace == _Chaurus || MyRace == _ChaurusReaper)
			pred.setav("variable10",1.4)
			scatsize = 1.4
		elseIf (MyRace == _DragonPriest)
			pred.setav("variable10",1.2)
			scatsize = 1.2
		elseIf (MyRace == _Werewolf)
			pred.setav("variable10",2)
			scatsize = 2
		elseIf (MyRace == _Horker)
			pred.setav("variable10",3)
			scatsize = 3
		elseIf (MyRace == _Deer || MyRace == _Elk)
			pred.setav("variable10",2)
			scatsize = 2
		elseIf (MyRace == _Chicken)
			pred.setav("variable10",0.2)
			scatsize = 0.3
		Else
			pred.setav("variable10",1)
			scatsize = 1
		endIf
		pred.setav("variable10",pred.getav("variable10")*(prey.getscale()/Pred.getscale()))
		if pred.getav("variable09") == 1
		pred.setav("variable10", pred.getav("variable10")*1) 
		elseIf pred.getav("variable09") == 2
		pred.setav("variable10", pred.getav("variable10")*1.19) 
		elseIf pred.getav("variable09") == 3
		pred.setav("variable10", pred.getav("variable10")*1.28) 
		elseIf pred.getav("variable09") == 4
		pred.setav("variable10", pred.getav("variable10")*1.37) 
		elseIf pred.getav("variable09") == 5
		pred.setav("variable10", pred.getav("variable10")*1.46) 
		elseIf pred.getav("variable09") == 6
		pred.setav("variable10", pred.getav("variable10")*1.55) 
		elseIf pred.getav("variable09") == 7
		pred.setav("variable10", pred.getav("variable10")*1.64) 
		elseIf pred.getav("variable09") == 8
		pred.setav("variable10", pred.getav("variable10")*1.73) 
		elseIf pred.getav("variable09") == 9
		pred.setav("variable10", pred.getav("variable10")*1.82) 
		elseIf pred.getav("variable09") == 10
		pred.setav("variable10", pred.getav("variable10")*1.91) 
		endIf
	
	pred.setav("variable10", pred.getav("variable10")*(prey.getscale()/pred.getscale()))
	pred.setav("variable10", pred.getav("variable10")*_ScaleBelly.getvalue()) 

				
	if((MorphOnly.getvalue() == 1)||(breastvore.getvalue() == 0||pred.getLeveledActorBase().getSex() == 0)&&(cockvore.getvalue() == 0||pred.getLeveledActorBase().getSex() == 1)&&(pred.Wornhaskeyword(morphvore)||(!pred.getwornform(kSlotMask32)&&nakedbody.haskeyword(morphvore))||pred.haskeyword(creature)))
		pred.setav("variable10", pred.getav("variable10")) 
		nodescale = "NPC Belly"
		morphstring = "Vore prey belly"
		netimmerse.setNodeScale(pred as objectreference, nodescale, 0, False)
		NiOverride.SetBodyMorph(pred, morphstring,"memes", pred.getav("variable10"))			 
	else
		if(pred.getLeveledActorBase().getSex() == 0&&cockvore.getvalue()== 1)
		 nodescale = "NPC GenitalsScrotum [GenScrot]"
		 pred.setav("variable10", pred.getav("variable10")*10)
		netimmerse.setNodeScale(pred as objectreference, nodescale, pred.getav("variable10"), False)
		netimmerse.setNodeScale(pred as objectreference, "NPC Belly", 0, False)
		 else
		nodescale = "NPC Belly"
		netimmerse.setNodeScale(pred as objectreference, nodescale, pred.getav("variable10"), False)
		netimmerse.setNodeScale(pred as objectreference, "NPC GenitalsScrotum [GenScrot]", 1, False)
		 endif
		if(pred.getLeveledActorBase().getSex() == 1&&breastvore.getvalue() == 1)
		morphstring = "Breasts"
		NiOverride.SetBodyMorph(pred, morphstring,"memes", pred.getav("variable10"))
		netimmerse.setNodeScale(pred as objectreference, "NPC GenitalsScrotum [GenScrot]", 1, False) 
		netimmerse.setNodeScale(pred as objectreference, "NPC Belly", 0, False)	
		endif
		
		
			
	EndIf
		if(prey.isdead()&&pred == Game.GetPlayer())
		wasdead = True
		else
		wasdead = False
		endif
		stomach =	StomachSound.play(pred as objectreference)
		
		NiOverride.UpdateModelWeight(pred)
		netimmerse.setNodeScale(pred as objectreference, "Devourment Belly Envelope S", 1 as Float, False)
		netimmerse.setNodeScale(pred as objectreference, "Devourment Belly Envelope N", 1 as Float, False)
		if flags > 0

				if prey.getLeveledActorBase().getSex() == 1&&!pred.haskeyword(creature)
					if pred.getitemcount(FullnessTypes as form) == 0
						pred.addItem(FullnessFPrey as form, 1, True)
						pred.equipItem(FullnessFPrey as form, True, True)
					endIf
					if pred.getLeveledActorBase().getSex() == 1 && !prey.IsDead() && prey.hasKeyword(NPC)&&!pred.haskeyword(creature)&&!prey.hasKeyword(creature)
						if(UnwillingAudio.getvalue() == 1)
						instanceFF = FFSound.play(pred as objectreference)
						endif
						if(facialanim.getvalue() == 1)
						pred.SetExpressionOverride(10, 100)
						mfgconsolefunc.SetPhoneme(pred, 5, 100)
						 endif
					elseIf !prey.IsDead() && prey.hasKeyword(NPC)&&!pred.haskeyword(creature)&&!prey.hasKeyword(creature)
						if(UnwillingAudio.getvalue() == 1)
						instanceMF = MFSound.play(pred as objectreference)
						endif
						if(facialanim.getvalue() == 1)
						pred.SetExpressionOverride(10, 100)
						mfgconsolefunc.SetPhoneme(pred, 5, 100)
						 endif
					endIf
			elseif !pred.haskeyword(creature)
					if pred.getitemcount(FullnessTypes as form) == 0
						pred.addItem(FullnessMPrey as form, 1, True)
						pred.equipItem(FullnessMPrey as form, True, True)
					endIf
					if pred.getLeveledActorBase().getSex() == 1 && !prey.IsDead() && prey.hasKeyword(NPC)&&!pred.haskeyword(creature)&&!prey.hasKeyword(creature)
						if(UnwillingAudio.getvalue() == 1)
						instanceFM = FMSound.play(pred as objectreference)
						endif
						if(facialanim.getvalue() == 1)
							pred.SetExpressionOverride(10, 100)
							mfgconsolefunc.SetPhoneme(pred, 5, 100)
						endif
					elseIf !prey.IsDead() && prey.hasKeyword(NPC)&&!pred.haskeyword(creature)&&!prey.hasKeyword(creature)
						if(UnwillingAudio.getvalue() == 1)
						instanceMM = MMSound.play(pred as objectreference)
						endif
						if(facialanim.getvalue() == 1)
						pred.SetExpressionOverride(10, 100)
						mfgconsolefunc.SetPhoneme(pred, 5, 100)
						endif
					endIf
				endIf
			if(prey.getLeveledActorBase().getSex() == 1&&pred.haskeyword(creature))
				if(Unwillingaudio.getvalue() == 1)
				cfinstance = CFsound.play(pred)
			endif
				pred.equipItem(FullnessMPrey as form, True, True)
				elseif(prey.getLeveledActorBase().getSex() == 0&&pred.haskeyword(creature))
				if(Unwillingaudio.getvalue() == 1)
				cminstance = CMsound.play(pred)
			endif
				pred.equipItem(FullnessMPrey as form, True, True)
				endif
				
			
			
		else
			
				if pred.getitemcount(FullnessTypes as form) == 0
					pred.addItem(FullnessNonlethal as form, 1, True)
					pred.equipItem(FullnessNonlethal as form, True, True)
				endIf
		
			if prey == game.getPlayer()
			if(pred.getrace() == _Horse)
				Game.SetCameraTarget(pred)
				pred.SetPlayerControls(True)
				pred.EnableAI(True)
			endif	
			
				prey.setPlayerControls(False)				
				prey.enableAI(False)				
				pred.enableAI(True)		
				
				PukeMessage.show()
				game.unlockWord(VomitWord)
				prey.equipShout(VomitMeShout)
				prey.equipSpell(DummySpell, 1)
				prey.equipSpell(DummySpell, 0)
				prey.unequipSpell(DummySpell, 1)
				prey.unequipSpell(DummySpell, 0)
				prey.setVoiceRecoveryTime(0 as Float)
			if(prey.hasperk(CO))
			 prey.addspell(wellrested)	
			endif
			endIf
		endIf
		if prey != game.getPlayer()
			prey.moveTo(HerStomach)
		else
			StayAtPredLocation.Cast(prey as objectreference, pred as objectreference)
			prey.setPosition(pred.getPositionX() + 1000 as Float, pred.getPositionY() + 1000 as Float, pred.getPositionZ())
			prey.setAlpha(0 as Float, False)
			prey.setGhost(True)
			if flags > 0
				game.DisablePlayerControls(True, True, True, False, True, True, True, False, 0)
			else
				game.DisablePlayerControls(False, False, False, False, False, True, True, False, 0)
			endIf
			game.setCameraTarget(pred)
			prey.addSpell(NotThere, False)
			prey.clearExtraArrows()
			prey.setPlayerControls(False)
			prey.stopCombatAlarm()
			prey.stopCombat()
			pred.stopCombat()
			pred.setAlert(False)
			pred.evaluatePackage()
		endIf
		if flags > 0
			digestionTimers[numDigestions] = Self.getDigestionTime(pred) * 5 as Float
			digestionDamage[numDigestions] = (Self.getDigestionDamage(pred, prey)*acidamagemodifier.getvalue()) / 5	as Float
			if pred == game.getPlayer() && !prey.IsDead()
				Float LevelGain = prey.getLevel() as Float / 2.00000 * (1 as Float - (15 as Float + pred.getAV("Variable05")) / 100 as Float)
				if LevelGain > 1.00000
					LevelGain = 1.00000
				elseIf LevelGain < 0.000000
					LevelGain = 0.000000
				endIf
				LevelGain *= 100 as Float
				if LevelGain < 20 as Float && pred.getAV("Variable05") < 35 as Float
					LevelGain = 20 as Float
				elseIf LevelGain < 10 as Float && pred.getAV("Variable05") < 60 as Float
					LevelGain = 10 as Float
				elseIf LevelGain < 5 as Float && pred.getAV("Variable05") < 85 as Float
					LevelGain = 5 as Float
				elseIf pred.getAV("Variable05") >= 85 as Float
					LevelGain = 0 as Float
				endIf
				pred.modAV("Variable02", LevelGain)
				if pred.getAV("Variable02") >= 100 as Float
					pred.modAV("Variable02", -100 as Float)
					pred.modAV("Variable05", 1 as Float)
					VSkillLevelUp.show()
					VSkillLevelSound.play(pred as objectreference)
				endIf
			endIf
		endIf
		numDigestions += 1
		Self.SendDevourmentEvent(1, pred, prey, flags, 0 as Float, False)
endFunction

function RemoveGhost(actor prey)
    NameQuest.Debugger(Prey.GetDisplayName()+" is prey in REMOVEGHOST", "DevourmentRegisteryScript")
	if prey != game.getPlayer()&&prey != None
		prey.moveTo(HerStomach)
		prey.removeSpell(NotThere)
		prey.setAlpha(100 as Float, False)
		prey.setGhost(False)
	endIf
endFunction

Bool function switchLethal(actor prey)
    NameQuest.Debugger(Prey.GetDisplayName()+" is prey in SwitchLethal", "DevourmentRegisteryScript")
	Int index = preyArray.find(prey, 0)
	actor pred = predArray[index]
	if index > -1
		if digestionFlags[index] < 0
			digestionDamage[index] = Self.getDigestionDamage(pred, prey) / 5 as Float
			digestionTimers[index] = Self.getDigestionTime(pred) * 5 as Float
			pred.removeItem(FullnessNonlethal as form, 1, True, none)
			
			if prey.getLeveledActorBase().getSex() == 1
				if pred.getitemcount(FullnessTypes as form) == 0
					pred.addItem(FullnessFPrey as form, 1, True)
					pred.equipItem(FullnessFPrey as form, True, True)
				endIf
				if pred.getLeveledActorBase().getSex() == 1 && !prey.IsDead() && prey.hasKeyword(NPC)&&prey.getRace() != _Dragon&&!pred.haskeyword(creature)&&!prey.hasKeyword(creature)
					instanceFF = FFSound.play(pred as objectreference)
					if(facialanim.getvalue() == 1)
						pred.SetExpressionOverride(10, 100)
						mfgconsolefunc.SetPhoneme(pred, 5, 100)
						endif
				endIf
				if pred.getLeveledActorBase().getSex() == 0 && !prey.IsDead() && prey.hasKeyword(NPC)&&prey.getRace() != _Dragon&&!pred.haskeyword(creature)&&!prey.hasKeyword(creature)
					instanceMF = MFSound.play(pred as objectreference)
					if(facialanim.getvalue() == 1)
						pred.SetExpressionOverride(10, 100)
						mfgconsolefunc.SetPhoneme(pred, 5, 100)
					endif
				endIf
			else
				if pred.getLeveledActorBase().getSex() == 1 && !prey.IsDead() && prey.hasKeyword(NPC)&&prey.getRace() != _Dragon&&!pred.haskeyword(creature)&&!prey.hasKeyword(creature)
					instanceFM = FMSound.play(pred as objectreference)
					if(facialanim.getvalue() == 1)
					pred.SetExpressionOverride(10, 100)
					mfgconsolefunc.SetPhoneme(pred, 5, 100)
					endif
				endIf
				if pred.getLeveledActorBase().getSex() == 0 && !prey.IsDead() && prey.hasKeyword(NPC)&&prey.getRace() != _Dragon&&!pred.haskeyword(creature)&&!prey.hasKeyword(creature)
					instanceMM = MMSound.play(pred as objectreference)
					if(facialanim.getvalue() == 1)
					pred.SetExpressionOverride(10, 100)
					mfgconsolefunc.SetPhoneme(pred, 5, 100)
					endif
				endIf
				if pred.getitemcount(FullnessTypes as form) == 0
					pred.addItem(FullnessMPrey as form, 1, True)
					pred.equipItem(FullnessMPrey as form, True, True)
				endIf
			endIf
			Self.SendDevourmentEvent(1, predArray[index], preyArray[index], digestionFlags[index], 0 as Float, False)
		else
			pred.removeItem(FullnessTypes as form, 99, True, none)
			pred.addItem(FullnessNonlethal as form, 1, True)
			pred.equipItem(FullnessNonlethal as form, True, True)
		endIf
		digestionFlags[index] = -1 * digestionFlags[index]
		return True
	endIf

	return False

endFunction

Bool function hasLivePrey(actor pred)

	return predArray.find(pred, 0) > -1
endFunction

Bool function sendDialogEvent(Float customID)
    NameQuest.Debugger(CustomID+" is CUSTOMID in SendDialogueEvent", "DevourmentRegisteryScript")
	Int index = preyArray.find(DialogPreyAlias.getActorRef(), 0)
	if index > -1
		Self.SendDevourmentEvent(9, predArray[index], preyArray[index], digestionFlags[index], customID, False)
		return True
	endIf
	return False
endFunction

Float function getDigestionTime(actor pred)
	Float maxTime = 0 as Float
	Float PredSkill = 0 as Float
	if pred == game.getPlayer()
		PredSkill = pred.getAV("Variable05") + 15 as Float
	else
		PredSkill = pred.getAV("Variable05") + ((pred.getLevel() as Float * 1.70000) as Int) as Float
		if PredSkill > 100 as Float
			PredSkill = 100 as Float
		endIf
	endIf
	maxTime = 8.00000 * (1 as Float + PredSkill / 100.000)
	if _noreturn.getvalue() == 1 as Float
		maxTime *= 500 as Float
	endIf
	if pred.hasPerk(IronStomach75)
		maxTime *= 2.50000
	elseIf pred.hasPerk(IronStomach50)
		maxTime *= 2 as Float
	elseIf pred.hasPerk(IronStomach25)
		maxTime *= 1.50000
	endIf
	if pred != game.getPlayer()
		maxTime *= 2 as Float
	endIf
	maxTime += pred.getAV("Infamy")
	if maxTime < 10 as Float
		maxTime = 10 as Float
	endIf
	maxTime *= DTime.getvalue()
    return maxTime
    NameQuest.Debugger(MaxTime+" is Digestion Time", "DevourmentRegisteryScript")
endFunction

function ExpelRemains(Int index)
    NameQuest.Debugger(Index+" is Expelled in ExpelRemains", "DevourmentRegisteryScript")
	actor pred = tummyPredArray[index]
	actor prey = tummyPreyArray[index]
	Bool NotOverYet = False
	if prey == game.getPlayer()
		prey.removeSpell(NotThere)
		prey.moveTo(pred as objectreference)
		pred.dispelSpell(StayAtPredLocation)
		if NewPlayerGlobal.getValueInt() == 0
			prey.KillEssential(pred)
		endIf
	endIf
	if ScatGlobal.getvalue() == 1 as Float
		if pred == game.getPlayer()
			if !pred.isSneaking()&&!pred.haskeyword(creature)
				PoopMessage.show()
				NotOverYet = True
			else
				
				pred.SetExpressionOverride(16, 0)
				mfgconsolefunc.SetPhoneme(pred, 5, 0)
				DigestionVisualSpellToo.Cast(pred as objectreference, none)
				
				sound.StopInstance(stomach)
				if(shititems.getvalue() == 1)
				pred.placeatme(prey.getwornform(0x00000001))
				pred.placeatme(prey.getwornform(0x00000002))
				pred.placeatme(prey.getwornform(0x00000004))
				pred.placeatme(prey.getwornform(0x00000008))
				pred.placeatme(prey.getwornform(0x00000010))
				pred.placeatme(prey.getwornform(0x00000080))
				pred.placeatme(prey.getwornform(0x00000200))			 
				prey.removeitem(prey.getwornform(0x00000001))
				prey.removeitem(prey.getwornform(0x00000002))
				prey.removeitem(prey.getwornform(0x00000004))
				prey.removeitem(prey.getwornform(0x00000008))
				prey.removeitem(prey.getwornform(0x00000010))
				prey.removeitem(prey.getwornform(0x00000080))
				prey.removeitem(prey.getwornform(0x00000200))
				endif
				;NiOverride.SetBodyMorph(pred, "vore prey belly","memes", 0)				
				;NiOverride.UpdateModelWeight(pred)
				
				pred.modav("variable09",-1)
				if prey.getRace() == Kha || prey.getRace() == KhaV

							objectreference dead = pred.placeAtMe(Poopkhajiit as form, 1, False, False)	
							dead.setAngle(0 as Float, 0 as float, Utility.RandomFloat(0, 360))	
						dead.setscale(prey.getscale()*scatsize)										 
						prey.removeAllItems(dead, False, True)
						
					
				elseIf prey.getRace() == Arg || prey.getRace() == ArgV

							objectreference dead = pred.placeAtMe(Poopargonian as form, 1, False, False)	
						 dead.setAngle(0 as Float, 0 as float, Utility.RandomFloat(0, 360))	 
					dead.setscale(prey.getscale()*scatsize)				 
					prey.removeAllItems(dead, False, True)
					
	
				elseIf prey.getRace() == Dun || prey.getRace() == DunV || prey.getRace() == Alt || prey.getRace() == AltV || prey.getRace() == Bos || prey.getRace() == BosV

							objectreference dead = pred.placeAtMe(Poopelf as form, 1, False, False)	
						 dead.setAngle(0 as Float, 0 as float, Utility.RandomFloat(0, 360))	
					dead.setscale(prey.getscale()*scatsize)				 
					prey.removeAllItems(dead, False, True)
					 
				elseIf prey.getRace() == Ors || prey.getRace() == OrsV
							objectreference dead = pred.placeAtMe(PoopOrc as form, 1, False, False)	
						 dead.setAngle(0 as Float, 0 as float, Utility.RandomFloat(0, 360))	
						dead.setscale(prey.getscale()*scatsize)				 
						prey.removeAllItems(dead, False, True)
						
				elseIf prey.getRace() == _Dragon
					objectreference dead = pred.placeAtMe(PoopDragon as form, 1, False, False)
					 dead.setAngle(0 as Float, 0 as float, Utility.RandomFloat(0, 360))	
					dead.setscale(prey.getscale()*scatsize)
					prey.removeAllItems(dead, False, True)
					
				elseIf prey.getRace() == _Horse
					objectreference dead = pred.placeAtMe(PoopHorse as form, 1, False, False)
					 dead.setAngle(0 as Float, 0 as float, Utility.RandomFloat(0, 360))	
					dead.setscale(prey.getscale()*scatsize)
					prey.removeAllItems(dead, False, True)
					
				elseIf prey.hasKeyword(NPC)&&!prey.haskeyword(creature)

						objectreference dead = pred.placeAtMe(Poop as form, 1, False, False)	
						dead.setAngle(0 as Float, 0 as float, Utility.RandomFloat(0, 360))	
						prey.removeAllItems(dead, False, True)				 
						
				
					
				else
					objectreference dead = pred.placeAtMe(PoopNA as form, 1, False, False)
					 dead.setAngle(0 as Float, 0 as float, Utility.RandomFloat(0, 360))	
					dead.setscale(prey.getscale()*scatsize)
					prey.removeAllItems(dead, False, True)
					
				endIf
				 if pred.getLeveledActorBase().getSex() == 1&&!pred.haskeyword(creature)
					mfgconsolefunc.SetModifier(pred, 0, 90)
					mfgconsolefunc.SetModifier(pred, 1, 90)
					pred.SetExpressionOverride(10, 100)
					if(FemScatSound.playandwait(pred as objectreference))
					mfgconsolefunc.SetModifier(pred, 0, 0)
					mfgconsolefunc.SetModifier(pred, 1, 0)
					pred.SetExpressionOverride(10, 0)	
					endif
				
				elseif pred.getLeveledActorBase().getSex() == 0&&!pred.haskeyword(creature)
					mfgconsolefunc.SetModifier(pred, 0, 90)
					mfgconsolefunc.SetModifier(pred, 1, 90)
					pred.SetExpressionOverride(10, 100)
					if(MaleScatSound.playandwait(pred as objectreference))
					mfgconsolefunc.SetModifier(pred, 0, 0)
					mfgconsolefunc.SetModifier(pred, 1, 0)
					pred.SetExpressionOverride(10, 0)	
					endif
				Else
					scatsound.play(pred as ObjectReference)
				endIf
			endIf
			
		else
			Debug.SendAnimationEvent(pred as ObjectReference, "IdleWarmHandsCrouched")
			Utility.Wait(1.0)
			if prey.getRace() == Kha || prey.getRace() == KhaV
							objectreference dead = pred.placeAtMe(Poopkhajiit as form, 1, False, False)	
						 dead.setAngle(0 as Float, 0 as float, Utility.RandomFloat(0, 360))	
					dead.setscale(prey.getscale()*scatsize)				 
					prey.removeAllItems(dead, False, True)
			
			elseIf prey.getRace() == Arg || prey.getRace() == ArgV

							objectreference dead = pred.placeAtMe(Poopargonian as form, 1, False, False)	
						 dead.setAngle(0 as Float, 0 as float, Utility.RandomFloat(0, 360))	 
					dead.setscale(prey.getscale()*scatsize)				 
					prey.removeAllItems(dead, False, True)
					
				
			elseIf prey.getRace() == Dun || prey.getRace() == DunV || prey.getRace() == Alt || prey.getRace() == AltV || prey.getRace() == Bos || prey.getRace() == BosV
						
							objectreference dead = pred.placeAtMe(Poopelf as form, 1, False, False)	
						 dead.setAngle(0 as Float, 0 as float, Utility.RandomFloat(0, 360))	
					dead.setscale(prey.getscale()*scatsize)				 
					prey.removeAllItems(dead, False, True)
		
			elseIf prey.getRace() == Ors || prey.getRace() == OrsV

							objectreference dead = pred.placeAtMe(Pooporc as form, 1, False, False)	
						 dead.setAngle(0 as Float, 0 as float, Utility.RandomFloat(0, 360))	
					dead.setscale(prey.getscale()*scatsize)				 
					prey.removeAllItems(dead, False, True)
								
			elseIf prey.getRace() == _Dragon
				objectreference dead = pred.placeAtMe(PoopDragon as form, 1, False, False)
				dead.setAngle(0 as Float, 0 as float, Utility.RandomFloat(0, 360))	
				dead.setscale(prey.getscale()*scatsize)			 
				prey.removeAllItems(dead, False, True)				
			elseIf prey.getRace() == _Horse
				objectreference dead = pred.placeAtMe(PoopHorse as form, 1, False, False)
				dead.setAngle(0 as Float, 0 as float, Utility.RandomFloat(0, 360))	
				dead.setscale(prey.getscale()*scatsize)
				prey.removeAllItems(dead, False, True)
				
			elseIf prey.hasKeyword(NPC)&&!prey.haskeyword(creature)
				objectreference dead = pred.placeAtMe(Poop as form, 1, False, False) 
						dead.setAngle(0 as Float, 0 as float, Utility.RandomFloat(0, 360))	
					dead.setscale(prey.getscale()*scatsize)				 
					prey.removeAllItems(dead, False, True)
					 
			 
			else
				objectreference dead = pred.placeAtMe(PoopNA as form, 1, False, False)
				 dead.setAngle(0 as Float, 0 as float, Utility.RandomFloat(0, 360))	
				dead.setscale(prey.getscale()*scatsize)
				prey.removeAllItems(dead, False, True)
			endIf
			if prey != game.getPlayer()
				
			else
				prey.moveTo(pred as objectreference)
				prey.setPosition(pred.getPositionX(), pred.getPositionY(), pred.getPositionZ())
			endIf
			DigestionVisualSpellToo.Cast(pred as objectreference, none)
			if pred.getLeveledActorBase().getSex() == 1&&!pred.haskeyword(creature)&&ScatMoans.getvalue() == 1
						mfgconsolefunc.SetModifier(pred, 0, 90)
					mfgconsolefunc.SetModifier(pred, 1, 90)
					pred.SetExpressionOverride(10, 100)
					if(FemScatSound.playandwait(pred as objectreference))
					mfgconsolefunc.SetModifier(pred, 0, 0)
					mfgconsolefunc.SetModifier(pred, 1, 0)	
					pred.SetExpressionOverride(10, 0)	
					endif
				
				elseif pred.getLeveledActorBase().getSex() == 0&&!pred.haskeyword(creature)&&ScatMoans.getvalue() == 1
						mfgconsolefunc.SetModifier(pred, 0, 90)
					mfgconsolefunc.SetModifier(pred, 1, 90)
					pred.SetExpressionOverride(10, 100)
					if(MaleScatSound.playandwait(pred as objectreference))
					mfgconsolefunc.SetModifier(pred, 0, 0)
					mfgconsolefunc.SetModifier(pred, 1, 0)	
					pred.SetExpressionOverride(10, 0) 
					endif
				Else
					scatsound.play(pred as ObjectReference)
				endif
				sound.StopInstance(stomach)
			pred.modav("variable09",-1)
			sound.StopInstance(stomach)
			;NiOverride.SetBodyMorph(pred, "vore prey belly","memes", 0)			
			;NiOverride.UpdateModelWeight(pred)
	
			if(facialanim.getvalue() == 1)
			pred.SetExpressionOverride(10, 0)
			mfgconsolefunc.SetPhoneme(pred, 5, 0)
			EndIf
			
			
		if (pred.getav("variable09") == 0)
			pred.removeItem(FullnessTypes as form, 99, True, none)
		endif
		endIf
			Utility.Wait(2)
			Debug.SendAnimationEvent(pred as ObjectReference, "IdleStop")
	elseIf ScatGlobal.getvalue() == 2 as Float
		Self.RegisterDeadVomit(pred, prey)
		;NiOverride.SetBodyMorph(pred, "vore prey belly","memes", 0)
		;NiOverride.UpdateModelWeight(pred)
			 pred.SetExpressionOverride(16, 0)
			 mfgconsolefunc.SetPhoneme(pred, 5, 0)
			if(facialanim.getvalue() == 1)
						pred.SetExpressionOverride(10, 0)
						mfgconsolefunc.SetPhoneme(pred, 5, 0)
						endif
				sound.StopInstance(stomach)
	elseIf ScatGlobal.getvalue() == 3 as Float
		if pred == game.getPlayer()
			if !pred.isSneaking()
				BonesMessage.show()
				NotOverYet = True
			else
				pred.SetExpressionOverride(16, 0)
				mfgconsolefunc.SetPhoneme(pred, 5, 0)
				if(shititems.getvalue() == 1)
				 pred.placeatme(prey.getwornform(0x00000001))
				pred.placeatme(prey.getwornform(0x00000002))
				pred.placeatme(prey.getwornform(0x00000004))
				pred.placeatme(prey.getwornform(0x00000008))
				pred.placeatme(prey.getwornform(0x00000010))
				pred.placeatme(prey.getwornform(0x00000080))
				pred.placeatme(prey.getwornform(0x00000200))			 
				prey.removeitem(prey.getwornform(0x00000001))
				prey.removeitem(prey.getwornform(0x00000002))
				prey.removeitem(prey.getwornform(0x00000004))
				prey.removeitem(prey.getwornform(0x00000008))
				prey.removeitem(prey.getwornform(0x00000010))
				prey.removeitem(prey.getwornform(0x00000080))
				prey.removeitem(prey.getwornform(0x00000200))
				endif
			DigestionVisualSpellToo.Cast(pred as objectreference, none)
				BoneSound.play(pred as objectreference)
				sound.StopInstance(stomach)
				scalebool = False
				pred.modav("variable09",-1)
				sound.StopInstance(stomach)
				;NiOverride.SetBodyMorph(pred, "vore prey belly","memes", 0)
				;NiOverride.UpdateModelWeight(pred)
			if(facialanim.getvalue() == 1)
				pred.SetExpressionOverride(10, 0)
				mfgconsolefunc.SetPhoneme(pred, 5, 0)
						endif
				
				if prey.hasKeyword(NPC)&&!prey.haskeyword(creature)
					actor dead = pred.placeAtMe(Skeleton as form, 1, False, False) as actor 
					dead.setPosition(pred.getPositionX(), pred.getPositionY(), pred.getPositionZ())
					dead.setScale(0.500000)
					dead.kill(none)
					objectreference boom = dead.placeAtMe(BoneExplosion as form, 1, False, False)
					prey.removeAllItems(dead as objectreference, False, True)
					utility.wait(0.100000)	
					dead.setscale(prey.getscale())				
					pred.removeItem(FullnessTypes as form, 99, True, none)
					if(Pred.hasperk(RD))
						Utility.Wait(2)						
						RaiseDead.cast(pred,dead)
					endif
				Else
					
				objectreference dead = pred.placeAtMe(PoopNA as form, 1, False, False)
				dead.setscale(prey.getscale())
				dead.setAngle(0 as Float, 0 as Float, 0 as Float)
				prey.removeAllItems(dead, False, True)
				pred.modav("variable09",-1)
				sound.StopInstance(stomach)
				endIf
			endIf
		else
			DigestionVisualSpellToo.Cast(pred as objectreference, none)
			BoneSound.play(pred as objectreference)
			sound.StopInstance(stomach)
			;NiOverride.SetBodyMorph(pred, "vore prey belly","memes", 0)
			;NiOverride.UpdateModelWeight(pred)
			
			sound.StopInstance(stomach)
			if(facialanim.getvalue() == 1)
				pred.SetExpressionOverride(10, 0)
				mfgconsolefunc.SetPhoneme(pred, 5, 0)
						endif
			if prey.hasKeyword(NPC)
				actor dead = pred.placeAtMe(Skeleton as form, 1, False, False) as actor
				dead.setPosition(pred.getPositionX(), pred.getPositionY(), -20 as Float + pred.getPositionZ())
				dead.setscale(prey.getscale()*scatsize)
				dead.kill(none)
				objectreference boom = dead.placeAtMe(BoneExplosion as form, 1, False, False)
				prey.removeAllItems(dead as objectreference, False, True)
				if prey != game.getPlayer()
					
				else
					prey.moveTo(pred as objectreference)
					prey.setPosition(pred.getPositionX(), pred.getPositionY(), pred.getPositionZ())
				endIf
				utility.wait(0.100000)
				dead.setscale(prey.getscale())
				pred.removeItem(FullnessTypes as form, 99, True, none)
				pred.modav("variable09",-1)
				endIf
		endIf
	else
		DigestionVisualSpellToo.Cast(pred as objectreference, none)
		prey.removeAllItems(pred as objectreference, False, True)
		pred.removeItem(FullnessTypes as form, 99, True, none)
		sound.StopInstance(stomach)
		;NiOverride.SetBodyMorph(pred, "vore prey belly","memes", 0)
		; NiOverride.UpdateModelWeight(pred)
		pred.modav("variable09",-1)
	endIf
	if prey == game.getPlayer() && NewPlayerGlobal.getValueInt() != 0 && (game.getPlayer().getActorBase().getSex() == 1 || game.getPlayer().getActorBase().getSex() == 0) && pred.hasKeyword(NPC)
		NameQuest.switchPlayer(pred, prey)
		Self.SendDevourmentEvent(8, pred, prey, tummyFlags[index], 0 as Float, False)
	endIf
	if !NotOverYet
		Self.UnregisterCompletedTummy(index)
		Self.SendDevourmentEvent(6, pred, prey, tummyFlags[index], 0 as Float, False)
	endIf
endFunction

function UnregisterVomit()

	ReadyToVomit.setValue(0 as Float)
	vomitFailsafeTimer = 0
	Int notZero = 0
	while notZero < 127
		vomitPredArray[notZero] = vomitPredArray[notZero + 1]
		vomitPreyArray[notZero] = vomitPreyArray[notZero + 1]
		vomitTypeArray[notZero] = vomitTypeArray[notZero + 1]
		notZero += 1
	endWhile
	vomitPredArray[127] = none
	vomitPreyArray[127] = none
	vomitTypeArray[127] = 0
	numVomits = -1 + numVomits
endFunction

function ZeroPointSevenUpdate()
	NameQuest.Debugger(" 0.7 update function", "DevourmentRegisteryScript")
	digestionFlags = new Int[128]
	handlers = new DevourmentEventHandler[128]
	numHandlers = 0
	modPredators = new Race[128]
	modPredatorIdles = new Idle[128]
	modPredatorBellies = new Armor[128]
	numModPredators = 0
	vomitFlagsArray = new Int[128]
	tummyFlags = new Int[128]
	Self.RegisterForKey(34)
endFunction

Bool function isInitialized()

    return modPredators.length == 128
    NameQuest.Debugger("INITIALIZED", "DevourmentRegisteryScript")
endFunction

Int function addIngestionMethod(idle swallowAnim)
	NameQuest.Debugger("AddIngestionMethod() this is empty??", "DevourmentRegistryScript")
endFunction

armor function getModPredatorBelly(race predRace)

	Int index = modPredators.find(predRace, 0)
	if index > -1
		return modPredatorBellies[index]
	endIf
	return none
endFunction

function DoDialog(actor pred, actor prey, Int flags)
    NameQuest.Debugger(Prey.GetDisplayName()+" is prey in doDialogue", "DevourmentRegisteryScript")
    Actor Player = Game.GetPlayer()
    ObjectReference PredO = Pred as ObjectReference
    ObjectReference PreyO = Prey as ObjectReference
	if digestionFlags[preyArray.find(prey, 0)] < 0
		lethal = False
	else
		lethal = True
	endIf
	DialogPredAlias.ForceRefTo(predO)
	DialogPreyAlias.ForceRefTo(preyO)
	Self.SendDevourmentEvent(7, pred, prey, flags, 0 as Float, False)
	prey.moveTo(predO)
	StayAtPredLocation.Cast(preyO, predO)
	prey.setAlpha(0 as Float, False)
	prey.setGhost(True)
	prey.addSpell(NotThere, False)
	prey.clearExtraArrows()
	prey.stopCombatAlarm()
	prey.stopCombat()
	utility.wait(0.5)
	if pred == Player
		if !prey.activate(predO, True)
			activatedDialog = False
			return 
		endIf
	elseIf !pred.activate(preyO, True)
		activatedDialog = False
		return 
	endIf
	utility.wait(0.5)
	while pred == Player && prey.isInDialogueWithPlayer() || pred.isInDialogueWithPlayer()
		utility.wait(1.0)
	endWhile
	if prey != Player && Self.whoAte(prey) != none
		prey.moveTo(HerStomach)
		prey.removeSpell(NotThere)
		prey.setAlpha(100 as Float, False)
		prey.setGhost(False)
	endIf
	activatedDialog = False
endFunction

function RegisterAllVomits(actor pred)

	Int index = 0
	while index < numDigestions
		if predArray[index] == pred
			Self.registerVomit(preyArray[index], 1)
		endIf
		index += 1
	endWhile
endFunction

function RegisterShrinkingTummy(Int index)

	tummyPredArray[numTummies] = predArray[index]
	tummyPreyArray[numTummies] = preyArray[index]
	tummyTimers[numTummies] = DeadDigestionTime.getValueInt()
	tummyMaximumTimers[numTummies] = DeadDigestionTime.getValueInt()
	tummyFlags[numTummies] = digestionFlags[index]
	numTummies += 1
	Self.UnregisterDigestion(index, True)
endFunction

function OnInit()

	handlers = new DevourmentEventHandler[128]
	numHandlers = 0
	predArray = new Actor[128]
	preyArray = new Actor[128]
	digestionFlags = new Int[128]
	digestionTimers = new Float[128]
	digestionDamage = new Float[128]
	digestionSurrender = new Bool[128]
	numDigestions = 0
	vomitPredArray = new Actor[128]
	vomitPreyArray = new Actor[128]
	vomitTypeArray = new Int[128]
	vomitFlagsArray = new Int[128]
	numVomits = 0
	vomitFailsafeTimer = 0
	tummyPredArray = new Actor[128]
	tummyPreyArray = new Actor[128]
	tummyTimers = new Int[128]
	tummyMaximumTimers = new Int[128]
	tummyFlags = new Int[128]
	numTummies = 0
	blockArray = new Actor[128]
	numBlocks = 0
	modPredators = new Race[128]
	modPredatorIdles = new Idle[128]
	modPredatorBellies = new Armor[128]
	numModPredators = 0
	lastTimeProcessed = utility.getCurrentGameTime()
	playerDigestionReminder = 0
	Self.RegisterForKey(34)
	Self.RegisterForSingleUpdate(0.100000)
endFunction

Bool function isModPredatorRace(race predRace)

	return modPredators.find(predRace, 0) > -1
endFunction

function SendDevourmentEvent(Int eventType, actor pred, actor prey, Int flags, Float fraction, Bool oral)
	NameQuest.Debugger("EventType: "+EventType+"; Pred: "+Pred.GetDisplayName()+"; Prey: "+Prey.GetDisplayName(), "DevourmentRegistryScript")
	Int index = 0
	while index < numHandlers
		if eventType == 1
			handlers[index].onSwallow(pred, prey, flags)
		elseIf eventType == 2
			handlers[index].onEscape(pred, prey, flags, oral)
		elseIf eventType == 3
			handlers[index].onDigestionTick(pred, prey, flags, fraction)
		elseIf eventType == 4
			handlers[index].onPreyDeath(pred, prey, flags)
		elseIf eventType == 5
			handlers[index].onDeadDigestionTick(pred, prey, flags, fraction)
		elseIf eventType == 6
			handlers[index].onExcretion(pred, prey, flags)
		elseIf eventType == 7
			handlers[index].onDialog(pred, prey, flags)
		elseIf eventType == 8
			handlers[index].onNewCharacter(pred, prey, flags)
		elseIf eventType == 9
			handlers[index].onCustomEvent(pred, prey, flags, fraction)
		endIf
		index += 1
	endWhile
endFunction

function addPredatorRace(race predRace, idle swallowAnim, armor belly)

	if numModPredators < 128
		modPredators[numModPredators] = predRace
		modPredatorIdles[numModPredators] = swallowAnim
		modPredatorBellies[numModPredators] = belly
		FullnessTypes.addForm(belly as form)
		numModPredators += 1
	else
		debug.messageBox("Error: 128 predator races are already registered! I am genuinely impressed.")
		NameQuest.Debugger("Error: 128 predator races are already registered! I am genuinely impressed.", "DevourmentRegistryScript")
	endIf
endFunction

function UnregisterBlock(actor toUnblock)

	Int index = blockArray.find(toUnblock, 0)
	if index == -1
		return 
	endIf
	while index < 127
		blockArray[index] = blockArray[index + 1]
		index += 1
	endWhile
	blockArray[127] = none
	numBlocks = -1 + numBlocks
endFunction

Actor[] function getPredArray()

	return predArray
endFunction

Actor[] function getPreyArray()

	return preyArray
endFunction

function UnregisterCompletedTummy(Int index)

	Int tempIndex = index
	while tempIndex < 127
		tummyPredArray[tempIndex] = tummyPredArray[tempIndex + 1]
		tummyPreyArray[tempIndex] = tummyPreyArray[tempIndex + 1]
		tummyTimers[tempIndex] = tummyTimers[tempIndex + 1]
		tummyMaximumTimers[tempIndex] = tummyMaximumTimers[tempIndex + 1]
		tempIndex = 1 + tempIndex
	endWhile
	tummyPredArray[127] = none
	tummyPreyArray[127] = none
	tummyTimers[127] = 0
	tummyMaximumTimers[127] = 0
	numTummies = -1 + numTummies
endFunction

function setDeadDigestionTicks(actor pred, Int ticks)

	Int index = 0
	while index < numTummies
		if tummyPredArray[index] == pred
			tummyTimers[index] = ticks
		endIf
		index += 1
	endWhile
endFunction

function DebugDump()

	blockArray = new Actor[128]
	numBlocks = 0
	debug.messageBox("Beginning debug dump with " + numDigestions as String + " active digestions.")
	Int index = 0
	while index < numDigestions
		debug.messageBox(predArray[index] as String + " ate " + preyArray[index] as String + " with flags " + digestionFlags[index] as String + " and will digest them for " + digestionTimers[index] as String + " ticks, dealing " + digestionDamage[index] as String + " damage per tick.")
		index += 1
	endWhile
	index = 0
	while index < numTummies
		debug.messageBox(tummyPredArray[index] as String + " ate " + tummyPreyArray[index] as String + ", killed them, and will digest them for " + tummyTimers[index] as String + " ticks.")
		index += 1
	endWhile
	index = 0
	while index < numVomits
		debug.messageBox(vomitPredArray[index] as String + " is waiting to puke up " + vomitPreyArray[index] as String + " with type " + vomitTypeArray[index] as String + ". Failsafe timer is " + vomitFailsafeTimer as String)
		index += 1
	endWhile
	debug.messageBox("Mod predators...")
	index = 0
	while index < numModPredators
		debug.messageBox("Race " + modPredators[index] as String + " is registered with armor " + modPredatorBellies[index] as String + " and animation " + modPredatorIdles[index] as String)
		index += 1
	endWhile
	debug.messageBox("Event handlers...")
	index = 0
	while index < numHandlers
		debug.messageBox("Event handler " + handlers[index] as String + " is registered.")
		index += 1
	endWhile
endFunction

Int function getDeadDigestionTicks(actor prey)

	Int index = 0
	while index < numTummies
		if tummyPreyArray[index] == prey
			return tummyTimers[index]
		endIf
		index += 1
	endWhile
	return 0
endFunction

Float function getDeadDigestionCompletion(actor prey)

	Int index = 0
	while index < numTummies
		if tummyPreyArray[index] == prey
			return tummyTimers[index] as Float / tummyMaximumTimers[index] as Float
		endIf
		index += 1
	endWhile
	return 0 as Float
endFunction

actor function whoAte(actor prey)

	Int index = 0
	while index < numDigestions
		if preyArray[index] == prey
			return predArray[index]
		endIf
		index += 1
	endWhile
	index = 0
	while index < numTummies
		if tummyPreyArray[index] == prey
			return tummyPredArray[index]
		endIf
		index += 1
	endWhile
	return none
endFunction

Float function getStrugglingDamage(actor pred,actor prey)
	Float strugglingdamage = 10 as Float 
	if game.getplayer().hasPerk(SD80)
		strugglingdamage *= 2
	elseIf game.getplayer().hasPerk(SD60)
		strugglingdamage *= 1.8
	elseIf game.getplayer().hasPerk(SD40)
		strugglingdamage *= 1.6
	elseIf game.getplayer().hasPerk(SD20)
		strugglingdamage *= 1.4
	elseIf game.getplayer().hasPerk(SD00)
		strugglingdamage *= 1.2
	endIf
	return strugglingdamage	 
EndFunction

int function getAcidResistance(actor pred,actor prey)
int acidresistance = 0
if(game.getplayer().hasperk(R00))
	acidresistance = 10
elseif(game.getplayer().hasperk(R20))
	acidresistance = 20
elseif(game.getplayer().hasperk(R40))
	acidresistance = 30
elseif(game.getplayer().hasperk(R60))
	acidresistance = 40
elseif(game.getplayer().hasperk(R80))
	acidresistance = 50
	endif
return acidresistance
EndFunction

Float function getDigestionDamage(actor pred, actor prey)
	Float damage = 0 as Float
	Float PredSkill = 0 as Float
	if pred == game.getPlayer()
		PredSkill = pred.getAV("Variable05") + 15 as Float
	else
		PredSkill = pred.getAV("Variable05") + ((pred.getLevel() as Float * 1.70000) as Int) as Float
		if PredSkill > 100 as Float
			PredSkill = 100 as Float
		endIf
	endIf
	damage = 3.00000 * (0.500000 + PredSkill / 100.000)
	if pred.hasPerk(Acid90)
		damage *= 2.50000
	elseIf pred.hasPerk(Acid60)
		damage *= 2.00000
	elseIf pred.hasPerk(Acid30)
		damage *= 1.50000
	endIf
	if pred != game.getPlayer()
		damage *= 2.50000
	endIf
	damage *= 1 as Float + pred.getAV("Fame") / 100 as Float
	if prey != pred
		damage *= 1 as Float - prey.getAV("FavorsPerDay") / 100 as Float
	endIf
	if damage < 3 as Float
		damage = 3 as Float
	endIf
	damage /= DTime.getvalue()
	return damage
endFunction

Actor[] function getDeadPreyArray()
	return tummyPreyArray
endFunction

Actor[] function getDeadPredArray()
	return tummyPredArray
endFunction

Function scaleNodes(Actor prey,Actor pred, float totalTime, float currentTime, float startTime, float endTime, float BA, float BB, float SA, float SB, float NA, float NB)
	float scaleTime=(currentTime-(totalTime*endTime))/((startTime-endTime)*totalTime)
	float scaleB=scaleTime*(BA-BB)+(BB)
	float scaleS=scaleTime*(SA-SB)+SB
	float scaleN=scaleTime*(NA-NB)+NB
	if((MorphOnly.getvalue() == 1)||(breastvore.getvalue() == 0||pred.getLeveledActorBase().getSex() == 0)&&(cockvore.getvalue() == 0||pred.getLeveledActorBase().getSex() == 1)&&(pred.Wornhaskeyword(morphvore)||(!pred.getwornform(kSlotMask32)&&nakedbody.haskeyword(morphvore))||pred.haskeyword(Creature)))
		netimmerse.setNodeScale(pred as objectreference, nodescale, 0, False)
		NiOverride.SetBodyMorph(pred, morphstring,"memes", scaleB)
	elseif(breastvore.getvalue() == 1&&pred.getLeveledActorBase().getSex() == 1)		
			netimmerse.setNodeScale(pred as objectreference, nodescale, 0, False)
			NiOverride.SetBodyMorph(pred, morphstring,"memes", scaleb) 
			 
	elseif(cockvore.getvalue() == 1&&pred.getLeveledActorBase().getSex() == 0)
			if(scaleb > 1)
			netimmerse.setNodeScale(pred as objectreference, nodescale, scaleb, False)
			else
			netimmerse.setNodeScale(pred as objectreference, nodescale, 1, False)
			endif
			NiOverride.SetBodyMorph(pred, morphstring,"memes", 0)
	Else
			netimmerse.setNodeScale(pred as objectreference, nodescale, scaleb, False)
	endif
NiOverride.UpdateModelWeight(pred)	
EndFunction

Float[] function getDigestionTimeArray()
	return digestionTimers
endFunction

function UnregisterDigestion(Int index, Bool dead)
	if index < 0
		return 
	endIf
	Int tempIndex = index
	while tempIndex < 127
		predArray[tempIndex] = predArray[tempIndex + 1]
		preyArray[tempIndex] = preyArray[tempIndex + 1]
		digestionFlags[tempIndex] = digestionFlags[tempIndex + 1]
		digestionTimers[tempIndex] = digestionTimers[tempIndex + 1]
		digestionDamage[tempIndex] = digestionDamage[tempIndex + 1]
		digestionSurrender[tempIndex] = digestionSurrender[tempIndex + 1]
		tempIndex = 1 + tempIndex
	endWhile
	predArray[127] = none
	preyArray[127] = none
	digestionFlags[127] = 0
	digestionTimers[127] = 0 as Float
	digestionDamage[127] = 0 as Float
	digestionSurrender[127] = False
	numDigestions = -1 + numDigestions
endFunction

function AccelerateDigestion(actor pred, Int ticks)
	Int index = 0
	while index < numDigestions
		if predArray[index] == pred
			Self.Digest(index, ticks)
		endIf
		index += 1
	endWhile
endFunction

function disableEscape(actor prey)
	Int index = 0
	while index < numDigestions
		if preyArray[index] == prey
			digestionTimers[index] = 2147483647 as Float
			return 
		endIf
		index += 1
	endWhile
endFunction

Int function getNumEaten(actor pred, Int flags)
	Int index = 0
	Int numEaten = 0
	while index < numDigestions
		if predArray[index] == pred
			numEaten += 1
		endIf
		index += 1
	endWhile
	while index < numTummies
		if tummyPredArray[index] == pred
			numEaten += 1
		endIf
		index += 1
	endWhile
	return numEaten
endFunction

function ProduceVomit(int index)
	vomitPredArray[0].modav("variable09",-1)
	vomitPredArray[0].modav("variable08",-1)
	vomitPredArray[0].dispelSpell(StayAtPredLocation)
	if ReadyToVomit.getvalue() == 0 as Float
		debug.sendAnimationEvent(vomitPredArray[0] as objectreference, "shoutStart")
		VomitSound.playAndWait(vomitPredArray[0] as objectreference)
		vomitPredArray[0].removeItem(FullnessTypes as form, 99, True, none)
		vomitPredArray[0].modav("variable09",-1)
		debug.sendAnimationEvent(vomitPredArray[0] as objectreference, "shoutStop")
		VomitedPrey = vomitPreyArray[0]
		vomitFailsafeTimer = 0
		ReadyToVomit.setValue(1 as Float)
		if vomitTypeArray[0] == 1
			VomitSpell.Cast(vomitPredArray[0] as objectreference, none)
			Self.SendDevourmentEvent(2, vomitPredArray[0], vomitPreyArray[0], vomitFlagsArray[0], 0 as Float, False)
		elseIf vomitTypeArray[0] == 2
			VomitSpellDead.Cast(vomitPredArray[0] as objectreference, none)
		else
			VomitSpellScent.Cast(vomitPredArray[0] as objectreference, none)
			vomitPredArray[0].restoreAV("Health", 1 as Float)
			vomitPredArray[0].damageAV("Health", 1 as Float)
			vomitPredArray[0].restoreAV("Health", 1 as Float)
			Self.SendDevourmentEvent(2, vomitPredArray[0], vomitPreyArray[0], vomitFlagsArray[0], 0 as Float, False)
		endIf
	elseIf vomitFailsafeTimer > 90
		UnclogMessage.show()
 
		VomitedPrey = vomitPreyArray[0]
		vomitFailsafeTimer = 0
		vomitPredArray[0].removeItem(FullnessTypes as form, 99, True, none)
		vomitedprey.moveto(vomitPredArray[0])
		
		game.getPlayer().placeAtMe(VomitActivator as form, 1, False, False)
		Self.SendDevourmentEvent(2, vomitPredArray[0], vomitPreyArray[0], vomitFlagsArray[0], 0 as Float, False)
	else
		vomitFailsafeTimer += 1
	endIf
endFunction

function Digest(Int index, Int times)

	actor pred = predArray[index]
	actor prey = preyArray[index]
	if(noescape.getvalue() == 1)
	disableescape(prey)
	endif

 
	if(prey == Game.GetPlayer()&&struggletoggle.getvalue() == 1&&digestionFlags[index] > 0)
	struggle(prey,pred)
	endif	
if(prey == Game.GetPlayer()&&strip.getvalue() == 1)
pred.additem(prey.getwornform(0x00000001))
pred.additem(prey.getwornform(0x00000002))
pred.additem(prey.getwornform(0x00000004))
pred.additem(prey.getwornform(0x00000008))
pred.additem(prey.getwornform(0x00000010))
pred.additem(prey.getwornform(0x00000080))
pred.additem(prey.getwornform(0x00000200))
pred.additem(prey.getwornform(0x00004000))
pred.additem(prey.getwornform(0x00008000))
pred.additem(prey.getwornform(0x00010000)) 
pred.additem(prey.getwornform(0x00020000))				 
prey.removeitem(prey.getwornform(0x00000001))
prey.removeitem(prey.getwornform(0x00000002))
prey.removeitem(prey.getwornform(0x00000004))
prey.removeitem(prey.getwornform(0x00000008))
prey.removeitem(prey.getwornform(0x00000010))
prey.removeitem(prey.getwornform(0x00000080))
prey.removeitem(prey.getwornform(0x00000200))	
prey.removeitem(prey.getwornform(0x00004000)) 
prey.removeitem(prey.getwornform(0x00008000))	
prey.removeitem(prey.getwornform(0x00010000)) 
prey.removeitem(prey.getwornform(0x00020000))	
endif			

 
	if(digestionFlags[index] > 0)
	if(!prey.isdead()&&prey.getLeveledActorBase().getSex() == 1&&!pred.isequipped(FullnessTypes))
		;; pred.addItem(FullnessFPrey as form, 1, True)
		;; pred.equipItem(FullnessFPrey as form, True, True)
	endif
	if(!prey.isdead()&&prey.getLeveledActorBase().getSex() == 0&&!pred.isequipped(FullnessTypes))
		;; pred.addItem(FullnessmPrey as form, 1, True)
		;;pred.equipItem(FullnessmPrey as form, True, True)
	endif
	endif
	
	


	if((pred != none&&prey != none)&&(prey.isdead() == False&&pred.wornhaskeyword(morphvore)||(!pred.getwornform(kSlotMask32)&&nakedbody.haskeyword(morphvore)))||!pred.haskeyword(NPC))
		;NiOverride.SetBodyMorph(pred, "vore prey belly","memes", pred.getav("variable10"))		
	;NiOverride.UpdateModelWeight(pred)		
	endif	

	if digestionFlags[index] < 0
		if(pred.GetDistance(prey) > 5000)
			prey.setPosition(pred.getPositionX() + 300 as Float, pred.getPositionY() + 300 as Float, pred.getPositionZ())		
		endif
		if(prey.hasperk(De))
		prey.restoreAV("Health", 5)
		endif 
		if(prey.hasperk(CO))
		 
		if(timer < 0&&counttimer)
			prey.addspell(WellRested)
			counttimer = False
		elseif(counttimer)
			Utility.Wait(1)
			timer -= 1
		 endif
		endif	
	;;	if(Utility.RandomInt(0, 100) > 90)
	;;	switchlethal(prey)
	;;	endif
		if ((pred != none&&prey != none)&&pred.isInFaction(Follower) && prey == game.getPlayer() && pred.getAnimationVariableBool("bInJumpState"))
			prey.PushActorAway(pred, 0 as Float)
		endIf
		if ((pred != none&&prey != none)&&prey == game.getPlayer() && prey.getVoiceRecoveryTime() > 0 as Float)
			prey.unequipShout(VomitMeShout)
			prey.removeShout(VomitMeShout)
			Self.registerVomit(prey, 1)
			pred.setPlayerControls(False)
			pred.enableAI(True)
		endIf
		return 
	endIf
	if pred.IsDead()
		Self.registerVomit(prey, 1)

		return 
	elseIf prey.getitemcount(Ipecac as form) > 0
		prey.removeItem(Ipecac as form, 1, False, none)
		Self.registerVomit(prey, 1)
		return 
	endIf
	Int realtimes = 0
	if times as Float <= digestionTimers[index]
		realtimes = times
		digestionTimers[index] = digestionTimers[index] - times as Float
	else
		realtimes = digestionTimers[index] as Int
		digestionTimers[index] = 0 as Float
	endIf
	
	prey.damageAV("Health", (digestionDamage[index] - ((0.01*getAcidResistance(pred,prey))*digestionDamage[index])) * realtimes as Float)
	if !pred.hasPerk(Nourish)
		pred.restoreAV("Health", digestionDamage[index] * realtimes as Float)
		pred.restoreAV("Stamina", digestionDamage[index] * realtimes as Float)
	else
		pred.restoreAV("Health", digestionDamage[index] * 2 as Float * realtimes as Float)
		pred.restoreAV("Stamina", digestionDamage[index] * 2 as Float * realtimes as Float)
	endIf
	if pred.hasPerk(NourishMagic)
		pred.restoreAV("Magicka", digestionDamage[index] * realtimes as Float)
	endIf
	
	Self.SendDevourmentEvent(3, pred, prey, digestionFlags[index], realtimes as Float, False)
	if ((pred != none&&prey != none)&&(prey.IsDead() || prey.getAV("Health") < 0 as Float || prey == game.getPlayer() && prey.getAVPercentage("Health") < 0.0500000))
		if prey.isEssential() && KillEssential.getvalue() == 0 as Float
			Self.registerVomit(prey, 1)
			
			
			return 
		endIf
		Self.FinishDigestion(index)
		return 
	endIf
	if digestionTimers[index] <= 0 as Float && !digestionSurrender[index]
		Self.registerVomit(prey, 1)
		
		if ((pred != none&&prey != none)&&prey.IsDead())
			if prey.getRace() == _Dragon
				pred.modAV("dragonsouls", 1 as Float)
			endIf			
			
	if(prey.isdead())		
	sound.StopInstance(instanceFM)
	sound.StopInstance(instanceMF)
	sound.StopInstance(instanceMM)
	Sound.StopInstance(instanceFF)
	Sound.StopInstance(cfinstance)
	Sound.StopInstance(cminstance)
	endif
		endIf
		return 
	endIf

endFunction

Actor[] function whoSheAte(actor pred, Int flags)

	Int index = 0
	Int newIndex = 0
	Actor[] who = new Actor[128]
	while index < numDigestions
		if predArray[index] == pred
			who[newIndex] = preyArray[index]
			newIndex += 1
		endIf
		index += 1
	endWhile
	index = 0
	while index < numTummies
		if tummyPredArray[index] == pred
			who[newIndex] = tummyPreyArray[index]
			newIndex += 1
		endIf
		index += 1
	endWhile
	return who
endFunction

idle function getModPredatorIdle(race predRace)

	Int index = modPredators.find(predRace, 0)
	if index > -1
		return modPredatorIdles[index]
	endIf
	return none
endFunction

Int[] function getTypeFlagArray()

	return digestionFlags
endFunction

function ForceEscape(actor prey, Bool oralEscape)
 if preyArray.find(prey, 0) > -1
		Self.registerVomit(prey, 1)
	endIf
endFunction

; Skipped compiler generated GetState

function ForceSwallow(actor pred, actor prey, Int flags)

	if flags > 0
		ScriptedSwallow.Cast(pred as objectreference, prey as objectreference)
	else
		ScriptedEndo.Cast(pred as objectreference, prey as objectreference)
	endIf
endFunction

function RegisterDeadVomit(actor pred, actor prey)

	Int index = tummyPreyArray.find(prey, 0)
	vomitPredArray[numVomits] = pred
	vomitPreyArray[numVomits] = prey
	vomitTypeArray[numVomits] = 2
	vomitFlagsArray[numVomits] = tummyFlags[index]
	numVomits += 1
	vomitFailsafeTimer = 0
	Self.RemoveGhost(prey)
endFunction

function RegisterBlock(actor toBlock)

	blockArray[numBlocks] = toBlock
	numBlocks += 1
endFunction

Bool function IsBlocked(actor person)

	return blockArray.find(person, 0) != -1
endFunction

function OnKeyDown(Int KeyCode)

	if !activatedDialog
		activatedDialog = True
		Int index = preyArray.find(game.getPlayer(), 0)
		if index > -1
			playerPrey = True
			Self.DoDialog(predArray[index], preyArray[index], digestionFlags[index])
		else
			index = predArray.find(game.getPlayer(), 0)
			if index > -1
				playerPrey = False
				Self.DoDialog(predArray[index], preyArray[index], digestionFlags[index])
			else
				activatedDialog = False
			endIf
		endIf
	endIf
endFunction

function ShrinkTummy(Int index, Int times)
	 
	actor prey = tummyPreyArray[index]
	actor pred = tummyPredArray[index]
	if tummyTimers[index] > 0 && !pred.IsDead()
		 digestionMultiplier = 1
		if tummyPredArray[index].getCombatState() > 0 || tummyPredArray[index].hasSpell(ScalingCancelSpell as form)
			digestionMultiplier = 100
		endIf
		if(isburping)
			digestionMultiplier = 200
		endif
		if digestionMultiplier * times <= tummyTimers[index]
			tummyTimers[index] = tummyTimers[index] - digestionMultiplier * times
		else
			tummyTimers[index] = 0
		endIf
		;;	if(numDigestions <= 0)
			scaleNodes(prey,pred,tummyMaximumTimers[numTummies - 1],tummyTimers[numTummies - 1],1,0,pred.getav("variable10"),B1,pred.getav("variable10"),S1,pred.getav("variable10"),N1)
			;;	EndIf
	
		

		
		
		if !pred.hasPerk(Nourish)
			pred.restoreAV("Health", (2 * times) as Float)
			pred.restoreAV("Stamina", (2 * times) as Float)
		else
			pred.restoreAV("Health", (4 * times) as Float)
			pred.restoreAV("Stamina", (4 * times) as Float)
		endIf
		if pred.hasPerk(NourishMagic)
			pred.restoreAV("Magicka", (2 * times) as Float)
		endIf
		if prey == game.getPlayer()
			playerDigestionReminder += 1
			if playerDigestionReminder > 9
				playerDigestionReminder = 0
				PlayerDigestMessage.show()
			endIf
			if input.IsKeyPressed(44)
				Self.ExpelRemains(index)
			endIf
		endIf
		Self.SendDevourmentEvent(5, pred, prey, tummyFlags[index], tummyTimers[index] as Float / tummyMaximumTimers[index] as Float, False)
	elseIf pred.IsDead() || ScatGlobal.getvalue() == 0 as Float || !(pred.isPlayerTeammate() && pred.getParentCell().getFactionOwner() == PlayerFaction)
		Self.ExpelRemains(index)
	endIf
endFunction



function OnUpdate()
	Int index = 0
	Int times = ((utility.getCurrentGameTime() - lastTimeProcessed) / TimeScale.getvalue() * 865000 as Float) as Int
	if times <= 0
		times = 1
	endIf
	while index < numDigestions
		Self.Digest(index, times)
		index += 1
	endWhile
	index = 0
	while index < numTummies
		Self.ShrinkTummy(index, times)
		index += 1
	endWhile
	if numVomits > 0
		Self.ProduceVomit(index)
	endIf

	
	lastTimeProcessed = utility.getCurrentGameTime()
	Self.RegisterForSingleUpdate(0.0100)
endFunction

Function AnimatedStruggle(int index)
	actor pred = predArray[index]
	float rng 
	float oldrng
	int i
	randomanim = Utility.RandomInt(0, 4)
	if(randomanim == 0)
		headmod = Utility.RandomInt(15, 20)
		rng = Utility.RandomFloat(0, 0.025) 
		oldrng = rng
		i = 0
		while(i < headmod)
			headanim += rng
			;rng /= 1.05		
			netimmerse.setNodeScale(pred as objectreference, "StruggleHead", headanim, False)
		i += 1
		EndWhile	
		 i = 0
		 rng = oldrng
		 while(i < headmod)
			 headanim += rng*-1	
			;rng /= 1.05	
			netimmerse.setNodeScale(pred as objectreference, "StruggleHead", headanim, False)
		i += 1
		EndWhile	
	ElseIf(randomanim == 1)
	
		LArmanim = 1
		headmod = Utility.RandomInt(15, 40)
		rng = Utility.RandomFloat(0, 0.025) 
		oldrng = rng
		i = 0
		while(i < headmod)
			LArmanim += rng	 
			netimmerse.setNodeScale(pred as objectreference, "StruggleRArm", LArmanim, False)
		i += 1
		EndWhile	
		 i = 0
		 rng = oldrng
		 while(i < headmod)
			 LArmanim += rng*-1				
			netimmerse.setNodeScale(pred as objectreference, "StruggleRArm", LArmanim, False)
		i += 1
		EndWhile	
ElseIf(randomanim == 2)
	
		RArmanim = 1
		headmod = Utility.RandomInt(15, 40)
		rng = Utility.RandomFloat(0, 0.025) 
		oldrng = rng
		i = 0
		while(i < headmod)
			RArmanim += rng
			; rng /= 1.05		
			netimmerse.setNodeScale(pred as objectreference, "StruggleLArm", RArmanim, False)
		i += 1
		EndWhile	
	
		 i = 0
		 rng = oldrng
		 while(i < headmod)
			 RArmanim += rng*-1	
			;rng /= 1.05	
			netimmerse.setNodeScale(pred as objectreference, "StruggleLArm", RArmanim, False)
		i += 1
		EndWhile	
ElseIf(randomanim == 3)
	
	
		LLeganim = 1
		headmod = Utility.RandomInt(15, 40)
		rng = Utility.RandomFloat(0, 0.025) 
		oldrng = rng
		i = 0
		while(i < headmod)
			LLeganim += rng*-1
			; rng /= 1.05		
			netimmerse.setNodeScale(pred as objectreference, "StruggleLLeg", LLeganim, False)
		i += 1
		EndWhile	
	
		 i = 0
		 rng = oldrng
		 while(i < headmod)
			 LLeganim+= rng	
			;rng /= 1.05	
			netimmerse.setNodeScale(pred as objectreference, "StruggleLLeg", LLeganim, False)
		i += 1
		EndWhile 
ElseIf(randomanim == 4)
	
		RLeganim = 1
		headmod = Utility.RandomInt(15, 40)
		rng = Utility.RandomFloat(0, 0.025) 
		oldrng = rng
		i = 0
		while(i < headmod)
			RLeganim += rng*-1
			; rng /= 1.05		
			netimmerse.setNodeScale(pred as objectreference, "StruggleRLeg", RLeganim, False)
		i += 1
		EndWhile	
	
		 i = 0
		 rng = oldrng
		 while(i < headmod)
			 RLeganim += rng
			;rng /= 1.05	
			netimmerse.setNodeScale(pred as objectreference, "StruggleRLeg", RLeganim, False)
		i += 1
		EndWhile 
	
endif
EndFunction

function ForceRegurgitate(actor pred, Bool oralEscape)

	if predArray.find(pred, 0) > -1
		Int index = 0
		while index < numDigestions
			if predArray[index] == pred
				Self.registerVomit(preyArray[index], 1)
				
			endIf
			index += 1
		endWhile
	endIf
endFunction

Bool function ForceDialog(actor pred, actor prey)

	Int index = 0
	Bool done = False
	while index < numDigestions
		if preyArray[index] == game.getPlayer() && predArray[index] == pred
			Self.DoDialog(predArray[index], game.getPlayer(), digestionFlags[index])
			
			done = True
		endIf
		index += 1
	endWhile
	if !done
		index = 0
		while index < numDigestions
			if predArray[index] == game.getPlayer() && preyArray[index] == prey
				Self.DoDialog(game.getPlayer(), preyArray[index], digestionFlags[index])
				
				done = True
			endIf
			index += 1
		endWhile
	endIf
	return done
endFunction

function RegisterEventHandler(devourmenteventhandler yourMod)

	if numHandlers < 128
		handlers[numHandlers] = yourMod
		numHandlers += 1
	else
		debug.messageBox("Error: 128 event handlers are already registered! I am genuinely impressed.")
	endIf
endFunction

function FinishDigestion(Int index)

	actor pred = predArray[index]
	actor prey = preyArray[index]
	Bool isAlt = False
	Bool isArg = False
	Bool isBos = False
	Bool isBre = False
	Bool isDun = False
	Bool isImp = False
	Bool isKha = False
	Bool isNor = False
	Bool isOrs = False
	Bool isRed = False
	
	if pred == game.getPlayer()		
		if pred.getRace() == Alt || pred.getRace() == AltV
			isAlt = True
		elseIf pred.getRace() == Arg || pred.getRace() == ArgV
			isArg = True
		elseIf pred.getRace() == Bos || pred.getRace() == BosV
			isBos = True
		elseIf pred.getRace() == Bre || pred.getRace() == BreV
			isBre = True
		elseIf pred.getRace() == Dun || pred.getRace() == DunV
			isDun = True
		elseIf pred.getRace() == Imp || pred.getRace() == ImpV
			isImp = True
		elseIf pred.getRace() == Kha || pred.getRace() == KhaV
			isKha = True
		elseIf pred.getRace() == Nor || pred.getRace() == NorV
			isNor = True
		elseIf pred.getRace() == Ors || pred.getRace() == OrsV
			isOrs = True
		elseIf pred.getRace() == Red || pred.getRace() == RedV
			isRed = True
		endIf; =================================================== Schaken: make this use arrays and start while ===========
		if prey.getRace() == Alt || prey.getRace() == AltV
			EatAltmer.setValue(EatAltmer.getvalue() + 1 as Float)
			buffaltmer.cast(pred,pred)
			if EatAltmer.getvalue() == 1 as Float
				pred.addSpell(Alt1, True)
			elseIf EatAltmer.getvalue() == 2 as Float
				pred.addSpell(Alt2, True)
				pred.removeSpell(Alt1)
			elseIf EatAltmer.getvalue() == 4 as Float
				pred.addSpell(Alt4, True)
				pred.removeSpell(Alt2)
			elseIf EatAltmer.getvalue() == 8 as Float
				pred.addSpell(Alt8, True)
				pred.removeSpell(Alt4)
			elseIf EatAltmer.getvalue() == 16 as Float
				pred.addSpell(Alt16, True)
				pred.removeSpell(Alt8)
			elseIf EatAltmer.getvalue() == 32 as Float
				if isAlt
					pred.addSpell(SameRace32, True)
				else
					pred.addSpell(AltPower, True)
				endIf
			endIf
		elseIf prey.getRace() == Arg || prey.getRace() == ArgV
			EatArgonian.setValue(EatArgonian.getvalue() + 1 as Float)
			buffargonian.cast(pred,pred)
			if EatArgonian.getvalue() == 1 as Float
				pred.addSpell(Arg1, True)
			elseIf EatArgonian.getvalue() == 2 as Float
				pred.addSpell(Arg2, True)
				pred.removeSpell(Arg1)
			elseIf EatArgonian.getvalue() == 4 as Float
				pred.addSpell(Arg4, True)
				pred.removeSpell(Arg2)
			elseIf EatArgonian.getvalue() == 8 as Float
				pred.addSpell(Arg8, True)
				pred.removeSpell(Arg4)
			elseIf EatArgonian.getvalue() == 16 as Float
				pred.addSpell(Arg16, True)
				pred.removeSpell(Arg8)
			elseIf EatArgonian.getvalue() == 32 as Float
				if isArg
					pred.addSpell(SameRace32, True)
				else
					pred.addSpell(ArgPower, True)
				endIf
			endIf
		elseIf prey.getRace() == Bos || prey.getRace() == BosV
			EatBosmer.setValue(EatBosmer.getvalue() + 1 as Float)
			buffbosmer.cast(pred,pred)
			if EatBosmer.getvalue() == 1 as Float
				pred.addSpell(Bos1, True)
			elseIf EatBosmer.getvalue() == 2 as Float
				pred.addSpell(Bos2, True)
				pred.removeSpell(Bos1)
			elseIf EatBosmer.getvalue() == 4 as Float
				pred.addSpell(Bos4, True)
				pred.removeSpell(Bos2)
			elseIf EatBosmer.getvalue() == 8 as Float
				pred.addSpell(Bos8, True)
				pred.removeSpell(Bos4)
			elseIf EatBosmer.getvalue() == 16 as Float
				pred.addSpell(Bos16, True)
				pred.removeSpell(Bos8)
			elseIf EatBosmer.getvalue() == 32 as Float
				if isBos
					pred.addSpell(SameRace32, True)
				else
					pred.addSpell(BosPower, True)
				endIf
			endIf
		elseIf prey.getRace() == Bre || prey.getRace() == BreV
			EatBreton.setValue(EatBreton.getvalue() + 1 as Float)
			buffbreton.cast(pred,pred)
			if EatBreton.getvalue() == 1 as Float
				pred.addSpell(Bre1, True)
			elseIf EatBreton.getvalue() == 2 as Float
				pred.addSpell(Bre2, True)
				pred.removeSpell(Bre1)
			elseIf EatBreton.getvalue() == 4 as Float
				pred.addSpell(Bre4, True)
				pred.removeSpell(Bre2)
			elseIf EatBreton.getvalue() == 8 as Float
				pred.addSpell(Bre8, True)
				pred.removeSpell(Bre4)
			elseIf EatBreton.getvalue() == 16 as Float
				pred.addSpell(Bre16, True)
				pred.removeSpell(Bre8)
			elseIf EatBreton.getvalue() == 32 as Float
				if isBre
					pred.addSpell(SameRace32, True)
				else
					pred.addSpell(BrePower, True)
				endIf
			endIf
		elseIf prey.getRace() == Dun || prey.getRace() == DunV
			EatDunmer.setValue(EatDunmer.getvalue() + 1 as Float)
			buffdunmer.cast(pred,pred)
			if EatDunmer.getvalue() == 1 as Float
				pred.addSpell(Dun1, True)
			elseIf EatDunmer.getvalue() == 2 as Float
				pred.addSpell(Dun2, True)
				pred.removeSpell(Dun1)
			elseIf EatDunmer.getvalue() == 4 as Float
				pred.addSpell(Dun4, True)
				pred.removeSpell(Dun2)
			elseIf EatDunmer.getvalue() == 8 as Float
				pred.addSpell(Dun8, True)
				pred.removeSpell(Dun4)
			elseIf EatDunmer.getvalue() == 16 as Float
				pred.addSpell(Dun16, True)
				pred.removeSpell(Dun8)
			elseIf EatDunmer.getvalue() == 32 as Float
				if isDun
					pred.addSpell(SameRace32, True)
				else
					pred.addSpell(DunPower, True)
				endIf
			endIf
		elseIf prey.getRace() == Imp || prey.getRace() == ImpV
			EatImperial.setValue(EatImperial.getvalue() + 1 as Float)
			buffimperial.cast(pred,pred)
			if EatImperial.getvalue() == 1 as Float
				pred.addSpell(Imp1, True)
			elseIf EatImperial.getvalue() == 2 as Float
				pred.addSpell(Imp2, True)
				pred.removeSpell(Imp1)
			elseIf EatImperial.getvalue() == 4 as Float
				pred.addSpell(Imp4, True)
				pred.removeSpell(Imp2)
			elseIf EatImperial.getvalue() == 8 as Float
				pred.addSpell(Imp8, True)
				pred.removeSpell(Imp4)
			elseIf EatImperial.getvalue() == 16 as Float
				pred.addSpell(Imp16, True)
				pred.removeSpell(Imp8)
			elseIf EatImperial.getvalue() == 32 as Float
				if isImp
					pred.addSpell(SameRace32, True)
				else
					pred.addSpell(ImpPower, True)
				endIf
			endIf
		elseIf prey.getRace() == Kha || prey.getRace() == KhaV
			EatKhajiit.setValue(EatKhajiit.getvalue() + 1 as Float)
			buffkhajiit.cast(pred,pred)
			if EatKhajiit.getvalue() == 1 as Float
				pred.addSpell(Kha1, True)
			elseIf EatKhajiit.getvalue() == 2 as Float
				pred.addSpell(Kha2, True)
				pred.removeSpell(Kha1)
			elseIf EatKhajiit.getvalue() == 4 as Float
				pred.addSpell(Kha4, True)
				pred.removeSpell(Kha2)
			elseIf EatKhajiit.getvalue() == 8 as Float
				pred.addSpell(Kha8, True)
				pred.removeSpell(Kha4)
			elseIf EatKhajiit.getvalue() == 16 as Float
				pred.addSpell(Kha16, True)
				pred.removeSpell(Kha8)
			elseIf EatKhajiit.getvalue() == 32 as Float
				if isKha
					pred.addSpell(SameRace32, True)
				else
					pred.addSpell(KhaPower, True)
				endIf
			endIf
		elseIf prey.getRace() == Nor || prey.getRace() == NorV
			EatNord.setValue(EatNord.getvalue() + 1 as Float)
			buffnord.cast(pred,pred)
			if EatNord.getvalue() == 1 as Float
				pred.addSpell(Nor1, True)
			elseIf EatNord.getvalue() == 2 as Float
				pred.addSpell(Nor2, True)
				pred.removeSpell(Nor1)
			elseIf EatNord.getvalue() == 4 as Float
				pred.addSpell(Nor4, True)
				pred.removeSpell(Nor2)
			elseIf EatNord.getvalue() == 8 as Float
				pred.addSpell(Nor8, True)
				pred.removeSpell(Nor4)
			elseIf EatNord.getvalue() == 16 as Float
				pred.addSpell(Nor16, True)
				pred.removeSpell(Nor8)
			elseIf EatNord.getvalue() == 32 as Float
				if isNor
					pred.addSpell(SameRace32, True)
				else
					pred.addSpell(NorPower, True)
				endIf
			endIf
		elseIf prey.getRace() == Ors || prey.getRace() == OrsV
			EatOrsimer.setValue(EatOrsimer.getvalue() + 1 as Float)
			bufforsimer.cast(pred,pred)
			if EatOrsimer.getvalue() == 1 as Float
				pred.addSpell(Ors1, True)
			elseIf EatOrsimer.getvalue() == 2 as Float
				pred.addSpell(Ors2, True)
				pred.removeSpell(Ors1)
			elseIf EatOrsimer.getvalue() == 4 as Float
				pred.addSpell(Ors4, True)
				pred.removeSpell(Ors2)
			elseIf EatOrsimer.getvalue() == 8 as Float
				pred.addSpell(Ors8, True)
				pred.removeSpell(Ors4)
			elseIf EatOrsimer.getvalue() == 16 as Float
				pred.addSpell(Ors16, True)
				pred.removeSpell(Ors8)
			elseIf EatOrsimer.getvalue() == 32 as Float
				if isOrs
					pred.addSpell(SameRace32, True)
				else
					pred.addSpell(OrsPower, True)
				endIf
			endIf
		elseIf prey.getRace() == Red || prey.getRace() == RedV
			EatRedguard.setValue(EatRedguard.getvalue() + 1 as Float)
			buffredguard.cast(pred,pred)
			if EatRedguard.getvalue() == 1 as Float
				pred.addSpell(Red1, True)
			elseIf EatRedguard.getvalue() == 2 as Float
				pred.addSpell(Red2, True)
				pred.removeSpell(Red1)
			elseIf EatRedguard.getvalue() == 4 as Float
				pred.addSpell(Red4, True)
				pred.removeSpell(Red2)
			elseIf EatRedguard.getvalue() == 8 as Float
				pred.addSpell(Red8, True)
				pred.removeSpell(Red4)
			elseIf EatRedguard.getvalue() == 16 as Float
				pred.addSpell(Red16, True)
				pred.removeSpell(Red8)
			elseIf EatRedguard.getvalue() == 32 as Float
				if isRed
					pred.addSpell(SameRace32, True)
				else
					pred.addSpell(RedPower, True)
				endIf
			endIf
		elseIf prey.getRace() == _Troll || prey.getRace() == _TrollFrost
			_TrollEaten.setValue(_TrollEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Dragon
			_DragonEaten.setValue(_DragonEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Horse
			_HorseEaten.setValue(_HorseEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Draugr || prey.getRace() == _DraugrMagic
			_DraugrEaten.setValue(_DraugrEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Falmer
			_FalmerEaten.setValue(_FalmerEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Fox
			_FoxEaten.setValue(_FoxEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Fish
			_FishEaten.setValue(_FishEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _BearBrown || prey.getRace() == _BearBlack || prey.getRace() == _BearSnow
			_BearEaten.setValue(_BearEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Mudcrab
			_MudcrabEaten.setValue(_MudcrabEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Spider || prey.getRace() == _SpiderLarge || prey.getRace() == _SpiderGiant
			_SpiderEaten.setValue(_SpiderEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Chicken
			_ChickenEaten.setValue(_ChickenEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Dog
			_DogEaten.setValue(_DogEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Deer || prey.getRace() == _Elk
			_DeerEaten.setValue(_DeerEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Goat || prey.getRace() == _GoatDomestic
			_GoatEaten.setValue(_GoatEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Cow
			_CowEaten.setValue(_CowEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Chaurus || prey.getRace() == _ChaurusReaper
			_ChaurusEaten.setValue(_ChaurusEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Giant
			_GiantEaten.setValue(_GiantEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _DwarvenSpider || prey.getRace() == _DwarvenSphere || prey.getRace() == _DwarvenCenturion
			_DwarvenMachineEaten.setValue(_DwarvenMachineEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Hagraven
			_HagravenEaten.setValue(_HagravenEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Mammoth
			_MammothEaten.setValue(_MammothEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Sabrecat || prey.getRace() == _SabrecatSnow
			_SabrecatEaten.setValue(_SabrecatEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Werewolf
			_WerewolfEaten.setValue(_WerewolfEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Wolf
			_WolfEaten.setValue(_WolfEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _DragonPriest
			_DragonPriestEaten.setValue(_DragonPriestEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Dremora
			_DremoraEaten.setValue(_DremoraEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Hare
			_HareEaten.setValue(_HareEaten.getvalue() + 1 as Float)
		elseIf prey.getRace() == _Horker
			_HorkerEaten.setValue(_HorkerEaten.getvalue() + 1 as Float)
		endIf
		if prey.hasKeyword(_Vampire)
			_VampireEaten.setValue(_VampireEaten.getvalue() + 1 as Float)
		endIf
		if prey.getLeveledActorBase().getSex() == 0 && prey.hasKeyword(NPC)&&!prey.haskeyword(creature)
			_MenEaten.setValue(_MenEaten.getvalue() + 1 as Float)
		endIf
		if prey.getLeveledActorBase().getSex() == 1 && prey.hasKeyword(NPC)&&!prey.haskeyword(creature)
			_WomenEaten.setValue(_WomenEaten.getvalue() + 1 as Float)
		endIf ; =================================================Schaken: make this ENDWHILE ========================
	else
		pred.modAV("FavorsPerDayTimer", 1 as Float)
	endIf
	Bool mage = False
	Bool warrior = False
	Bool thief = False
	if SkillGain.getvalue() == 4 as Float
		mage = True
		warrior = True
		thief = True
	elseIf SkillGain.getvalue() == 3 as Float
		thief = True
	elseIf SkillGain.getvalue() == 2 as Float
		warrior = True
	elseIf SkillGain.getvalue() == 1 as Float
		mage = True
	endIf
	String highest = ""
	Float highestVal = 0 as Float
	if mage
		if prey.getAV("Illusion") > highestVal && prey.getAV("Illusion") > pred.getAV("Illusion")
			highest = "Illusion"
			highestVal = prey.getAV("Illusion")
		endIf
		if prey.getAV("Conjuration") > highestVal && prey.getAV("Conjuration") > pred.getAV("Conjuration")
			highest = "Conjuration"
			highestVal = prey.getAV("Conjuration")
		endIf
		if prey.getAV("Restoration") > highestVal && prey.getAV("Restoration") > pred.getAV("Restoration")
			highest = "Restoration"
			highestVal = prey.getAV("Restoration")
		endIf
		if prey.getAV("Destruction") > highestVal && prey.getAV("Destruction") > pred.getAV("Destruction")
			highest = "Destruction"
			highestVal = prey.getAV("Destruction")
		endIf
		if prey.getAV("Alteration") > highestVal && prey.getAV("Alteration") > pred.getAV("Alteration")
			highest = "Alteration"
			highestVal = prey.getAV("Alteration")
		endIf
		if prey.getAV("Enchanting") > highestVal && prey.getAV("Enchanting") > pred.getAV("Enchanting")
			highest = "Enchanting"
			highestVal = prey.getAV("Enchanting")
		endIf
	endIf
	if warrior
		if prey.getAV("Smithing") > highestVal && prey.getAV("Smithing") > pred.getAV("Smithing")
			highest = "Smithing"
			highestVal = prey.getAV("Smithing")
		endIf
		if prey.getAV("OneHanded") > highestVal && prey.getAV("OneHanded") > pred.getAV("OneHanded")
			highest = "OneHanded"
			highestVal = prey.getAV("OneHanded")
		endIf
		if prey.getAV("TwoHanded") > highestVal && prey.getAV("TwoHanded") > pred.getAV("TwoHanded")
			highest = "TwoHanded"
			highestVal = prey.getAV("TwoHanded")
		endIf
		if prey.getAV("Marksman") > highestVal && prey.getAV("Marksman") > pred.getAV("Marksman")
			highest = "Marksman"
			highestVal = prey.getAV("Marksman")
		endIf
		if prey.getAV("Block") > highestVal && prey.getAV("Block") > pred.getAV("Block")
			highest = "Block"
			highestVal = prey.getAV("Block")
		endIf
		if prey.getAV("HeavyArmor") > highestVal && prey.getAV("HeavyArmor") > pred.getAV("HeavyArmor")
			highest = "HeavyArmor"
			highestVal = prey.getAV("HeavyArmor")
		endIf
	endIf
	if thief
		if prey.getAV("LightArmor") > highestVal && prey.getAV("LightArmor") > pred.getAV("LightArmor")
			highest = "LightArmor"
			highestVal = prey.getAV("LightArmor")
		endIf
		if prey.getAV("Pickpocket") > highestVal && prey.getAV("Pickpocket") > pred.getAV("Pickpocket")
			highest = "Pickpocket"
			highestVal = prey.getAV("Pickpocket")
		endIf
		if prey.getAV("Lockpicking") > highestVal && prey.getAV("Lockpicking") > pred.getAV("Lockpicking")
			highest = "Lockpicking"
			highestVal = prey.getAV("Lockpicking")
		endIf
		if prey.getAV("Sneak") > highestVal && prey.getAV("Sneak") > pred.getAV("Sneak")
			highest = "Sneak"
			highestVal = prey.getAV("Sneak")
		endIf
		if prey.getAV("Alchemy") > highestVal && prey.getAV("Alchemy") > pred.getAV("Alchemy")
			highest = "Alchemy"
			highestVal = prey.getAV("Alchemy")
		endIf
		if prey.getAV("Speechcraft") > highestVal && prey.getAV("Speechcraft") > pred.getAV("Speechcraft")
			highest = "Speechcraft"
			highestVal = prey.getAV("Speechcraft")
		endIf
	endIf
	if highestVal != 0 as Float
		if pred == game.getPlayer()
			game.IncrementSkill(highest)
		else
			pred.setAV(highest, pred.getBaseAV(highest) + 1 as Float)
		endIf
	endIf
	if prey.getBaseActorValue("Health") > pred.getBaseActorValue("Health")
		if pred.hasPerk(ConsumeEssence)
			pred.setActorValue("Health", pred.getBaseActorValue("Health") + 2 as Float)
		else
			pred.setActorValue("Health", pred.getBaseActorValue("Health") + 1 as Float)
		endIf
	endIf
	if prey.getBaseActorValue("Stamina") > pred.getBaseActorValue("Stamina")
		if pred.hasPerk(ConsumeEssence)
			pred.setActorValue("Stamina", pred.getBaseActorValue("Stamina") + 2 as Float)
		else
			pred.setActorValue("Stamina", pred.getBaseActorValue("Stamina") + 1 as Float)
		endIf
	endIf
	if prey.getBaseActorValue("Magicka") > pred.getBaseActorValue("Magicka")
		if pred.hasPerk(ConsumeEssence)
			pred.setActorValue("Magicka", pred.getBaseActorValue("Magicka") + 2 as Float)
		else
			pred.setActorValue("Magicka", pred.getBaseActorValue("Magicka") + 1 as Float)
		endIf
	endIf
	
	if pred.hasPerk(SoulFood)&&!wasdead
		if(prey.getlevel() <= 3&&prey.haskeyword(creature))
		pred.addItem(SoulPetty as form, 1, True)
		elseif(prey.getlevel() <= 15&&prey.getlevel() >= 6&&prey.haskeyword(creature))
		pred.addItem(SoulLesser as form, 1, True)
		elseif(prey.getlevel() <= 27&&prey.getlevel() >= 16&&prey.haskeyword(creature))
		pred.addItem(SoulCommon as form, 1, True)
		elseif(prey.getlevel() <= 37&&prey.getlevel() >= 28&&prey.haskeyword(creature))
		pred.addItem(SoulGreater as form, 1, True)
		elseif(prey.getlevel() >= 38&&prey.haskeyword(creature))
		pred.addItem(SoulGrand as form, 1, True)
		elseif(prey.haskeyword(npc)&&!prey.haskeyword(creature))
		pred.addItem(SoulBlack as form, 1, True)
	endif
	
			
		
	endIf
	if pred == game.getPlayer()
		VictimsToPerk.setValue(VictimsToPerk.getvalue() + 1 as Float)
		if VictimsToPerk.getvalue() >= 3 as Float + PrevPerkPoints.getvalue()
			PerkMessage.show()
			VSkillLevelSound.play(pred as objectreference)
			VictimsToPerk.setValue(0 as Float)
			PerkPoints.setValue(PerkPoints.getvalue() + 1 as Float)
			PrevPerkPoints.setValue(PrevPerkPoints.getvalue() + 1 as Float)
		endIf
	endIf
	if prey.IsDead()
		if prey.getRace() == _Dragon
			pred.modAV("dragonsouls", 1 as Float)
		endIf

	endIf
	if prey == game.getPlayer()
		PlayerDigestMessage.show()
		prey.say(Scream, prey, True)
		DeathMusic.add()
		prey.resethealthandlimbs()
	endIf
	burptick = 0


if(pred == Game.GetPlayer()&&pred.haskeyword( _Vampire)&&prey.haskeyword(npc)&&!prey.haskeyword(creature))
PlayerVampireQuest.VampireFeed()
EndIf

pred.modav("variable08",-1)
	
	sound.StopInstance(instanceFM)
	sound.StopInstance(instanceMF)
	sound.StopInstance(instanceMM)
	Sound.StopInstance(instanceFF)
	Sound.StopInstance(cfinstance)
	Sound.StopInstance(cminstance)


	
	Bool protected = False
	prey.enable(0 as Bool)
	if prey.getLeveledActorBase().isProtected()
		protected = True
		prey.getLeveledActorBase().setProtected(False)
	endIf
	if prey != game.getPlayer()
		prey.KillEssential(pred)
	endIf
	if protected
		prey.getLeveledActorBase().setProtected(True)
	endIf
	Int oldweight = pred.getLeveledActorBase().getWeight() as Int
	if oldweight < 100 && WeightGlobal.getValueInt() > 0
		Int weight = oldweight + WeightGlobal.getValueInt()
		if weight > 100
			weight = 100
		endIf
		Float neckdelta = (weight / 100 - oldweight / 100) as Float
		pred.getLeveledActorBase().setWeight(weight as Float)
		pred.updateWeight(neckdelta)
		pred.QueueNiNodeUpdate()
	endIf
	if prey.hasKeyword(Summoned)
		prey.removeAllItems(none, False, False)
	endIf
	pred.removeItem(FullnessTypes as form, 99, True, none)
	pred.equipItem(FullnessDead as form, True, True)
	Burp(pred,prey)
	Self.SendDevourmentEvent(4, pred, prey, digestionFlags[index], 0 as Float, False)
	Self.RegisterShrinkingTummy(index)
endFunction

function registerVomit(actor prey, Int type)

	Int index = preyArray.find(prey, 0)
	actor pred = predArray[index]
	pred.modav("variable09",-1)
	pred.modav("variable08",-1)
	sound.StopInstance(stomach)
	sound.StopInstance(instanceFF)
	sound.StopInstance(instanceFM)
	sound.StopInstance(instanceMF)
	sound.StopInstance(instanceMM)
	Sound.StopInstance(cfinstance)
	Sound.StopInstance(cminstance)
	
	if(prey.hasperk(pg))
	pred.damageAV("Health", 10*getstrugglingdamage(pred,prey))
	endif
	if(facialanim.getvalue() == 1)
				pred.SetExpressionOverride(10, 0)
				mfgconsolefunc.SetPhoneme(pred, 5, 0)
	endif

	if index < 0
		return 
	endIf
	vomitPredArray[numVomits] = predArray[index]
	vomitPreyArray[numVomits] = preyArray[index]
	vomitTypeArray[numVomits] = type
	vomitFlagsArray[numVomits] = digestionFlags[index]
	numVomits += 1
	vomitFailsafeTimer = 0
	Self.RemoveGhost(prey)
	Self.UnregisterDigestion(index, type == 2)
	NiOverride.SetBodyMorph(pred, morphstring,"memes", 0) 
	if(nodescale == "NPC GenitalsScrotum [GenScrot]")
		netimmerse.setNodeScale(pred as objectreference, nodescale, 1, False) 
	endif
		NiOverride.UpdateModelWeight(pred)
		
endFunction

actor function GetVomitPrey()
	return vomitPreyArray[0]
endFunction

Bool function IsHandlerRegistered(devourmenteventhandler yourMod)
	return handlers.find(yourMod, 0) > -1
endFunction

 Function RemoveItemWithKeyword(Keyword desired, ObjectReference source)
	if desired && source
		Form[] itemlist = source.GetContainerForms()
		int i = itemlist.length
		while i > 0
			i -= 1
			if itemlist[i].HasKeyword(desired)
				source.removeitem(itemlist[i])
			endif
		endwhile
	endif
	
EndFunction

function Struggle(actor prey,actor pred)
	while(choosekeyold == choosekey)
		choosekey = Utility.RandomInt(0, 5)
	EndWhile
	
	
	if ((pred != none&&prey != none)&&utility.RandomInt(0, 100) < 5)
		stomach =	StomachSound.play(pred as objectreference)
	endIf
	
	if(choosekey == 0&&showmessage)
	Debug.Notification("Press L and H to struggle!") 
	showmessage = False	
	EndIf
	if(choosekey == 1&&showmessage)
	Debug.Notification("Press E and U to struggle!")
	showmessage = False	 
	endif
	if(choosekey == 2&&showmessage)
	Debug.Notification("Press Y and R to struggle!")
	showmessage = False	 
	endif
	if(choosekey == 3&&showmessage)
	Debug.Notification("Press F and S to struggle!")
	showmessage = False	 
	endif
	if(choosekey == 4&&showmessage)
	Debug.Notification("Press X and V to struggle!")
	showmessage = False	 
	endif
	if(choosekey == 5&&showmessage)
		Debug.Notification("Press A and D to struggle!")
	showmessage = False	 
	endif	
	
	if(Input.IsKeyPressed(38)&&Input.IsKeyPressed(35)&&choosekey == 0)
	strugglebar += 1
	Debug.Notification("You struggle " + strugglebar as string)	 
	pred.damageAV("Health", getstrugglingdamage(pred,prey))
	choosekeyold = choosekey	
	choosekey = Utility.RandomInt(0, 5)
	showmessage = True	 
	
	endif
	
	if(Input.IsKeyPressed(18)&&Input.IsKeyPressed(22)&&choosekey == 1)
	
	strugglebar += 1
	Debug.Notification("You struggle " + strugglebar as string)
			pred.damageAV("Health", getstrugglingdamage(pred,prey))
	Gurgle.play(pred)
	choosekeyold = choosekey	
	choosekey = Utility.RandomInt(0, 5)
	showmessage = True		
	endif
	
	if(Input.IsKeyPressed(21)&&Input.IsKeyPressed(19)&&choosekey == 2)
	
	strugglebar += 1
	Debug.Notification("You struggle " + strugglebar as string)
	pred.damageAV("Health", getstrugglingdamage(pred,prey))	
	Gurgle.play(pred)
	choosekeyold = choosekey	
	choosekey = Utility.RandomInt(0, 5)
	showmessage = True		
	endif
	
	if(Input.IsKeyPressed(31)&&Input.IsKeyPressed(33)&&choosekey == 3)
	
	strugglebar += 1
	Debug.Notification("You struggle " + strugglebar as string)
	pred.damageAV("Health", getstrugglingdamage(pred,prey))
	Gurgle.play(pred)
	choosekeyold = choosekey	
	choosekey = Utility.RandomInt(0, 5)
	showmessage = True		
	endif
	if(Input.IsKeyPressed(45)&&Input.IsKeyPressed(47)&&choosekey == 4)
	
	strugglebar += 1
	Debug.Notification("You struggle " + strugglebar as string)
	pred.damageAV("Health", getstrugglingdamage(pred,prey))	
	Gurgle.play(pred)
	choosekeyold = choosekey	
	choosekey = Utility.RandomInt(0, 5)
	showmessage = True		
	endif
	if(Input.IsKeyPressed(30)&&Input.IsKeyPressed(32)&&choosekey == 5)
	
	strugglebar += 1
	Debug.Notification("You struggle " + strugglebar as string)
	pred.damageAV("Health", getstrugglingdamage(pred,prey))
	Gurgle.play(pred)
	choosekeyold = choosekey	
	choosekey = Utility.RandomInt(0, 5)
	showmessage = True		
	endif
	

	if(strugglebar >= 5*Dtime.getvalue())
	Self.registervomit(prey,1)
	Debug.Notification("You're free!")
	strugglebar = 0
	EndIf

	
EndFunction

Bool Function checksize(actor pred,actor prey)
Race MyRace = prey.getLeveledActorBase().getRace()
 if prey.hasKeyword(NPC)&&!prey.haskeyword(creature)&&!MyRace == _Horse
			pred.setav("variable10",1.1) 
		elseIf (MyRace == _Hare)
			pred.setav("variable10",0.1) 
		elseIf (MyRace == _Wolf)
			pred.setav("variable10",1) 
		elseIf (MyRace == _Dragon)
			pred.setav("variable10",3) 
		elseIf (MyRace == _Falmer)
			pred.setav("variable10",1.1) 
		elseIf (MyRace == _Giant)
			pred.setav("variable10",2) 
		elseIf (MyRace == _Mammoth)
			pred.setav("variable10",3) 
		elseIf (MyRace == _Mudcrab)
			pred.setav("variable10",0.8) 
		elseIf (MyRace == _Horse)
			pred.setav("variable10",3) 
		elseIf (MyRace == _Troll || MyRace == _TrollFrost)
			pred.setav("variable10",2) 
		elseIf (MyRace == _Cow)
			pred.setav("variable10",2.5) 
		elseIf (MyRace == _Hagraven)
			pred.setav("variable10",1) 
		elseIf (MyRace == _DwarvenSpider)
			pred.setav("variable10",0.7) 
		elseIf (MyRace == _DwarvenSphere)
			pred.setav("variable10",1.3) 
		elseIf (MyRace == _DwarvenCenturion)
			pred.setav("variable10",4) 
		elseIf (MyRace == _BearBlack || MyRace == _BearBrown || MyRace == _BearSnow)
			pred.setav("variable10",2.5) 
		elseIf (MyRace == _Sabrecat || MyRace == _SabrecatSnow)
			pred.setav("variable10",2) 
		elseIf (MyRace == _Draugr || MyRace == _DraugrMagic)
			pred.setav("variable10",1.1)
		elseIf (MyRace == _Fox)
			pred.setav("variable10",0.7)
		elseIf (MyRace == _Goat || MyRace == _GoatDomestic)
			pred.setav("variable10",0.85)
		elseIf (MyRace == _Chaurus || MyRace == _ChaurusReaper)
			pred.setav("variable10",1.4)
		elseIf (MyRace == _DragonPriest)
			pred.setav("variable10",1.2)
		elseIf (MyRace == _Werewolf)
			pred.setav("variable10",2)
		elseIf (MyRace == _Horker)
			pred.setav("variable10",3)
		Else
			pred.setav("variable10",1)
		endIf
		pred.setav("variable10", pred.getav("variable10")*(prey.getscale()/pred.getscale()))
		if(pred.getav("variable10") > preysize.getvalue())
			return True
		Else
			return False
		EndIf
EndFunction
 float Function bellysize()
 return scatsize
 EndFunction
Function Burp(actor pred,actor prey) 
	pred.SetExpressionOverride(16, 100)
	if(BurpSound.playAndWait(pred))	
	pred.SetExpressionOverride(16, 0)
	mfgconsolefunc.SetPhoneme(pred, 5, 0)
endif
EndFunction
Function DigestionBurp(actor pred) 
	pred.SetExpressionOverride(16, 100)
	isburping = True
	if(BurpSound.playAndWait(pred))
	 pred.SetExpressionOverride(16, 0)
	 pred.SetExpressionOverride(10, 100)
	 ;Utility.Wait(3.0)
	 isburping = False

	 endif


EndFunction

Bool Function IsForcePredSelected(actor forcepredator)
if(forcepred != none)
	return True

Else
	return False
	forcepred = forcepredator
	
endif

EndFunction
float function preyhealth()
return actingprey.getAVPercentage("Health")
EndFunction

Function SelectForcePred(actor forcepredator)
	forcepred = forcepredator
EndFunction

Bool Function IsForcePreySelected(actor forcedprey)
if(forceprey != none)
	return True
Else
	return False
	forceprey = forcedprey
endif
EndFunction

Function SelectForcePrey(actor forcedprey)
	forceprey = forcedprey
EndFunction

Function CastForcedSwallow()
	ScriptedSwallow.Cast(forcepred, forceprey)
	forcepred = None
	forceprey = None
EndFunction