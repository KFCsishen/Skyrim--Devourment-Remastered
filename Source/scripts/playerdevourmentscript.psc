Scriptname PlayerDevourmentScript extends activemagiceffect  

int PreyHP
actor thePrey
actor thePred
race OriginalRace
int Timer
int Rand
int Level
int Damage

Event OnEffectStart(Actor akTarget, Actor akCaster)
thePred=akTarget
thePrey=akCaster
if(thePred.GetActorBase().GetSex()!=1)
	thePred.KillEssential()
	Dispel()
else
	thePred.addItem(Fullness,1,true)
	thePred.equipItem(Fullness,true,true)
	PreyHP=thePrey.getActorValue("Health") as int
	thePrey.moveTo(HerStomach)
	Level=thePred.getLevel()
	if(Level>50)
		Level=50
	endif
	Damage=Level/DamageDivisor
	if(Damage<5)
		Damage=5
	endif
	RegisterForUpdate(1)
	Timer=0
endif
EndEvent

Event OnUpdate()
if(thePred.GetActorBase().GetSex()!=1)
	thePred.KillEssential()
	Dispel()
else
	Timer=Timer+1
	PreyHP=PreyHP-Damage
	thePred.restoreAV("Health", Damage/2)
	if (PreyHP<=0)
		thePrey.killessential(thePred)
		BurpSound.playAndWait(thePred)
		if(ScatGlobal.getValue()==0)
			thePred.removeItem(Fullness,99,true)
			thePrey.removeAllItems(thePred, false, true)
			dispel()
		else
			PreyAlias.forceRefTo(thePrey)
			thePred.addSpell(PoopSpell,false)
			dispel()
		endif
		thePred.dispelSpell(devourmentSpell)
	elseif (Timer>=MaxTime)
		thePred.dispelSpell(devourmentSpell)
		tempPrey.forceRefTo(thePrey)
		tempPred.forceRefTo(thePred)
		TempHP.setValue(PreyHP)
		pukeGlobal.setValue(2)
		PukeQueue.start()
		PukeQueue.registerForUpdate(0.1)	
		dispel()
	else
		Rand=Utility.RandomInt(0,100)
		if(Rand<20)
			StomachSound.play(thePred)
		endif
	endif
endif
EndEvent

ReferenceAlias Property TempPrey auto
ReferenceAlias Property TempPred auto
GlobalVariable Property PukeGlobal auto
Quest Property PukeQueue auto

Int Property DamagePerSec auto
Message Property DigestMessage auto
GlobalVariable Property ScatGlobal auto
GlobalVariable Property TempHP auto
ReferenceAlias Property PredAlias auto
ReferenceAlias Property PreyAlias auto
SPELL Property DevourmentSpell  Auto  
ObjectReference Property HerStomach Auto
Quest Property ScatQuest auto
Actor Property theDummy auto
Int Property MaxTime auto

Race Property HighElfRace auto
Race Property HighElfRaceV auto
Race Property HighElfRaceFull auto

Race Property WoodElfRace auto
Race Property WoodElfRaceV auto
Race Property WoodElfRaceFull auto

Race Property DarkElfRace auto
Race Property DarkElfRaceV auto
Race Property DarkElfRaceFull auto

Race Property NordRace auto
Race Property NordRaceV auto
Race Property NordRaceFull auto

Race Property ImperialRace auto
Race Property ImperialRaceV auto
Race Property ImperialRaceFull auto

Race Property RedguardRace auto
Race Property RedguardRaceV auto
Race Property RedguardRaceFull auto

Race Property OrcRace auto
Race Property OrcRaceV auto
Race Property OrcRaceFull auto

Race Property BretonRace auto
Race Property BretonRaceV auto
Race Property BretonRaceFull auto

Sound Property BurpSound Auto
Sound Property StomachSound Auto
Sound Property VomitSound Auto
Idle Property VomitIdle  Auto  

Idle Property FallIdle  Auto  

EffectShader Property VomitShader  Auto  

Explosion Property VomitExplosion  Auto  

VisualEffect Property VomitVisual  Auto  

SPELL Property TempParalyze  Auto  

Race Property KhajiitRace  Auto  

Race Property KhajiitRaceFull  Auto  

Race Property KhajiitRaceV  Auto  

Race Property ArgonianRace  Auto  

Race Property ArgonianRaceFull  Auto  

Race Property ArgonianRaceV  Auto  

Int Property DamageDivisor  Auto  

SPELL Property VomitSpell  Auto  

Idle Property NormalIdle  Auto  

Armor Property Fullness  Auto  

SPELL Property PoopSpell  Auto  
