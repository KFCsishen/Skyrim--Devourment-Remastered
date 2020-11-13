Scriptname DevourmentVomitQueueScript extends Quest  

Actor[] predArray
Actor[] preyArray
int[] healthArray
bool[] digestedArray
int numQueue
bool isPuking

Actor cachedPrey
int cacheTimer

Event OnInit()
	numQueue=0
	predArray=new Actor[8]
	preyArray=new Actor[8]
	healthArray=new Int[8]
	digestedArray=new Bool[8]
	isPuking=false
EndEvent

Event OnUpdate()
	if(NeedToAdd.getValue() != 0)
		predArray[numQueue]=TempPred.getActorRef()
		preyArray[numQueue]=TempPrey.getActorRef()
		healthArray[numQueue]=tempHP.getValue() as Int
		digestedArray[numQueue]=(TempDigested.getValue()==1)
		numQueue+=1
		NeedToAdd.setValue(0)
	endif
	if(numQueue!=0)
		if(ReadyToPuke.getValue()==0&&!isPuking)
			isPuking=true
			Debug.sendAnimationEvent(predArray[0],"shoutStart")
			VomitSound.playAndWait(predArray[0])
			predArray[0].removeItem(Fullness,99,true)
			Debug.sendAnimationEvent(predArray[0],"shoutStop")
			if(WhoGotPuked.getActorRef()!=preyArray[0])
				WhoGotPuked.forceRefTo(preyArray[0])
			endif
			ReadyToPuke.setValue(1)
			if(!preyArray[0].isDead())
				; Debug.MessageBox(preyArray[0].getAV("FavorsPerDay"))
				if(preyArray[0].getAV("FavorsPerDay")>0)
					VomitSpellScent.Cast(predArray[0])
					preyArray[0].setAV("FavorsPerDay",0)
				else
					VomitSpell.Cast(predArray[0])
				endif
			else
				VomitSpellRemains.cast(predArray[0])
			endif
			predArray[0].restoreav("Health",1)
			predArray[0].damageav("Health",1)
			predArray[0].restoreav("Health",1)
			Int iElement = 0
			While (iElement<numQueue)
				predArray[iElement]=predArray[iElement+1]
				preyArray[iElement]=preyArray[iElement+1]
				healthArray[iElement]=healthArray[iElement+1]
				digestedArray[iElement]=digestedArray[iElement+1]
				iElement+=1
			EndWhile
			numQueue-=1
			isPuking=false
		endif
	elseif(ReadyToPuke.getValue()==0)
		unregisterForUpdate()
		stop()
	else ; code to prevent puke queue from being clogged when a projectile doesn't hit
		if(cachedPrey!=WhoGotPuked.getActorRef())
			cachedPrey=WhoGotPuked.getActorRef()
			cacheTimer=0
		else
			if(cacheTimer>30)
				; unclog manually
				unclogMessage.show()
				Game.GetPlayer().placeAtMe(vomitActivator)
			else
				cacheTimer=cacheTimer+1
			endif
		endif
	endif
EndEvent

Sound Property VomitSound  Auto  

GlobalVariable Property tempHP  Auto  

SPELL Property VomitSpell  Auto  

ReferenceAlias Property TempPred  Auto  

ReferenceAlias Property TempPrey  Auto  

ReferenceAlias Property WhoGotPuked  Auto  

GlobalVariable Property NeedToAdd  Auto  

GlobalVariable Property ReadyToPuke  Auto  

FormList Property Fullness Auto

GlobalVariable Property TempDigested Auto

Spell Property VomitSpellRemains Auto

Message Property unclogMessage Auto
Activator Property vomitActivator Auto

Spell Property ScentSpell Auto
Spell Property VomitSpellScent Auto