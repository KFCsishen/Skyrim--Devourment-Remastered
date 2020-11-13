ScriptName WeightMorphs Extends ReferenceAlias

; Version data
Int Property NIOVERRIDE_VERSION = 6 AutoReadOnly
Int Property NIOVERRIDE_SCRIPT_VERSION = 6 AutoReadOnly
Int Property WEIGHTMORPHS_VERSION = 2 AutoReadOnly
Int Property Version = 0 Auto

String Property WEIGHTMORPHS_KEY = "WeightMorphs.esp" AutoReadOnly

; Most relevant morphs
Float Property MultBreastsSSH = 0.25 Auto
Float Property MultBigBelly = 0.3 Auto
Float Property MultBigTorso = 1.0 Auto
Float Property MultButtShape2 = 0.5 Auto
Float Property MultChubbyArms = 0.8 Auto
Float Property MultChubbyButt = 1.0 Auto
Float Property MultChubbyLegs = 0.8 Auto
Float Property MultWaist = 1.0 Auto
Float Property MultWideWaistLine = 0.9 Auto
Float Property MultCalfSize = 0.2 Auto

Float Property MultSamuel = 1.0 Auto
Float Property MultSamson = 0.0 Auto

; Other morphs
Float Property MultBreasts = 0.0 Auto
Float Property MultBreastsSmall = 0.0 Auto
Float Property MultBreastsSH = 0.0 Auto
Float Property MultBreastsFantasy = 0.0 Auto
Float Property MultDoubleMelon = 0.0 Auto
Float Property MultBreastCleavage = 0.0 Auto
Float Property MultBreastFlatness = 0.0 Auto
Float Property MultBreastGravity = 0.0 Auto
Float Property MultPushUp = 0.0 Auto
Float Property MultBreastHeight = 0.0 Auto
Float Property MultBreastPerkiness = 0.0 Auto
Float Property MultBreastWidth = 0.0 Auto
Float Property MultNippleDistance = 0.0 Auto
Float Property MultNipplePerkiness = 0.0 Auto
Float Property MultNippleLength = 0.0 Auto
Float Property MultNippleSize = 0.0 Auto
Float Property MultNippleAreola = 0.0 Auto
Float Property MultNippleUp = 0.0 Auto
Float Property MultNippleDown = 0.0 Auto
Float Property MultNippleTip = 0.0 Auto
Float Property MultArms = 0.0 Auto
Float Property MultShoulderSmooth = 0.0 Auto
Float Property MultShoulderWidth = 0.0 Auto
Float Property MultBelly = 0.0 Auto
Float Property MultPregnancyBelly = 0.0 Auto
Float Property MultTummyTuck = 0.0 Auto
Float Property MultBack = 0.0 Auto
Float Property MultHipbone = 0.0 Auto
Float Property MultHips = 0.0 Auto
Float Property MultButtCrack = 0.0 Auto
Float Property MultButt = 0.0 Auto
Float Property MultBigButt = 0.0 Auto
Float Property MultAppleCheeks = 0.0 Auto
Float Property MultRoundAss = 0.0 Auto
Float Property MultSlimThighs = 0.0 Auto
Float Property MultThighs = 0.0 Auto
Float Property MultLegs = 0.0 Auto
Float Property MultKneeHeight = 0.0 Auto
Float Property MultCalfSmooth = 0.0 Auto

Actor Property PlayerRef Auto
FormList Property FoodLight Auto
FormList Property FoodMedium Auto
FormList Property FoodHeavy Auto
MagicEffect Property FoodDevourment Auto

Bool Property Enabled = True Auto
Int Property CustomFood = 2 Auto
Int Property Potions = 1 Auto
Int Property Ingredients = 1 Auto
Float Property MultLoss = 1.0 Auto
Float Property MultGainLight = 1.0 Auto
Float Property MultGainMedium = 1.0 Auto
Float Property MultGainHeavy = 1.0 Auto
Float Property MultGainDevourment = 1.0 Auto
Float Property MinWeight = 0.0 Auto
Float Property MaxWeight = 1.0 Auto
Float Property Weight = 0.0 Auto

Bool morphChanged = False

Int Function GetVersion()
	Return Version
EndFunction

Bool Function CheckNiOverride()
	Return SKSE.GetPluginVersion("NiOverride") >= NIOVERRIDE_VERSION && NiOverride.GetScriptVersion() >= NIOVERRIDE_SCRIPT_VERSION
