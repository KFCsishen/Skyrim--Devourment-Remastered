Scriptname EndoScript extends activemagiceffect  

Int PreyHP
Actor thePrey
Actor thePred
Race originalRace
Int Timer
Float scale
int predSex
bool blocked=false

Event OnEffectStart(Actor akTarget, Actor akCaster)
predSex=akCaster.getLeveledActorBase().getSex()
if(akCaster.getItemCount(Fullness)>0)
	StomachCapacity.show()
	dispel()
elseif(akCaster.isWeaponDrawn()&&akCaster==Game.getPlayer())
	SheathWeapon.show()
	dispel()
elseif(ManagerQuest.isBlocked(akTarget) || ManagerQuest.isBlocked(akCaster))
	blocked=true
	dispel()
ElseIf ((AkTarget.GetActorBase().GetSex() == 1) && (MaleEnabled.GetValue() == 1)) || ((AkTarget.GetActorBase().GetSex() == 0) && (FemaleEnabled.GetValue() == 1))
	dispel()
	MyScript.Debugger("Disabled by "+AkTarget.GetDisplayName()+"'s Gender.", "EndoScript")
ElseIf ((AkCaster.GetActorBase().GetSex() == 1) && (MaleEnabled.GetValue() == 1)) || ((AkCaster.GetActorBase().GetSex() == 0) && (FemaleEnabled.GetValue() == 1))
	dispel()
	MyScript.Debugger("Disabled by "+AkCaster.GetDisplayName()+"'s Gender.", "EndoScript")
else
	if(predSex==1)
		thePrey=akTarget
		thePred=akCaster

		ManagerQuest.registerBlock(thePrey)
		ManagerQuest.registerBlock(thePred)

		thePred.addSpell(SwallowPreventSpell,false)
		thePrey.addSpell(SwallowPreventSpell,false)
		thePred.addItem(NoSwallowToken,1,true)
		thePrey.addItem(NoSwallowToken,1,true)		

		Actor victim=thePrey

		Game.ForceThirdPerson()
		registerForUpdate(0.1)
		thePrey.setPosition(thePred.getPositionX(), thePred.getPositionY(), thePred.getPositionZ())
		thePrey.setMotionType(thePrey.Motion_Character)

		; TODO temporary
		if(thePred==Game.getPlayer())
		 	Game.setCameraTarget(thePrey)
		endif

		thePred.playIdleWithTarget(SwallowIdle, thePrey)
		Timer=0
		scale=1.0
	else
		thePred.KillEssential()
		Dispel()
	endif
endif
EndEvent

Event OnUpdate()
if(predSex!=1)
	thePred.KillEssential()
	Dispel()
else
Timer=Timer+1
if(Timer>=8)
	scale=scale*0.95
	; thePrey.setScale(scale)
endif
if(Timer==5)
	SwallowShader.play(thePrey, 0.5)
elseif(Timer==13)
	SwallowSound.play(thePred)
elseif(Timer>=40) ; check for animation end
	unregisterForUpdate()
	dispel()
endif
endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if(!blocked)
		ManagerQuest.unregisterBlock(thePrey)
		ManagerQuest.unregisterBlock(thePred)		
	endif
	
	thePrey.PlayIdle(IdleStop)
	thePred.PlayIdle(IdleStop)

	; TODO temporary
	if(thePred==game.getPlayer())
		Game.setCameraTarget(thePred)
	endif

	ManagerQuest.registerDigestion(thePred, thePrey, -1) ; -1 = oral, nonlethal
	thePred.removeSpell(SwallowPreventSpell)
	thePrey.removeSpell(SwallowPreventSpell)
	thePred.removeItem(NoSwallowToken,99,true)
	thePrey.removeItem(NoSwallowToken,99,true)
EndEvent

Spell Property PredSpell Auto
Sound Property SwallowSound  Auto  
GlobalVariable Property MaleEnabled Auto
GlobalVariable Property FemaleEnabled Auto
Idle Property SwallowIdle  Auto

EffectShader Property SwallowShader  Auto 

Message Property StomachCapacity Auto
FormList Property Fullness Auto

Idle Property IdleStop Auto

Message Property SheathWeapon Auto
SPELL Property EndoSpell  Auto  

SPELL Property VomitSpell  Auto  
SPELL Property SwallowPreventSpell  Auto  
MiscObject Property NoSwallowToken Auto
DevourmentNameScript Property MyScript Auto

DevourmentRegistryScript Property ManagerQuest Auto