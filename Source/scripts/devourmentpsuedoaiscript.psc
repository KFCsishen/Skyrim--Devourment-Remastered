Scriptname DevourmentPsuedoAIScript extends activemagiceffect  

Actor myself
Actor possiblePrey
int cooldown

Event OnEffectStart(Actor akTarget, Actor akCaster)
if(isValidPred(akTarget))
	registerForSingleUpdate(0.25)
	myself=akTarget
	if(akTarget.HasKeyword(Voracious))
		cooldown=0
	else
		cooldown=8
	endif
endif
EndEvent

Event OnUpdate()
if(isValidPred(myself))
	;Debug.messageBox(myself.getLeveledActorBase().getRace()+" is valid")
if((PredsEnabled.getValue()==1 || (PredsEnabled.getValue()==2 && myself.IsPlayerTeammate()))&&!myself.isDead()&&!myself.hasMagicEffectWithKeyword(BeingSwallowed)); &&!BrawlQuest.isRunning()&&CompanionQuest.GetStage()!=20)
	if (myself.getCombatState()!=0 && myself.getItemCount(Fullness)==0)
		possiblePrey=myself.getCombatTarget()
		if(!possiblePrey.hasMagicEffectWithKeyword(BeingSwallowed)&&(cooldown<=0||possiblePrey.isBleedingOut())&&myself.getDistance(PossiblePrey) <= 180 && (possiblePrey.getAVPercentage("Health") < 0.95 || possiblePrey.getLevel() < myself.getLevel()))
			; Debug.MessageBox("OM NOM NOM")
			SwallowSpell.cast(myself,possiblePrey)
			if(!possiblePrey.hasSpell(EatMe)&&!myself.hasKeyword(Voracious)&&!myself.hasMagicEffect(smellSomethingNice))
				cooldown=16-(2*NPCBonus.getValue()) as Int
			else
				cooldown=2
			endif
		elseif(cooldown>0)
			cooldown=(cooldown - 1)
		; else
			; Debug.messageBox(possiblePrey.hasMagicEffectWithKeyword(BeingSwallowed)+" "+cooldown+" "+myself.getDistance(PossiblePrey))
		endif
	endif
	registerForSingleUpdate(0.25)
else
	dispel()
endif
endif
EndEvent

Bool Function isValidPred(Actor akTarget)
	return (akTarget.hasKeyword(NPC)&&akTarget.getLeveledActorBase().getSex()==1)||(!akTarget.hasKeyword(NPC)&&Manager.isModPredatorRace(akTarget.getLeveledActorBase().getRace()))
EndFunction

FormList Property Fullness Auto
Spell Property SwallowSpell Auto
GlobalVariable Property PredsEnabled Auto
Keyword Property BeingSwallowed Auto
GlobalVariable Property NPCBonus Auto
Quest Property BrawlQuest Auto
Quest Property CompanionQuest Auto
Spell Property EatMe Auto
Keyword Property Voracious Auto
MagicEffect Property SmellSomethingNice Auto
Keyword Property NPC Auto
DevourmentRegistryScript Property Manager Auto