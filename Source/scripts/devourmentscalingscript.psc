Scriptname DevourmentScalingScript extends activemagiceffect  

GlobalVariable Property DTimeGlobal Auto
Spell Property ScalingCancelSpell Auto
Armor Property Fullness Auto
Armor Property FullnessShrink Auto
Spell Property mySpell Auto

float B1=0.22
float S1=2.7 ; 7.0 ; 1.75 ; 7.0
float N1=0.7 ; 1.0 ; 0.25 ; 1.0

float B2=0.1
float S2=5.0 ; 600.0 ; 1.5 ; 600.0
float N2=2.5 ; 600.0 ; 1.5 ; 600.0

float B3=0.05
float S3=9.0 ; 480.0 ; 6400.0 ; 1.6 ; 6400.0
float N3=3.0 ; 640.0 ; 4800.0 ; 1.2 ; 4800.0

float totalDigestionTime=0.0
float digestionTime=0.0
int digestionState=-1 ; -1 means standard mesh at full scale, 0 means standard mesh going down to 75% scale, stages 1-4 use the shrinking mesh and their own node scaling
int digestionMultiplier=1
Actor thePred

Event OnEffectStart(Actor akTarget, Actor akCaster)
	totalDigestionTime=DTimeGlobal.getValue()
	digestionTime=totalDigestionTime
	thePred=akTarget
	registerForSingleUpdate(0.1)
EndEvent

Event OnUpdate()
	registerForSingleUpdate(0.1)
	if(digestionMultiplier==1&&thePred.getCombatState()>0)
		digestionMultiplier=50
	elseif(digestionMultiplier==50&&thePred.getCombatState()==0)
		digestionMultiplier=1
	endif

	if(thePred.hasSpell(ScalingCancelSpell))
		digestionMultiplier=51
	elseif(digestionMultiplier==51)
		digestionMultiplier=1
	endif

	digestionTime=digestionTime-digestionMultiplier

	if(digestionState==-1 && digestionTime<(totalDigestionTime*7.0/8.0))
		digestionState=0
	elseif(digestionState==0)
		if(digestionTime>0)
			scaleNodes(totalDigestionTime,digestionTime,7.0/8.0, 0,1.0,B1,1.0,S1,1.0,N1)
		else
			; Debug.messageBox("Removing...")
			thePred.removeSpell(ScalingCancelSpell)
			unregisterForUpdate()
			thePred.dispelSpell(mySpell)
			dispel()
		endif
	endif
EndEvent

Function scaleNodes(float totalTime, float currentTime, float startTime, float endTime, float BA, float BB, float SA, float SB, float NA, float NB)
	float scaleTime=(currentTime-(totalTime*endTime))/((startTime-endTime)*totalTime)
	float scaleB=scaleTime*(BA-BB)+BB
	float scaleS=scaleTime*(SA-SB)+SB
	float scaleN=scaleTime*(NA-NB)+NB
	NetImmerse.setNodeScale(thePred,"NPC Belly",scaleB, false)
	NetImmerse.setNodeScale(thePred,"Devourment Belly Envelope S",scaleS, false)
	NetImmerse.setNodeScale(thePred,"Devourment Belly Envelope N",scaleN, false)
EndFunction