Scriptname PredEndoScript extends activemagiceffect  

float PreyHP
actor thePrey
actor thePred
race OriginalRace
int Timer
int Rand
int Level
float Damage
float MaxTime
bool changedLoc
int PredSex

Event OnEffectStart(Actor akTarget, Actor akCaster)
thePred=akTarget
thePrey=akCaster
predSex=thePred.getLeveledActorBase().getSex()
if(predSex!=1)
	thePred.KillEssential()
	Dispel()
else
	thePred.addItem(Fullness,1,true)
	thePred.equipItem(Fullness,true,true)

	if(thePrey!=Game.GetPlayer())
		thePrey.moveTo(HerStomach)
	else
		thePrey.setPosition(thePred.getPositionX()+2000,thePred.getPositionY()+2000,thePred.getPositionZ())
		; NoPlayerShader.play(thePrey)
		thePrey.setAlpha(0)
		; thePrey.setVehicle(thePred)
		thePrey.setGhost(true)
		Game.DisablePlayerControls(false, false, false, false, false, true, true, false, 0)
		Game.setCameraTarget(thePred)
		if(thePred.isInFaction(follower))
			thePred.setPlayerControls(true)
			thePred.EnableAI(true)			
		endif
		thePrey.setPlayerControls(false)
		thePrey.enableAI(false)
		PukeMessage.show()
		game.unlockWord(VomitWord)
		thePrey.equipShout(VomitMeShout)
		thePrey.equipSpell(DummySpell,1)
		thePrey.equipSpell(DummySpell,0)
		thePrey.unequipSpell(DummySpell,1)
		thePrey.unequipSpell(DummySpell,0)
		thePrey.addSpell(noPlayerSpell,false)
		thePrey.clearExtraArrows()
		thePrey.setVoiceRecoveryTime(0)
	endif
	RegisterForUpdate(1)
endif
EndEvent

Event OnUpdate()
if(predSex!=1)
	thePred.KillEssential()
	Dispel()
else
	Rand=Utility.RandomInt(0,100)
	if(Rand<20)
		StomachSound.play(thePred)
	endif
	if(thePrey==Game.getPlayer())
		; thePrey.moveto(thePred)
		; Debug.MessageBox(thePrey.getVoiceRecoveryTime())
		if(thePrey.getVoiceRecoveryTime()>0)
			thePrey.unequipShout(VomitMeShout)
			thePrey.removeShout(VomitMeShout)
			dispel()
		elseif(!thePred.getCurrentLocation().isSameLocation(thePrey.getCurrentLocation()))
			thePrey.moveto(thePred)
		elseif(thePred.getAnimationVariableBool("bInJumpState"))
			thePrey.PushActorAway(thePred,0)
		endif
	endif
endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
if(changedLoc)
	thePrey.setGhost(false)
	thePrey.setAlpha(100)
	recast.cast(thePrey,thePred)
else
	tempPrey.forceRefTo(thePrey)
	tempPred.forceRefTo(thePred)
	TempHP.setValue(thePrey.getAV("Health"))
	TempDigested.setValue(0)
	pukeGlobal.setValue(2)
	PukeQueue.start()
	PukeQueue.registerForUpdate(0.1)
	if(thePred==Game.getPlayer())
		thePred.addSpell(EndoSpell)
		thePred.removeSpell(VomitSpell)
	elseif(thePred.IsInFaction(follower))	
		thePred.setPlayerControls(false)
		thePred.EnableAI()
	endif
	dispel()
endif
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if(thePrey==Game.getPlayer())
		changedLoc=true
		thePrey.moveTo(thePred)
	endif
EndEvent

Event OnCellAttach()
	if(thePrey==Game.getPlayer())
		changedLoc=true
		thePrey.moveTo(thePred)
	endif
EndEvent

ReferenceAlias Property TempPrey auto
ReferenceAlias Property TempPred auto
GlobalVariable Property PukeGlobal auto
Quest Property PukeQueue auto
GlobalVariable Property TempHP auto
ObjectReference Property HerStomach Auto

Sound Property StomachSound Auto

Armor Property Fullness  Auto  
SPELL Property EndoSpell  Auto  

SPELL Property VomitSpell  Auto  

GlobalVariable Property PukeMeUp Auto
Message Property PukeMessage  Auto  
SPELL Property VomitMeSpell Auto
Idle Property reset  Auto  
Faction Property follower Auto
Spell Property DummySpell Auto
Shout Property VomitMeShout Auto
Spell Property Recast Auto
WordOfPower Property VomitWord Auto
GlobalVariable Property TempDigested Auto
Spell Property NoPlayerSpell Auto