Scriptname VoiceDevourmentScript extends activemagiceffect  

Int PreyHP
Actor thePrey
Actor thePred
Race originalRace
Int Timer

Event OnEffectStart(Actor akTarget, Actor akCaster)
if(akCaster.getItemCount(Fullness)>0)
	StomachCapacity.show()
	dispel()
else
if(akCaster.GetActorBase().GetSex()==1)
	Game.ForceThirdPerson()
	registerForUpdate(0.1)
	thePrey=akTarget
	thePred=akCaster
	thePrey.setPosition(thePred.getPositionX(), thePred.getPositionY(), thePred.getPositionZ())
	thePred.playIdleWithTarget(SwallowIdle, thePrey)
	Timer=0
else
	thePred.KillEssential()
	Dispel()
endif
endif
EndEvent

Event OnUpdate()
if(thePred.GetActorBase().GetSex()!=1)
thePred.KillEssential()
Dispel()
else
Timer=Timer+1
if(Timer>=8)
	thePrey.setScale(thePrey.getScale()*0.95)
endif
if(Timer==5)
	SwallowShader.play(thePrey, 0.5)
elseif(Timer==13)
	SwallowSound.play(thePred)
elseif(Timer>=18) ; check for animation end
	tempHP.setValue(thePrey.getav("Health") as Int)
	dispel()
	predSpell.cast(thePrey,thePred)
endif
endif
EndEvent

Int Property DamagePerSec  Auto
Race Property HighElfRace Auto
Race Property HighElfRaceV Auto
Race Property HighElfRaceFull Auto
Message Property DigestMessage  Auto  

Quest Property AssistQuest  Auto  

Quest Property ScatQuest  Auto  

GlobalVariable Property ScatGlobal  Auto  

ReferenceAlias Property PredAlias  Auto  

ReferenceAlias Property PreyAlias  Auto  
Spell Property PredSpell Auto
GlobalVariable Property tempHP Auto
Sound Property SwallowSound  Auto  

Idle Property SwallowIdle  Auto  

EffectShader Property SwallowShader  Auto 

Message Property StomachCapacity Auto
Armor Property Fullness Auto