;/ Decompiled by Champollion V1.0.0
Source   : TIF__02012BF4.psc
Modified : 2014-12-11 00:43:17
Compiled : 2014-12-11 00:43:18
User     : Forgetful_Hatter
Computer : Forgetful_Hatter
/;
scriptName TIF__02012BF4 extends TopicInfo hidden

;-- Properties --------------------------------------
devourmentregistryscript property Manager auto
miaringdemoeventhandler property MiaQuest auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function Fragment_45(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
			akSpeaker.GetCrimeFaction().SetCrimeGold(0)
	akSpeaker.GetCrimeFaction().SetCrimeGoldViolent(0)
	game.GetPlayer().StopCombatAlarm()
	
	
	MiaQuest.overrideDialog = 3
	Manager.forceSwallow(akSpeaker, game.getPlayer(), 1)
	
	
	
	
endFunction

; Skipped compiler generated GotoState
