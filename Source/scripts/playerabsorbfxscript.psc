Scriptname PlayerAbsorbFXScript extends ActiveMagicEffect  
{Scripted effect for Playing Visual Effects that look like absorb connect beams.}

import debug
import game

;======================================================================================;
;  PROPERTIES  /
;=============/
ImageSpaceModifier property TrapImod auto
{IsMod applied with this effect}
;sound property TrapSoundFX auto ; create a sound property we'll point to in the editor
;{Sound played when we trap a soul}
VisualEffect property TargetVFX auto
{Visual Effect on Target aiming at Caster}
VisualEffect property CasterVFX auto
{Visual Effect on Caster aming at Target}
; EffectShader property CasterFXS auto
; {Effect Shader on Caster during Soul trap}
; EffectShader property TargetFXS auto
; {Effect Shader on Target during Soul trap}
Spell Property DummySpell Auto
MiscObject Property EffectToken Auto

Float Property fImodFadeDistance = 2048.0 auto
Float Property fEffectDurationMax = 1000.0 auto
{Optional property for controling the time of these effects should they be on a zero duration hit effect Default = 40.0}

;======================================================================================;
;  VARIABLES   /
;=============/

Float fTDistance
bool bIsFinishing = False
ObjectReference thePile
Actor ThisGuy

;======================================================================================;
;  EVENTS      /
;=============/


Event OnEffectStart(Actor Target, Actor Caster)
bool started
ThisGuy=Target
if(target.getItemCount(EffectToken)==0)
			target.addItem(EffectToken,1,true)
			TrapImod.apply()
			if TargetVFX
				TargetVFX.Play(Target,fEffectDurationMax,Game.getPlayer())              ; Play TargetVFX and aim them at the player
				;DummySpell.cast(Game.getPlayer(),Target)
			endif
			if CasterVFX
				CasterVFX.Play(Caster,fEffectDurationMax,Game.getPlayer())
			endif
		; TargetFXS.Play(Target,2)    						; Play Effect Shaders
		; CasterFXS.Play(Caster,3)
endif
EndEvent

;Event OnDeath(Actor akKiller)
;	ThisGuy.placeatme(Kaboom)
;	ThisGuy.disable()
;	ThisGuy.attachAshPile(Remains)
;	ThisGuy.moveto(HerStomach)
;EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
		bIsFinishing = True
		if TargetVFX
			TargetVFX.Stop(Target)              ; Play TargetVFX and aim them at the player
		endif
		if CasterVFX
			CasterVFX.Stop(Game.getPlayer())
		endif
		Target.removeItem(EffectToken,1,true)
endevent

Container Property Remains Auto
Explosion Property Kaboom Auto
ObjectReference Property HerStomach Auto