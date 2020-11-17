Scriptname DevourmentComfyScript extends activemagiceffect  
Spell Property WellRested auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
RegisterForSingleUpdateGameTime(8)
RegisterForSingleUpdate(5)
EndEvent
Event OnUpdate()
if(!ManagerQuest.Isplayerinbelly())
    Dispel()
    endif
RegisterForSingleUpdate(5)
EndEvent

Event OnUpdateGameTime()
    Game.getplayer().addspell(Wellrested)
   
EndEvent

DevourmentRegistryScript Property ManagerQuest Auto
