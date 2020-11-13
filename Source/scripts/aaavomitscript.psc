Scriptname aaaVomitScript extends ObjectReference  

DevourmentRegistryScript Property manager Auto

; ReferenceAlias Property theVictim  Auto  

Explosion Property theExplosion  Auto  

Event OnInit()
	Actor victim=manager.getVomitPrey()
	manager.unregisterVomit()
if(!digested)
	victim.moveTo(Self)
	victim.setPosition(Self.GetPositionX(),Self.getPositionY(),Self.getPositionZ()+42)
		victim.setScale(1)
		victim.removeSpell(NotThere)
		victim.setAlpha(100)
		victim.setGhost(false)
	if(victim!=Game.GetPlayer())
		victim.enable(0)
		; if(PreyHP.getValue()>0)
		;	victim.damageAV("Health",victim.getAV("Health")-PreyHP.getValue())
		; else
		;	victim.damageAV("Health",-1+victim.getAV("Health"))
		; endif
		victim.stopCombat()
	else
		; NoPlayerShader.stop(victim)
		; victim.setUnconscious(false)
		victim.setPlayerControls(true)
		victim.enableAI(true)
		Game.setCameraTarget(victim)
		; victim.dispelSpell(PlayerIsPreySpell)
		;pushActorAway(victim,0)
		; Game.ForceFirstPerson()
		Game.EnablePlayerControls()
		DontSwallowMe.cast(Game.getPlayer(),Game.getPlayer())
	endif
	victim.playIdle(resetIdle)
	ObjectReference boom=placeAtMe(theExplosion)
	; boom.setAngle(0,0,0)
	; boom.setscale(0.5)

	;/if(victim.getAV("Health")<victim.getLevel())
		victim.restoreAV("Health",victim.getLevel()-victim.getAV("Health"))
	endif/;
	
	if(scent)
		ScentSpell.cast(victim)
	endif
else
	ObjectReference thePile=placeatme(VomitPile)
	thePile.setAngle(0,0,0)
	Victim.removeAllItems(thePile,false,true)
endif
	disable()
	delete()
endEvent

GlobalVariable Property PreyHP  Auto
GlobalVariable Property pukeEnable Auto
EffectShader Property NoPlayerShader Auto
Spell Property PlayerIsPreySpell Auto
Idle Property ResetIdle Auto
SPELL Property DontSwallowMe  Auto  

Bool Property digested  Auto  
Container Property VomitPile Auto

Spell Property NotThere Auto

Bool Property Scent=false Auto
Spell Property ScentSpell Auto