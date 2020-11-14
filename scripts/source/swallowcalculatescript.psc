Scriptname SwallowCalculateScript extends activemagiceffect  

;Int PreyHP
Actor thePrey
Actor thePred
;Race originalRace
Int Timer
Float scale
bool swallow
int PredSex
bool blocked=false
GlobalVariable property Fempred Auto
GlobalVariable property Malepred Auto
GlobalVariable property animalpred auto
GlobalVariable Property multiprey Auto
GlobalVariable Property multipreynpc Auto
GlobalVariable property npcsetting auto
GlobalVariable Property playercentric auto
Race Property Dragon Auto
keyword property npc auto
keyword property creature auto
Spell Property paralyze auto
Perk Property S1 Auto
Perk Property S2 Auto
Perk Property S3 Auto
Perk Property S4 Auto
Perk Property S5 Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    thePrey=akTarget
    thePred=akCaster
    predSex=thePred.getLeveledActorBase().getSex()
    scale=1
    swallow=false
    Timer=0
    
    if((thePred.getItemCount(Fullness)>0&&thePred == Game.GetPlayer()&&multiprey.getvalue() == 0) || (thePred.getItemCount(Fullness)>0&&thePred != Game.GetPlayer()&&multipreynpc.getvalue() == 0) )
        if(thepred == Game.GetPlayer())
            StomachCapacity.show()
        EndIf
    
    dispel()   
elseif(ManagerQuest.isBlocked(akTarget) || ManagerQuest.isBlocked(akCaster))
    blocked=true
    dispel()
else
  
        if(playercentric.getvalue() == 0||(playercentric.getvalue() == 1&&(theprey == Game.GetPlayer()||thepred == Game.GetPlayer()))) ; only female predators are allowed(galmar1313: Get nae'd nae'd)
        ManagerQuest.registerBlock(thePrey)
        ManagerQuest.registerBlock(thePred)

    float HP=thePrey.GetActorValuePercentage("Health")
    float STAM=thePrey.GetActorValuePercentage("Stamina")
    float PredSkill=0
    if(thePred==Game.GetPlayer())
        PredSkill=(thePred.getAV("Variable05")+15)
    else
        PredSkill=15+thePred.getAV("Variable05")+(thePred.getLevel()*1.7) as Int
        if(predSkill>100)
            predSkill=100
        endif
    endif
    float PreySkill=0
    if(thePrey==Game.GetPlayer())
        PreySkill=(thePrey.getAV("Variable05")+15)
    else
        PreySkill=thePrey.getAV("Variable05")+thePrey.getLevel()+15
    endif
    float PerkMult=1
    if(thePred.hasPerk(Voracious80))
        PerkMult=2
    elseif(thePred.hasPerk(Voracious60))
        PerkMult=1.8
    elseif(thePred.hasPerk(Voracious40))
        PerkMult=1.6
    elseif(thePred.hasPerk(Voracious20))
        PerkMult=1.4
    elseif(thePred.hasPerk(Voracious00))
        PerkMult=1.2
    endif
    Float swallowChance=(1.0 + (PredSkill-PreySkill)/100.0)*perkMult*perkMult*Math.pow(2.71828,-HP-(0.5*STAM))
    if(!thePred.isDetectedBy(thePrey))
        swallowChance=(swallowChance*2.5)
        if(thePred.hasPerk(SilentSwallow))
        thePrey.stopcombat()
        thePrey.setalert(false)
        endif
  
    
    endif
    
    if(thePred!=Game.GetPlayer())
        swallowChance=(swallowChance*NPCBonus.getValue())
    endif

    swallowChance=swallowChance*(1+thePred.getAV("FavorActive")/100)
    swallowChance=swallowChance*(1-thePrey.getAV("FavorPointsBonus")/100)

    if(thePred.hasPerk(SilentSwallow)&&thePrey.getSleepState()>2)
        swallowChance=1
    endif
    
    if(thePrey.hasPerk(S1))
        swallowChance *= 0.9
    elseif(thePrey.hasPerk(S2))
        swallowChance *= 0.8
    elseif(thePrey.hasPerk(S3))
        swallowChance *= 0.7
    elseif(thePrey.hasPerk(S4))
        swallowChance *= 0.6
    elseif(thePrey.hasPerk(S5))
        swallowChance *= 0.5
    endif    
    
    if(swallowChance<(MinChance.getValue()/100.0))
        swallowChance=(MinChance.getValue()/100.0)
    endif

    if(thePrey.isDead()||thePrey.isBleedingOut()||thePrey.HasMagicEffectWithKeyword(Surrender)||Scripted)
        SwallowChance=1
    endif
    float d100Roll=Utility.randomFloat()
    if(d100Roll>swallowChance) ; swallow failed
        dispel()
    else ; success!
        
        swallow=true
        SwallowSound.play(thePred)
        thePred.addSpell(SwallowPreventSpell,false)
        thePrey.addSpell(SwallowPreventSpell,false)
        thePred.addItem(NoSwallowToken,1,true)
        thePrey.addItem(NoSwallowToken,1,true)
        if(thepred.hasperk(ConstrictingGrip))
        theprey.addspell(paralyze,false)
        endif
        if(thePrey==Game.GetPlayer())
            Game.ForceThirdPerson()
        endif
        registerForUpdate(0.1)
        
         thePrey.setMotionType(thePrey.Motion_Character)
         if(thePrey!=Game.GetPlayer() || thePred.getActorBase()==thePred.getLeveledActorBase())
             ;thePred.playidlewithtarget(swallowidle,theprey)
            
        else
             Game.DisablePlayerControls(false, true, true, true, true, true, true, false, 0)
            
        endif
        Timer=0
    endif
    scale=1.0