EndFunction


Event OnInit()
	Version = WEIGHTMORPHS_VERSION
	ScanFood()
	ResetWeight(True)
	RegisterEvents(True)
EndEvent

Event OnPlayerLoadGame()
	If Enabled
		RegisterEvents(True)
	EndIf
EndEvent

Event OnUpdate()
	If Enabled
		; Version Update
		If Version < WEIGHTMORPHS_VERSION
			Version = WEIGHTMORPHS_VERSION
			ScanFood()
		EndIf
		
		If CheckNiOverride()
			If morphChanged
				NiOverride.UpdateModelWeight(PlayerRef)
				morphChanged = False
			EndIf
		EndIf
		RegisterForSingleUpdate(2)
	EndIf
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	If akSource == PlayerRef
		If asEventName == "FootLeft" || asEventName == "FootLeft"
			ChangeWeight(-0.0005 * MultLoss, False)
		ElseIf asEventName == "FootSprintLeft" || asEventName == "FootSprintRight"
			ChangeWeight(-0.001 * MultLoss, False)
		ElseIf asEventName == "JumpUp"
			ChangeWeight(-0.002 * MultLoss, False)
		EndIf
	EndIf
EndEvent

Event OnObjectEquipped(Form type, ObjectReference ref)
	If Enabled
		If type != None
			If FoodLight.Find(type) >= 0
				ChangeWeight(0.02 * MultGainLight)
			ElseIf FoodMedium.Find(type) >= 0
				ChangeWeight(0.07 * MultGainMedium)
			ElseIf FoodHeavy.Find(type) >= 0
				ChangeWeight(0.175 * MultGainHeavy)
			EndIf
		EndIf
	EndIf
EndEvent

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect  akEffect)
	If (akEffect == FoodDevourment)
				ChangeWeight(0.3 * MultGainDevourment)
	EndIf
EndEvent

Function ChangeWeight(Float amount, Bool applyNow = True)
	Weight = Weight + amount
	
	If Weight > MaxWeight
		Weight = MaxWeight
	ElseIf Weight < MinWeight
		Weight = MinWeight
	EndIf
	
	UpdateWeight(applyNow)
EndFunction

