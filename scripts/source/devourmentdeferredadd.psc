Scriptname DevourmentDeferredAdd extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
    RegisterForUpdate(1)
EndEvent

Event OnUpdate()
if(Game.IsActivateControlsEnabled())
    ActorBase PlayerBase = Game.GetPlayer().GetBaseObject() as ActorBase   
      
            Actor theplayer=Game.getPlayer()
            ThePlayer.addSpell(SwallowSpell)
            ThePlayer.addspell(Swallowreversedspell)
            ThePlayer.addspell(Burp)
            ThePlayer.addSpell(EndoSpell)
            ThePlayer.addSpell(RapidDigestion)
            ThePlayer.addSpell(Aura, true)
            ThePlayer.addPerk(SwallowCorpse)
            if(Theplayer.getLevel()>Theplayer.getAV("variable05"))
                int startlevel=thePlayer.getLevel()
                if(startLevel>35)
                    startLevel=35
                endif
                Theplayer.setAV("variable05",startlevel)
                DevourmentSkillMessage.show(startlevel+15)
            endif
    
    dispel()
endif
EndEvent

Spell Property Aura Auto
Spell Property SwallowSpell Auto
Spell Property SwallowReversedSpell Auto
Spell Property Burp Auto
Spell Property EndoSpell Auto
Spell Property RapidDigestion Auto
Perk Property SwallowCorpse Auto
Message Property DevourmentSkillMessage Auto