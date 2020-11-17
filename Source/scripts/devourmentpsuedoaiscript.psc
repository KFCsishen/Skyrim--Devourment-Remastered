Scriptname DevourmentPsuedoAIScript extends activemagiceffect  

GlobalVariable property multipreynpc auto
GlobalVariable property Fempred Auto
GlobalVariable property Malepred Auto
GlobalVariable property animalpred auto
GlobalVariable Property multiprey Auto
GlobalVariable property npcsetting auto
GlobalVariable Property playercentric auto
GlobalVariable Property Playerdetected auto
Keyword property creature auto
Actor myself
Actor possiblePrey
int cooldown
Race Property dragon auto
int range

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
Utility.SetIniFloat("fActorFadeOutLimit:Camera",0)
EndEvent

Event OnUpdate()
    if(isValidPred(myself))
    range = 500
    ;Debug.messageBox(myself.getLeveledActorBase().getRace()+" is valid")
    if((PredsEnabled.getValue()==1 || ( PredsEnabled.getValue()==2 && myself.IsPlayerTeammate()))&&!myself.isDead()&&!myself.hasMagicEffectWithKeyword(BeingSwallowed)&&((myself.haskeyword(creature)&&animalpred.getvalue()== 1)||(myself.getLeveledActorBase().getSex()==1&&Fempred.getvalue()==1&&!myself.haskeyword(creature))||(myself.getLeveledActorBase().getSex()==0&&Malepred.getvalue()==1)&&!myself.haskeyword(creature))); &&!BrawlQuest.isRunning()&&CompanionQuest.GetStage()!=20)
    
    if (myself.getCombatState()!=0 && (myself.getItemCount(Fullness)==0||multipreynpc.getvalue() == 1))
        possiblePrey=myself.getcombattarget()
        if(possiblePrey.isdead() == true)
           SwallowSpell.cast(myself,possiblePrey) 
        endif
        if(!possiblePrey.hasMagicEffectWithKeyword(BeingSwallowed)&&(cooldown<=0||possiblePrey.isBleedingOut())&&myself.getDistance(PossiblePrey) <= range && (possiblePrey.getAVPercentage("Health") < 0.95 || possiblePrey.getLevel() < myself.getLevel()))
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
    return (akTarget.hasKeyword(NPC)&&Aktarget != Game.GetPlayer())||(!akTarget.hasKeyword(NPC)&&Manager.isModPredatorRace(akTarget.getLeveledActorBase().getRace()))
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