Function UpdateWeight(Bool applyNow = True)
	If CheckNiOverride()
		Int PlayerSex = PlayerRef.GetActorBase().GetSex()
		
		; Female
		If PlayerSex == 1
			If MultBreastsSSH != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "BreastsSSH", WEIGHTMORPHS_KEY, Weight * MultBreastsSSH)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "BreastsSSH", WEIGHTMORPHS_KEY)
			EndIf
			If MultBigBelly != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "BigBelly", WEIGHTMORPHS_KEY, Weight * MultBigBelly)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "BigBelly", WEIGHTMORPHS_KEY)
			EndIf
			If MultBigTorso != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "BigTorso", WEIGHTMORPHS_KEY, Weight * MultBigTorso)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "BigTorso", WEIGHTMORPHS_KEY)
			EndIf
			If MultButtShape2 != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "ButtShape2", WEIGHTMORPHS_KEY, Weight * MultButtShape2)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "ButtShape2", WEIGHTMORPHS_KEY)
			EndIf
			If MultChubbyArms != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "ChubbyArms", WEIGHTMORPHS_KEY, Weight * MultChubbyArms)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "ChubbyArms", WEIGHTMORPHS_KEY)
			EndIf
			If MultChubbyButt != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "ChubbyButt", WEIGHTMORPHS_KEY, Weight * MultChubbyButt)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "ChubbyButt", WEIGHTMORPHS_KEY)
			EndIf
			If MultChubbyLegs != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "ChubbyLegs", WEIGHTMORPHS_KEY, Weight * MultChubbyLegs)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "ChubbyLegs", WEIGHTMORPHS_KEY)
			EndIf
			If MultWaist != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "Waist", WEIGHTMORPHS_KEY, Weight * MultWaist)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "Waist", WEIGHTMORPHS_KEY)
			EndIf
			If MultWideWaistLine != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "WideWaistLine", WEIGHTMORPHS_KEY, Weight * MultWideWaistLine)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "WideWaistLine", WEIGHTMORPHS_KEY)
			EndIf
			If MultCalfSize != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "CalfSize", WEIGHTMORPHS_KEY, Weight * MultCalfSize)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "CalfSize", WEIGHTMORPHS_KEY)
			EndIf
			
			If MultBreasts != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "Breasts", WEIGHTMORPHS_KEY, Weight * MultBreasts)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "Breasts", WEIGHTMORPHS_KEY)
			EndIf
			If MultBreastsSmall != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "BreastsSmall", WEIGHTMORPHS_KEY, Weight * MultBreastsSmall)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "BreastsSmall", WEIGHTMORPHS_KEY)
			EndIf
			If MultBreastsSH != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "BreastsSH", WEIGHTMORPHS_KEY, Weight * MultBreastsSH)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "BreastsSH", WEIGHTMORPHS_KEY)
			EndIf
			If MultBreastsFantasy != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "BreastsFantasy", WEIGHTMORPHS_KEY, Weight * MultBreastsFantasy)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "BreastsFantasy", WEIGHTMORPHS_KEY)
			EndIf
			If MultDoubleMelon != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "DoubleMelon", WEIGHTMORPHS_KEY, Weight * MultDoubleMelon)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "DoubleMelon", WEIGHTMORPHS_KEY)
			EndIf
			If MultBreastCleavage != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "BreastCleavage", WEIGHTMORPHS_KEY, Weight * MultBreastCleavage)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "BreastCleavage", WEIGHTMORPHS_KEY)
			EndIf
			If MultBreastFlatness != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "BreastFlatness", WEIGHTMORPHS_KEY, Weight * MultBreastFlatness)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "BreastFlatness", WEIGHTMORPHS_KEY)
			EndIf
			If MultBreastGravity != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "BreastGravity", WEIGHTMORPHS_KEY, Weight * MultBreastGravity)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "BreastGravity", WEIGHTMORPHS_KEY)
			EndIf
			If MultPushUp != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "PushUp", WEIGHTMORPHS_KEY, Weight * MultPushUp)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "PushUp", WEIGHTMORPHS_KEY)
			EndIf
			If MultBreastHeight != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "BreastHeight", WEIGHTMORPHS_KEY, Weight * MultBreastHeight)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "BreastHeight", WEIGHTMORPHS_KEY)
			EndIf
			If MultBreastPerkiness != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "BreastPerkiness", WEIGHTMORPHS_KEY, Weight * MultBreastPerkiness)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "BreastPerkiness", WEIGHTMORPHS_KEY)
			EndIf
			If MultBreastWidth != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "BreastWidth", WEIGHTMORPHS_KEY, Weight * MultBreastWidth)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "BreastWidth", WEIGHTMORPHS_KEY)
			EndIf
			If MultNippleDistance != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "NippleDistance", WEIGHTMORPHS_KEY, Weight * MultNippleDistance)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "NippleDistance", WEIGHTMORPHS_KEY)
			EndIf
			If MultNipplePerkiness != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "NipplePerkiness", WEIGHTMORPHS_KEY, Weight * MultNipplePerkiness)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "NipplePerkiness", WEIGHTMORPHS_KEY)
			EndIf
			If MultNippleLength != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "NippleLength", WEIGHTMORPHS_KEY, Weight * MultNippleLength)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "NippleLength", WEIGHTMORPHS_KEY)
			EndIf
			If MultNippleSize != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "NippleSize", WEIGHTMORPHS_KEY, Weight * MultNippleSize)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "NippleSize", WEIGHTMORPHS_KEY)
			EndIf
			If MultNippleAreola != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "NippleAreola", WEIGHTMORPHS_KEY, Weight * MultNippleAreola)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "NippleAreola", WEIGHTMORPHS_KEY)
			EndIf
			If MultNippleUp != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "NippleUp", WEIGHTMORPHS_KEY, Weight * MultNippleUp)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "NippleUp", WEIGHTMORPHS_KEY)
			EndIf
			If MultNippleDown != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "NippleDown", WEIGHTMORPHS_KEY, Weight * MultNippleDown)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "NippleDown", WEIGHTMORPHS_KEY)
			EndIf
			If MultNippleTip != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "NippleTip", WEIGHTMORPHS_KEY, Weight * MultNippleTip)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "NippleTip", WEIGHTMORPHS_KEY)
			EndIf
			If MultArms != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "Arms", WEIGHTMORPHS_KEY, Weight * MultArms)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "Arms", WEIGHTMORPHS_KEY)
			EndIf
			If MultShoulderSmooth != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "ShoulderSmooth", WEIGHTMORPHS_KEY, Weight * MultShoulderSmooth)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "ShoulderSmooth", WEIGHTMORPHS_KEY)
			EndIf
			If MultShoulderWidth != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "ShoulderWidth", WEIGHTMORPHS_KEY, Weight * MultShoulderWidth)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "ShoulderWidth", WEIGHTMORPHS_KEY)
			EndIf
			If MultBelly != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "Belly", WEIGHTMORPHS_KEY, Weight * MultBelly)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "Belly", WEIGHTMORPHS_KEY)
			EndIf
			If MultPregnancyBelly != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "PregnancyBelly", WEIGHTMORPHS_KEY, Weight * MultPregnancyBelly)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "PregnancyBelly", WEIGHTMORPHS_KEY)
			EndIf
			If MultTummyTuck != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "TummyTuck", WEIGHTMORPHS_KEY, Weight * MultTummyTuck)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "TummyTuck", WEIGHTMORPHS_KEY)
			EndIf
			If MultBack != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "Back", WEIGHTMORPHS_KEY, Weight * MultBack)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "Back", WEIGHTMORPHS_KEY)
			EndIf
			If MultHipbone != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "Hipbone", WEIGHTMORPHS_KEY, Weight * MultHipbone)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "Hipbone", WEIGHTMORPHS_KEY)
			EndIf
			If MultHips != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "Hips", WEIGHTMORPHS_KEY, Weight * MultHips)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "Hips", WEIGHTMORPHS_KEY)
			EndIf
			If MultButtCrack != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "ButtCrack", WEIGHTMORPHS_KEY, Weight * MultButtCrack)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "ButtCrack", WEIGHTMORPHS_KEY)
			EndIf
			If MultButt != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "Butt", WEIGHTMORPHS_KEY, Weight * MultButt)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "Butt", WEIGHTMORPHS_KEY)
			EndIf
			If MultBigButt != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "BigButt", WEIGHTMORPHS_KEY, Weight * MultBigButt)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "BigButt", WEIGHTMORPHS_KEY)
			EndIf
			If MultAppleCheeks != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "AppleCheeks", WEIGHTMORPHS_KEY, Weight * MultAppleCheeks)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "AppleCheeks", WEIGHTMORPHS_KEY)
			EndIf
			If MultRoundAss != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "RoundAss", WEIGHTMORPHS_KEY, Weight * MultRoundAss)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "RoundAss", WEIGHTMORPHS_KEY)
			EndIf
			If MultSlimThighs != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "SlimThighs", WEIGHTMORPHS_KEY, Weight * MultSlimThighs)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "SlimThighs", WEIGHTMORPHS_KEY)
			EndIf
			If MultThighs != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "Thighs", WEIGHTMORPHS_KEY, Weight * MultThighs)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "Thighs", WEIGHTMORPHS_KEY)
			EndIf
			If MultLegs != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "Legs", WEIGHTMORPHS_KEY, Weight * MultLegs)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "Legs", WEIGHTMORPHS_KEY)
			EndIf
			If MultKneeHeight != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "KneeHeight", WEIGHTMORPHS_KEY, Weight * MultKneeHeight)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "KneeHeight", WEIGHTMORPHS_KEY)
			EndIf
			If MultCalfSmooth != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "CalfSmooth", WEIGHTMORPHS_KEY, Weight * MultCalfSmooth)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "CalfSmooth", WEIGHTMORPHS_KEY)
			EndIf
			
		; Male
		ElseIf PlayerSex == 0
			If MultSamuel != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "Samuel", WEIGHTMORPHS_KEY, Weight * MultSamuel)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "Samuel", WEIGHTMORPHS_KEY)
			EndIf
			If MultSamson != 0.0
				NiOverride.SetBodyMorph(PlayerRef, "Samson", WEIGHTMORPHS_KEY, Weight * MultSamson)
			Else
				NiOverride.ClearBodyMorph(PlayerRef, "Samson", WEIGHTMORPHS_KEY)
			EndIf
		EndIf
		
		If applyNow
			NiOverride.UpdateModelWeight(PlayerRef)
		Else
			morphChanged = True
		EndIf
	EndIf
