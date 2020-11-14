;/ Decompiled by Champollion V1.0.1
Source   : AddDevourmentScript.psc
Modified : 2019-01-06 20:54:39
Compiled : 2019-01-06 20:54:40
User     : Rickard
Computer : GAMEMEISTER
/;
scriptName adddevourmentscript extends activemagiceffect

;-- Properties --------------------------------------
keyword property NPC auto
spell property TheAddSpell auto
devourmentregistryscript property Manager auto
spell property Devourment auto
spell property Options auto
magiceffect property DevourmentNPCEffect auto
spell property Endo auto
spell property DevourmentNPC auto
shout property DevourmentShoutNPC auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function OnEffectStart(Actor akTarget, Actor akCaster)

	if akTarget.hasKeyword(NPC) && (akTarget.GetLeveledActorBase().GetSex() == 1 || akTarget.GetLeveledActorBase().GetSex() == 0) || !akTarget.hasKeyword(NPC) && Manager.isModPredatorRace(akTarget.GetLeveledActorBase().getRace())
		if akTarget != game.GetPlayer()
			DevourmentNPC.Cast(akTarget as objectreference, none)
		endIf
	endIf
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState
