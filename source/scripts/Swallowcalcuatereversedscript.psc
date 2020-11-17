Scriptname Swallowcalcuatereversedscript extends activemagiceffect  

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
Race Property Dragon Auto
keyword property npc auto
keyword property creature auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    thePred=akTarget
    thePrey=akCaster
    predSex=thePred.getLeveledActorBase().getSex()
    scale=1
    swallow=false
    Timer=0
    if((thepred == Game.GetPlayer()&&thePred.getItemCount(Fullness)>0&&multiprey.getvalue() == 0)||(thepred != Game.GetPlayer()&&thePred.getItemCount(Fullness)>0 &&multipreynpc.getvalue() == 0))
        if(thepred == Game.GetPlayer())
            StomachCapacity.show()
        EndIf
    
    dispel()   
elseif(ManagerQuest.isBlocked(akTarget) || ManagerQuest.isBlocked(akCaster))
    blocked=true
    dispel()
else
    
    
        swallow=true
        thePred.addSpell(SwallowPreventSpell,false)
        thePrey.addSpell(SwallowPreventSpell,false)
        thePred.addItem(NoSwallowToken,1,true)
        thePrey.addItem(NoSwallowToken,1,true)
        Utility.SetIniFloat("fActorFadeOutLimit:Camera",-100)
        if(thePrey==Game.GetPlayer())
            Game.ForceThirdPerson()
        endif
        registerForUpdate(0.1)
        
         thePrey.setMotionType(thePrey.Motion_Character)
         if(thePrey!=Game.GetPlayer() || thePred.getActorBase()==thePred.getLeveledActorBase())
           
            
        else
            Game.DisablePlayerControls(true, true, true, false, true, true, true, false, 0)
        endif
        Timer=0
    
    scale=1.0


endif
EndEvent

Event OnUpdate()

     Timer=Timer+1
    SwallowShader.play(thePrey, 0.2)
    SwallowSound.play(thePred)
    SwallowShader.Stop(thePrey)
    

    unregisterForUpdate()
    dispel()

if(thePred.isDead()||thePred.hasMagicEffectWithKeyword(BeingSwallowed))
    dispel()
endif
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

GlobalVariable Property MinChance Auto

Spell Property PlayerIsPreySpell Auto

Keyword Property BeingSwallowed Auto

GlobalVariable Property NPCBonus Auto
SPELL Property SwallowPreventSpell  Auto  

MiscObject Property NoSwallowToken Auto 

Keyword Property Surrender  Auto  

DevourmentRegistryScript Property ManagerQuest Auto
Bool Property Scripted  Auto  