EndFunction

Function RegisterEvents(Bool _enable)
	If _enable
		RegisterForAnimationEvent(PlayerRef, "FootLeft")
		RegisterForAnimationEvent(PlayerRef, "FootRight")
		RegisterForAnimationEvent(PlayerRef, "FootSprintLeft")
		RegisterForAnimationEvent(PlayerRef, "FootSprintRight")
		RegisterForAnimationEvent(PlayerRef, "JumpUp")
		RegisterForSingleUpdate(2)
	Else
		UnregisterForAnimationEvent(PlayerRef, "FootLeft")
		UnregisterForAnimationEvent(PlayerRef, "FootRight")
		UnregisterForAnimationEvent(PlayerRef, "FootSprintLeft")
		UnregisterForAnimationEvent(PlayerRef, "FootSprintRight")
		UnregisterForAnimationEvent(PlayerRef, "JumpUp")
		UnregisterForUpdate()
	EndIf
EndFunction

Function ResetWeight(Bool _enable)
	Weight = 0.0
	morphChanged = _enable
	If !_enable
		ClearMorphs()
	EndIf
EndFunction

Function ClearMorphs()
	If CheckNiOverride()
		; Female
		NiOverride.ClearBodyMorph(PlayerRef, "BreastsSSH", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "BigBelly", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "BigTorso", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "ButtShape2", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "ChubbyArms", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "ChubbyButt", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "ChubbyLegs", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "Waist", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "WideWaistLine", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "CalfSize", WEIGHTMORPHS_KEY)
		
		NiOverride.ClearBodyMorph(PlayerRef, "Breasts", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "BreastsSmall", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "BreastsSH", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "BreastsFantasy", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "DoubleMelon", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "BreastCleavage", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "BreastFlatness", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "BreastGravity", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "PushUp", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "BreastHeight", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "BreastPerkiness", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "BreastWidth", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "NippleDistance", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "NipplePerkiness", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "NippleLength", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "NippleSize", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "NippleAreola", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "NippleUp", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "NippleDown", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "NippleTip", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "Arms", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "ShoulderSmooth", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "ShoulderWidth", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "Belly", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "PregnancyBelly", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "TummyTuck", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "Back", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "Hipbone", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "Hips", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "ButtCrack", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "Butt", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "BigButt", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "AppleCheeks", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "RoundAss", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "SlimThighs", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "Thighs", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "Legs", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "KneeHeight", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "CalfSmooth", WEIGHTMORPHS_KEY)
		
		; Male
		NiOverride.ClearBodyMorph(PlayerRef, "Samuel", WEIGHTMORPHS_KEY)
		NiOverride.ClearBodyMorph(PlayerRef, "Samson", WEIGHTMORPHS_KEY)
		
		NiOverride.UpdateModelWeight(PlayerRef)
	EndIf
