Scriptname RND_Weight extends Quest  Conditional

Int[] Property RNDHungerEffects  Auto
MagicEffect[] Property RNDHungerMagicEffects  Auto
; RNDHungerEffects 0 = Gluttony
; RNDHungerEffects 1 = Satiated
; RNDHungerEffects 2 = Peckish
; RNDHungerEffects 3 = Hungry
; RNDHungerEffects 4 = Very Hungry
; RNDHungerEffects 5 = Very Hungry Perk
; RNDHungerEffects 6 = Starving
; RNDHungerEffects 7 = Starving Perk
GlobalVariable Property GameHour  Auto  

Float Property fOrigPlayerWeight  Auto  Conditional
Float Property fOrigPlayerMass  Auto  Conditional
Float Property fCurrentPlayerWeight  Auto  Conditional
Float Property fCurrentPlayerMass  Auto  Conditional

ReferenceAlias Property Alias_Player Auto

Int[] Property iEatingHabit  Auto  Conditional
Int Property quarterHour = 0 Auto  Conditional

Actor kPlayer
ActorBase kPlayerBase

Int iThisEatingHabit
Int iEatingHabitAvg

Int lastQuarterHour = 0
Int adj             = 0
Int activityPoll    = 0
Float combatAdj     = 0.0
Float combatAve     = 0.0
Float sprintAdj     = 0.0
Float sprintAve     = 0.0
Float weightAdj     = 0.0
Float weightAve     = 0.0
Float gluttonAdj    = 0.0
Float gluttonAve    = 0.0
Float satiatedAdj   = 0.0
Float satiatedAve   = 0.0
Float peckishAdj    = 0.0
Float peckishAve    = 0.0
Float hungryAdj     = 0.0
Float hungryAve     = 0.0
Float veryHungryAdj = 0.0
Float veryHungryAve = 0.0
Float starvingAdj   = 0.0
Float starvingAve   = 0.0
Bool glutton        = False
Bool satiated       = False
Bool peckish        = False
Bool hungry         = False
Bool veryHungry     = False
Bool starving       = False
Bool underWeight    = False
Bool overWeight     = False
Bool triggerUpdate  = False

Function ModActorWeight(Actor akActor, ActorBase akActorBase, Int iModVal )
	fCurrentPlayerWeight = akActorBase.GetWeight() + iModVal
	
	If ( fCurrentPlayerWeight < 0.1 )
		fCurrentPlayerWeight = 0.1
	EndIf
	If ( fCurrentPlayerWeight > 99.0 )
		fCurrentPlayerWeight = 99.0
	EndIf
	Debug.Trace( "RNDWeight:: " + fCurrentPlayerWeight )
	
	; make sure we have 3d loaded to access
	While ( !akActor.Is3DLoaded() )
		Utility.Wait( 0.01 )
	EndWhile

	akActorBase.SetWeight( fCurrentPlayerWeight )
EndFunction

Int Function getAverageFromIntArray( Int[] aiArray )
	Int iSum = 0
	Int iIdx = 0
	Int iLen = aiArray.Length
	Float fVal
	Float fAbs
	Int iRet

	While ( iIdx < iLen )
		iSum += aiArray[iIdx]
		iIdx += 1
	EndWhile
	
	fVal = iSum/iLen
	fAbs = Math.abs(fVal)
	iRet = Math.Ceiling(fAbs)
	
	If ( fAbs > 0.5 )
		If ( fVal < 0 )
			Return 0 - iRet
		Else
			Return iRet
		EndIf
	Else
		Return 0
	EndIf
EndFunction

Function zeroArray( Int[] aiArray )
	Int iIdx = 0
	Int iLen = aiArray.Length

	While ( iIdx < iLen )
		aiArray[iIdx] = 0
		iIdx += 1
	EndWhile
EndFunction

Event OnInit()
	kPlayer      = Alias_Player.GetActorReference()
	kPlayerBase  = kPlayer.GetActorBase()
	iEatingHabit = New Int[96]
EndEvent

