Scriptname DevourmentScalingScriptToo extends activemagiceffect  

FormList Property FullnessTypes Auto

float B3=0.22
float S3=2.7 ; 7.0 ; 1.75 ; 7.0
float N3=0.7 ; 1.0 ; 0.25 ; 1.0

float B4=0.025
float S4=4.0
float N4=2.0

int time=0

Actor thePred

Event OnEffectStart(Actor akTarget, Actor akCaster)
	thePred=akTarget
	registerForUpdate(0.05)
EndEvent

Event OnUpdate()
	time=time+1
	scaleNodes(20,time,1.0,0.0,B4,B3,S4,S3,N4,N3)
	if(time>20)
		dispel()
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	thePred.removeItem(fullnessTypes, 99, true)
	NetImmerse.setNodeScale(thePred,"NPC Belly",1, false)
	NetImmerse.setNodeScale(thePred,"Devourment Belly Envelope S",1, false)
	NetImmerse.setNodeScale(thePred,"Devourment Belly Envelope N",1, false)
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