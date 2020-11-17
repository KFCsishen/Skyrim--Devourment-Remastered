Scriptname DevourmentScatScriptNPC extends activemagiceffect  

ObjectReference deadPlayer

Event OnEffectStart(Actor akTarget, Actor akCaster)
    RegisterForUpdate(0.5)
    thePoop=prey.getReference() as Actor
    thePred=getTargetActor()
    ; started=false
EndEvent

Event OnUpdate()
    dispel()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    ; if(started==false)
        ; started=true
        bool protected=false
        if(thePoop.getLeveledActorBase().isProtected())
            protected=true
            thePoop.getLeveledActorBase().setProtected(false)
        endif
        thePoop.killEssential(thePred)
        if(protected)
            thePoop.GetLeveledActorBase().setProtected(true)
        endif
        thePoop.moveTo(thePred)
        thePoop.setPosition(thePred.getPositionX(), thePred.getPositionY(), thePred.getPositionZ())
        NiOverride.SetBodyMorph(thepred, "vore prey belly","memes", 0)
        NiOverride.UpdateModelWeight(thepred)
        if(thePoop!=Game.GetPlayer()&&!thePoop.isEssential()&&!thePoop.getLeveledActorBase().isProtected()&&thePoop.isDead())
            thePoop.SetCriticalStage(thePoop.CritStage_GooEnd)
            thePoop.attachAshPile(scatPile)
        else
            deadPlayer=thePred.placeatme(EssentialPoop)
            thePoop.disable()
            thePoop.killEssential()
            deadPlayer.setAngle(0,0,0)
            if(thePoop!=Game.GetPlayer())
                thePoop.removeAllItems(deadPlayer)
            endif
        endif
        ScatSound.playAndWait(thePred)
        thePred.removeItem(Fullness,99,true)
    ; endif
EndEvent

Actor thePoop
Actor thePred
bool started

ReferenceAlias Property prey  Auto  
Armor Property Fullness  Auto  
Activator Property scatPile Auto
Sound Property scatSound Auto
Container Property EssentialPoop Auto