Event OnUpdateGameTime()
	quarterHour = Math.Floor( GameHour.GetValue() * 4.0 )
	underWeight = fCurrentPlayerWeight < fOrigPlayerWeight
	overWeight  = fCurrentPlayerWeight > fOrigPlayerWeight

	If ( lastQuarterHour != quarterHour )
		gluttonAve       = gluttonAdj / activityPoll
		satiatedAve      = satiatedAdj / activityPoll
		peckishAve       = peckishAdj / activityPoll
		hungryAve        = hungryAdj / activityPoll
		veryHungryAve    = veryHungryAdj / activityPoll
		starvingAve      = starvingAdj / activityPoll
		combatAve        = combatAdj / activityPoll
		sprintAve        = sprintAdj / activityPoll
		weightAve        = weightAdj / activityPoll
		iThisEatingHabit = 0

		If ( gluttonAve >= 0.5 )
			iThisEatingHabit += 2
		EndIf
		If ( satiatedAve >= 0.5 || peckishAve >= 0.5 ) && underWeight
			iThisEatingHabit += 1
		EndIf
		If ( satiatedAve >= 0.5 || peckishAve >= 0.5 ) && overWeight
			iThisEatingHabit += -1
		EndIf
		If veryHungryAve >= 0.5
			iThisEatingHabit += -1
		EndIf
		If starvingAve >= 0.5
			iThisEatingHabit += -2
		EndIf
		If ( combatAve >= 0.5 )
			iThisEatingHabit += -1
		EndIf
		If ( sprintAve >= 0.5 )
			iThisEatingHabit += -1
		EndIf
		If ( weightAve >= 0.5 )
			iThisEatingHabit += -1
		EndIf
		
		If ( lastQuarterHour > quarterHour )
			; we've wrapped the array
			triggerUpdate = True

			While lastQuarterHour < iEatingHabit.Length
				iEatingHabit[lastQuarterHour] = iThisEatingHabit
				lastQuarterHour += 1
			EndWhile
			iEatingHabitAvg = getAverageFromIntArray( iEatingHabit )
			lastQuarterHour = 0
			While lastQuarterHour < quarterHour
				iEatingHabit[lastQuarterHour] = iThisEatingHabit
				lastQuarterHour += 1
			EndWhile
		Else
			triggerUpdate = ( quarterHour == 0 )

			While lastQuarterHour < quarterHour
				iEatingHabit[lastQuarterHour] = iThisEatingHabit
				lastQuarterHour += 1
			EndWhile
			
			If triggerUpdate
				iEatingHabitAvg = getAverageFromIntArray( iEatingHabit )
			EndIf
		EndIf

		activityPoll  = 0
		combatAdj     = 0.0
		combatAve     = 0.0
		sprintAdj     = 0.0
		sprintAve     = 0.0
		weightAdj     = 0.0
		weightAve     = 0.0
		gluttonAdj    = 0.0
		gluttonAve    = 0.0
		satiatedAdj   = 0.0
		satiatedAve   = 0.0
		peckishAdj    = 0.0
		peckishAve    = 0.0
		hungryAdj     = 0.0
		hungryAve     = 0.0
		veryHungryAdj = 0.0
		veryHungryAve = 0.0
		starvingAdj   = 0.0
		starvingAve   = 0.0
		lastQuarterHour = quarterHour
	EndIf
	
	If ( triggerUpdate )
		triggerUpdate = False
		ModActorWeight( kPlayer, kPlayerBase, iEatingHabitAvg )
	EndIf
EndEvent

Event OnUpdate()
	glutton = kPlayer.HasMagicEffect( RNDHungerMagicEffects[0] )
	satiated = kPlayer.HasMagicEffect( RNDHungerMagicEffects[1] )
	peckish = kPlayer.HasMagicEffect( RNDHungerMagicEffects[2] )
	hungry = kPlayer.HasMagicEffect( RNDHungerMagicEffects[3] )
	veryHungry = ( kPlayer.HasMagicEffect( RNDHungerMagicEffects[4] ) || kPlayer.HasMagicEffect( RNDHungerMagicEffects[5] ) )
	starving = ( kPlayer.HasMagicEffect( RNDHungerMagicEffects[6] ) || kPlayer.HasMagicEffect( RNDHungerMagicEffects[7] ) )

	activityPoll += 1
	If ( kPlayer.IsInCombat() )
		combatAdj += 1.0
	EndIf
	If ( kPlayer.IsSprinting() )
		sprintAdj += 1.0
	EndIf
	If glutton
		gluttonAdj += 1.0
	EndIf
	If satiated
		satiatedAdj += 1.0
	EndIf
	If peckish
		peckishAdj += 1.0
	EndIf
	If hungry
		hungryAdj += 1.0
	EndIf
	If veryHungry
		veryHungryAdj += 1.0
	EndIf
	If starving
		starvingAdj += 1.0
	EndIf
	If ( kPlayer.GetAV("InventoryWeight") > kPlayer.GetAV("CarryWeight") )
		weightAdj += 1.0
	EndIf
EndEvent