else
    Dispel()
endif

Dispel()

endif
EndEvent

Event OnUpdate()

    Timer += 1
    if Timer >= 4 && thePrey != game.GetPlayer()
        scale *= 0.950000
    endIf
    if Timer == 2
        SwallowShader.play(thePrey as objectreference, 0.200000)
    elseIf Timer == 6
        SwallowSound.play(thePred as objectreference)
        SwallowShader.Stop(thePrey as objectreference)
    elseIf Timer >= 18
        self.unregisterForUpdate()
        self.dispel()
    endIf
    if thePred.isDead() || thePred.HasMagicEffectWithKeyword(BeingSwallowed)
        self.dispel()
    endIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
if(swallow&&!thePred.isDead())
    tempHP.setValue(thePrey.getav("Health") as Int)
    ManagerQuest.registerDigestion(thePred, thePrey, 1) ; flag 1 = oral, lethal
    thePred.restoreav("health",1)
    thePred.damageav("health",1)
    thePred.restoreav("health",1)

elseif(thePred.isDead()||thePred.hasMagicEffectWithKeyword(BeingSwallowed))
    thePrey.setScale(1)
    if(thePrey==Game.getPlayer())
        Game.enablePlayerControls()
    endif
endif

if(!blocked)
    ManagerQuest.unregisterBlock(thePrey)
    ManagerQuest.unregisterBlock(thePred)
endif
    thePred.removeSpell(SwallowPreventSpell)
    thePrey.removeSpell(SwallowPreventSpell)
    thePred.removeItem(NoSwallowToken,99,true)
    thePrey.removeItem(NoSwallowToken,99,true)
EndEvent

Spell Property PredSpell Auto
GlobalVariable Property tempHP Auto
Sound Property SwallowSound  Auto  


Idle Property SwallowIdle  Auto
Idle Property PredStagger Auto
Idle Property PreyRepel Auto

EffectShader Property SwallowShader  Auto 

Message Property StomachCapacity Auto
FormList Property Fullness Auto

Perk Property Voracious00 Auto
Perk Property Voracious20 Auto
Perk Property Voracious40 Auto
Perk Property Voracious60 Auto
Perk Property Voracious80 Auto

Idle Property IdleStop Auto

Message Property SheathWeapon Auto
Perk Property SilentSwallow  Auto
Perk Property ConstrictingGrip Auto  

GlobalVariable Property MinChance Auto

Spell Property PlayerIsPreySpell Auto

Keyword Property BeingSwallowed Auto

GlobalVariable Property NPCBonus Auto
SPELL Property SwallowPreventSpell  Auto  

MiscObject Property NoSwallowToken Auto 

Keyword Property Surrender  Auto  

DevourmentRegistryScript Property ManagerQuest Auto
Bool Property Scripted  Auto  