EndFunction

Function ScanFood()
	FoodLight.Revert()
	FoodMedium.Revert()
	FoodHeavy.Revert()
	
	Int i = 0
	Int j = 0
	String[] mods = Utility.CreateStringArray(Game.GetModCount())
	Keyword[] dummy
	
	While i < mods.Length
		mods[i] = Game.GetModName(i)
		If mods[i] != "Skyrim.esm"
			Form[] aFood = GameData.GetAllPotions(mods[i], dummy, False, True)
			If CustomFood > 0
				While j < aFood.Length
					If CustomFood == 1
						FoodLight.AddForm(aFood[j])
					ElseIf CustomFood == 2
						FoodMedium.AddForm(aFood[j])
					ElseIf CustomFood == 3
						FoodHeavy.AddForm(aFood[j])
					EndIf
					j += 1
				EndWhile
				j = 0
			EndIf
		EndIf
		
		Form[] aPotions = GameData.GetAllPotions(mods[i], dummy, True)
		Form[] aIngredients = GameData.GetAllIngredients(mods[i], dummy)
		If Potions > 0
			While j < aPotions.Length
				If Potions == 1
					FoodLight.AddForm(aPotions[j])
				ElseIf Potions == 2
					FoodMedium.AddForm(aPotions[j])
				ElseIf Potions == 3
					FoodHeavy.AddForm(aPotions[j])
				EndIf
				j += 1
			EndWhile
			j = 0
		EndIf
		
		If Ingredients > 0
			While j < aIngredients.Length
				If Ingredients == 1
					FoodLight.AddForm(aIngredients[j])
				ElseIf Ingredients == 2
					FoodMedium.AddForm(aIngredients[j])
				ElseIf Ingredients == 3
					FoodHeavy.AddForm(aIngredients[j])
				EndIf
				j += 1
			EndWhile
			j = 0
		EndIf
		
		i += 1
	EndWhile
EndFunction
