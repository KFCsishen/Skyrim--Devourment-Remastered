ScriptName WeightMorphsMCM Extends SKI_ConfigBase

; Version data
Int Property NIOVERRIDE_VERSION = 6 AutoReadOnly
Int Property NIOVERRIDE_SCRIPT_VERSION = 6 AutoReadOnly

Actor Property PlayerRef Auto
WeightMorphs Property WMorphs Auto

Int _myEnabled
Int _myScanFood
Int _myCustomFood
Int _myIngredients
Int _myPotions

Int _myMultLoss
Int _myMultGainLight
Int _myMultGainMedium
Int _myMultGainHeavy
Int _myMultGainDevourment
Int _myMinWeight
Int _myMaxWeight
Int _myWeight

; Most relevant morphs
Int _myMultBreastsSSH
Int _myMultBigBelly
Int _myMultBigTorso
Int _myMultButtShape2
Int _myMultChubbyArms
Int _myMultChubbyButt
Int _myMultChubbyLegs
Int _myMultWaist
Int _myMultWideWaistLine
Int _myMultCalfSize

Int _myMultSamuel
Int _myMultSamson

; Other morphs
Int _myMultBreasts
Int _myMultBreastsSmall
Int _myMultBreastsSH
Int _myMultBreastsFantasy
Int _myMultDoubleMelon
Int _myMultBreastCleavage
Int _myMultBreastFlatness
Int _myMultBreastGravity
Int _myMultPushUp
Int _myMultBreastHeight
Int _myMultBreastPerkiness
Int _myMultBreastWidth
Int _myMultNippleDistance
Int _myMultNipplePerkiness
Int _myMultNippleLength
Int _myMultNippleSize
Int _myMultNippleAreola
Int _myMultNippleUp
Int _myMultNippleDown
Int _myMultNippleTip
Int _myMultArms
Int _myMultShoulderSmooth
Int _myMultShoulderWidth
Int _myMultBelly
Int _myMultPregnancyBelly
Int _myMultTummyTuck
Int _myMultBack
Int _myMultHipbone
Int _myMultHips
Int _myMultButtCrack
Int _myMultButt
Int _myMultBigButt
Int _myMultAppleCheeks
Int _myMultRoundAss
Int _myMultSlimThighs
Int _myMultThighs
Int _myMultLegs
Int _myMultKneeHeight
Int _myMultCalfSmooth


; @overrides SKI_ConfigBase
Event OnConfigInit()
	Pages = new String[3]
	Pages[0] = "$WEIGHTMORPHS_OPTIONS"
	Pages[1] = "$WEIGHTMORPHS_MORPHS"
	Pages[2] = "$WEIGHTMORPHS_INFO"
EndEvent

; @implements SKI_QuestBase
;Event OnVersionUpdate(int a_version)

;EndEvent

; @implements SKI_ConfigBase
Event OnPageReset(String a_page)
	; Load custom logo in DDS format
	If (a_page == "")
		; Image size 256x256
		; X offset = 376 - (height / 2) = 258
		; Y offset = 223 - (width / 2) = 95
		LoadCustomContent("weightmorphs/res/mcm_logo.dds", 258, 95)
		Return
	Else
		UnloadCustomContent()
	EndIf

	If (a_page == Pages[0])
		SetCursorFillMode(LEFT_TO_RIGHT)
		AddHeaderOption("$WEIGHTMORPHS_OPTIONS")
		AddEmptyOption()
		
		_myEnabled = AddToggleOption("$WEIGHTMORPHS_ENABLED", WMorphs.Enabled)
		_myScanFood = AddTextOption("", "$WEIGHTMORPHS_SCANFOOD")
		
		If WMorphs.CustomFood == 1
			_myCustomFood = AddMenuOption("$WEIGHTMORPHS_CUSTOMFOOD", "$WEIGHTMORPHS_LIGHT")
		ElseIf WMorphs.CustomFood == 2
			_myCustomFood = AddMenuOption("$WEIGHTMORPHS_CUSTOMFOOD", "$WEIGHTMORPHS_MEDIUM")
		ElseIf WMorphs.CustomFood == 3
			_myCustomFood = AddMenuOption("$WEIGHTMORPHS_CUSTOMFOOD", "$WEIGHTMORPHS_HEAVY")
		Else
			_myCustomFood = AddMenuOption("$WEIGHTMORPHS_CUSTOMFOOD", "$WEIGHTMORPHS_NONE")
		EndIf
		
		If WMorphs.Potions == 1
			_myPotions = AddMenuOption("$WEIGHTMORPHS_POTIONS", "$WEIGHTMORPHS_LIGHT")
		ElseIf WMorphs.Potions == 2
			_myPotions = AddMenuOption("$WEIGHTMORPHS_POTIONS", "$WEIGHTMORPHS_MEDIUM")
		ElseIf WMorphs.Potions == 3
			_myPotions = AddMenuOption("$WEIGHTMORPHS_POTIONS", "$WEIGHTMORPHS_HEAVY")
		Else
			_myPotions = AddMenuOption("$WEIGHTMORPHS_POTIONS", "$WEIGHTMORPHS_NONE")
		EndIf
		
		If WMorphs.Ingredients == 1
			_myIngredients = AddMenuOption("$WEIGHTMORPHS_INGREDIENTS", "$WEIGHTMORPHS_LIGHT")
		ElseIf WMorphs.Ingredients == 2
			_myIngredients = AddMenuOption("$WEIGHTMORPHS_INGREDIENTS", "$WEIGHTMORPHS_MEDIUM")
		ElseIf WMorphs.Ingredients == 3
			_myIngredients = AddMenuOption("$WEIGHTMORPHS_INGREDIENTS", "$WEIGHTMORPHS_HEAVY")
		Else
			_myIngredients = AddMenuOption("$WEIGHTMORPHS_INGREDIENTS", "$WEIGHTMORPHS_NONE")
		EndIf
		
		AddEmptyOption()
		AddEmptyOption()
		AddEmptyOption()
		
		_myMinWeight = AddSliderOption("$WEIGHTMORPHS_MINWEIGHT", WMorphs.MinWeight, "{2}")
		_myMaxWeight = AddSliderOption("$WEIGHTMORPHS_MAXWEIGHT", WMorphs.MaxWeight, "{2}")
		_myWeight = AddTextOption("$WEIGHTMORPHS_WEIGHT", WMorphs.Weight, OPTION_FLAG_DISABLED)
		AddEmptyOption()
		AddEmptyOption()
		AddEmptyOption()
		
		_myMultLoss = AddSliderOption("$WEIGHTMORPHS_MULTLOSS", WMorphs.MultLoss, "{2}")
		_myMultGainLight = AddSliderOption("$WEIGHTMORPHS_MULTGAINLIGHT", WMorphs.MultGainLight, "{2}")
		_myMultGainMedium = AddSliderOption("$WEIGHTMORPHS_MULTGAINMEDIUM", WMorphs.MultGainMedium, "{2}")
		_myMultGainHeavy = AddSliderOption("$WEIGHTMORPHS_MULTGAINHEAVY", WMorphs.MultGainHeavy, "{2}")
		_myMultGainDevourment = AddSliderOption("Devourment Weight Gain Modifier", WMorphs.MultGainDevourment, "{2}")
		
	ElseIf (a_page == Pages[1])
		SetCursorFillMode(LEFT_TO_RIGHT)
		AddHeaderOption("$WEIGHTMORPHS_FEMALE")
		AddEmptyOption()
		
		_myMultBreastsSSH = AddSliderOption("Breasts SSH", WMorphs.MultBreastsSSH, "{2}")
		_myMultBigBelly = AddSliderOption("Big Belly", WMorphs.MultBigBelly, "{2}")
		_myMultBigTorso = AddSliderOption("Big Torso", WMorphs.MultBigTorso, "{2}")
		_myMultButtShape2 = AddSliderOption("Butt Shape", WMorphs.MultButtShape2, "{2}")
		_myMultChubbyArms = AddSliderOption("Chubby Arms", WMorphs.MultChubbyArms, "{2}")
		_myMultChubbyButt = AddSliderOption("Chubby Butt", WMorphs.MultChubbyButt, "{2}")
		_myMultChubbyLegs = AddSliderOption("Chubby Legs", WMorphs.MultChubbyLegs, "{2}")
		_myMultWaist = AddSliderOption("Waist", WMorphs.MultWaist, "{2}")
		_myMultWideWaistLine = AddSliderOption("Wide Waist Line", WMorphs.MultWideWaistLine, "{2}")
		_myMultCalfSize = AddSliderOption("Calf Size", WMorphs.MultCalfSize, "{2}")
		AddEmptyOption()
		AddEmptyOption()
		
		_myMultBreasts = AddSliderOption("Breasts", WMorphs.MultBreasts, "{2}")
		_myMultBreastsSmall = AddSliderOption("Breasts Small", WMorphs.MultBreastsSmall, "{2}")
		_myMultBreastsSH = AddSliderOption("Breasts SH", WMorphs.MultBreastsSH, "{2}")
		_myMultBreastsFantasy = AddSliderOption("Breasts Fantasy", WMorphs.MultBreastsFantasy, "{2}")
		_myMultDoubleMelon = AddSliderOption("Double Melon", WMorphs.MultDoubleMelon, "{2}")
		_myMultBreastCleavage = AddSliderOption("Breast Cleavage", WMorphs.MultBreastCleavage, "{2}")
		_myMultBreastFlatness = AddSliderOption("Breast Flatness", WMorphs.MultBreastFlatness, "{2}")
		_myMultBreastGravity = AddSliderOption("Breast Gravity", WMorphs.MultBreastGravity, "{2}")
		_myMultPushUp = AddSliderOption("Pushup", WMorphs.MultPushUp, "{2}")
		_myMultBreastHeight = AddSliderOption("Breast Height", WMorphs.MultBreastHeight, "{2}")
		_myMultBreastPerkiness = AddSliderOption("Breast Perkiness", WMorphs.MultBreastPerkiness, "{2}")
		_myMultBreastWidth = AddSliderOption("Breast Width", WMorphs.MultBreastWidth, "{2}")
		_myMultNippleDistance = AddSliderOption("Nipple Distance", WMorphs.MultNippleDistance, "{2}")
		_myMultNipplePerkiness = AddSliderOption("Nipple Perkiness", WMorphs.MultNipplePerkiness, "{2}")
		_myMultNippleLength = AddSliderOption("Nipple Length", WMorphs.MultNippleLength, "{2}")
		_myMultNippleSize = AddSliderOption("Nipple Size", WMorphs.MultNippleSize, "{2}")
		_myMultNippleAreola = AddSliderOption("Nipple Areola", WMorphs.MultNippleAreola, "{2}")
		_myMultNippleUp = AddSliderOption("Nipple Up", WMorphs.MultNippleUp, "{2}")
		_myMultNippleDown = AddSliderOption("Nipple Down", WMorphs.MultNippleDown, "{2}")
		_myMultNippleTip = AddSliderOption("Nipple Tip", WMorphs.MultNippleTip, "{2}")
		_myMultArms = AddSliderOption("Arms", WMorphs.MultArms, "{2}")
		_myMultShoulderSmooth = AddSliderOption("Shoulder Smooth", WMorphs.MultShoulderSmooth, "{2}")
		_myMultShoulderWidth = AddSliderOption("Shoulder Width", WMorphs.MultShoulderWidth, "{2}")
		_myMultBelly = AddSliderOption("Belly", WMorphs.MultBelly, "{2}")
		_myMultPregnancyBelly = AddSliderOption("Pregnancy Belly", WMorphs.MultPregnancyBelly, "{2}")
		_myMultTummyTuck = AddSliderOption("Tummy Tuck", WMorphs.MultTummyTuck, "{2}")
		_myMultBack = AddSliderOption("Back", WMorphs.MultBack, "{2}")
		_myMultHipbone = AddSliderOption("Hipbone", WMorphs.MultHipbone, "{2}")
		_myMultHips = AddSliderOption("Hips", WMorphs.MultHips, "{2}")
		_myMultButtCrack = AddSliderOption("Butt Crack", WMorphs.MultButtCrack, "{2}")
		_myMultButt = AddSliderOption("Butt", WMorphs.MultButt, "{2}")
		_myMultBigButt = AddSliderOption("Big Butt", WMorphs.MultBigButt, "{2}")
		_myMultAppleCheeks = AddSliderOption("Apple Cheeks", WMorphs.MultAppleCheeks, "{2}")
		_myMultRoundAss = AddSliderOption("Round Ass", WMorphs.MultRoundAss, "{2}")
		_myMultSlimThighs = AddSliderOption("Slim Thighs", WMorphs.MultSlimThighs, "{2}")
		_myMultThighs = AddSliderOption("Thighs", WMorphs.MultThighs, "{2}")
		_myMultLegs = AddSliderOption("Legs", WMorphs.MultLegs, "{2}")
		_myMultKneeHeight = AddSliderOption("Knee Height", WMorphs.MultKneeHeight, "{2}")
		_myMultCalfSmooth = AddSliderOption("Calf Smooth", WMorphs.MultCalfSmooth, "{2}")
		AddEmptyOption()
		
		AddHeaderOption("$WEIGHTMORPHS_MALE")
		AddEmptyOption()
		
		_myMultSamuel = AddSliderOption("Samuel", WMorphs.MultSamuel, "{2}")
		_myMultSamson = AddSliderOption("Samson", WMorphs.MultSamson, "{2}")
		
	ElseIf (a_page == Pages[2])
		SetCursorFillMode(LEFT_TO_RIGHT)
		AddHeaderOption("WeightMorphs: " + WMorphs.GetVersion())
		AddEmptyOption()
		
		;SKSE
		AddHeaderOption("SKSE: " + GetSKSEVersion())
		If (CheckSKSEVersion(1, 7, 3) >= 0)
			AddToggleOption("$WEIGHTMORPHS_VERSION_PASS", True, OPTION_FLAG_DISABLED)
		Else
			AddToggleOption("$WEIGHTMORPHS_VERSION_FAIL", False, OPTION_FLAG_DISABLED)
		EndIf
		
		;NiOverride
		AddHeaderOption("NiOverride Script: " + NiOverride.GetScriptVersion())
		If (NiOverride.GetScriptVersion() >= NIOVERRIDE_SCRIPT_VERSION)
			AddToggleOption("$WEIGHTMORPHS_VERSION_PASS", True, OPTION_FLAG_DISABLED)
		Else
			AddToggleOption("$WEIGHTMORPHS_VERSION_FAIL", False, OPTION_FLAG_DISABLED)
		EndIf
		AddHeaderOption("NiOverride Plugin: " + SKSE.GetPluginVersion("NiOverride"))
		If (SKSE.GetPluginVersion("NiOverride") >= NIOVERRIDE_VERSION)
			AddToggleOption("$WEIGHTMORPHS_VERSION_PASS", True, OPTION_FLAG_DISABLED)
		Else
			AddToggleOption("$WEIGHTMORPHS_VERSION_FAIL", False, OPTION_FLAG_DISABLED)
		EndIf
	EndIf
EndEvent

Event OnOptionSelect(Int a_option)
	If a_option == _myEnabled
		WMorphs.Enabled = !WMorphs.Enabled
		SetToggleOptionValue(a_option, WMorphs.Enabled)
		WMorphs.ResetWeight(WMorphs.Enabled)
		WMorphs.RegisterEvents(WMorphs.Enabled)
		SetTextOptionValue(_myWeight, WMorphs.Weight)
	ElseIf a_option == _myScanFood
		EnableScan(False)
		WMorphs.ScanFood()
		EnableScan()
	EndIf
EndEvent

Event OnOptionMenuOpen(Int a_option)
	String[] menuWeight = new String[4]
	menuWeight[0] = "$WEIGHTMORPHS_NONE"
	menuWeight[1] = "$WEIGHTMORPHS_LIGHT"
	menuWeight[2] = "$WEIGHTMORPHS_MEDIUM"
	menuWeight[3] = "$WEIGHTMORPHS_HEAVY"
	
	If a_option == _myCustomFood
		SetMenuDialogOptions(menuWeight)
		SetMenuDialogStartIndex(WMorphs.CustomFood)
		SetMenuDialogDefaultIndex(2)
	ElseIf a_option == _myPotions
		SetMenuDialogOptions(menuWeight)
		SetMenuDialogStartIndex(WMorphs.Potions)
		SetMenuDialogDefaultIndex(1)
	ElseIf a_option == _myIngredients
		SetMenuDialogOptions(menuWeight)
		SetMenuDialogStartIndex(WMorphs.Ingredients)
		SetMenuDialogDefaultIndex(1)
	EndIf
EndEvent

Event OnOptionMenuAccept(Int a_option, Int index)
	Bool menuWeight = a_option == _myCustomFood || a_option == _myPotions || a_option == _myIngredients
	If menuWeight
		EnableScan(False)
	EndIf
	
	If a_option == _myCustomFood
		WMorphs.CustomFood = index;
	ElseIf a_option == _myPotions
		WMorphs.Potions = index;
	ElseIf a_option == _myIngredients
		WMorphs.Ingredients = index;
	EndIf
	
	If menuWeight
		If index == 1
			SetMenuOptionValue(a_option, "$WEIGHTMORPHS_LIGHT")
		ElseIf index == 2
			SetMenuOptionValue(a_option, "$WEIGHTMORPHS_MEDIUM")
		ElseIf index == 3
			SetMenuOptionValue(a_option, "$WEIGHTMORPHS_HEAVY")
		Else
			SetMenuOptionValue(a_option, "$WEIGHTMORPHS_NONE")
		EndIf
		WMorphs.ScanFood()
		EnableScan()
	EndIf
EndEvent

Event OnOptionSliderOpen(Int a_option)
	If a_option == _myMultLoss
		SetSliderDialogStartValue(WMorphs.MultLoss)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultGainLight
		SetSliderDialogStartValue(WMorphs.MultGainLight)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultGainMedium
		SetSliderDialogStartValue(WMorphs.MultGainMedium)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultGainHeavy
		SetSliderDialogStartValue(WMorphs.MultGainHeavy)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultGainDevourment
		SetSliderDialogStartValue(WMorphs.MultGainDevourment)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMinWeight
		SetSliderDialogStartValue(WMorphs.MinWeight)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 0.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMaxWeight
		SetSliderDialogStartValue(WMorphs.MaxWeight)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 2.0)
		SetSliderDialogInterval(0.01)
	ElseIf a_option == _myMultBreastsSSH
		SetSliderDialogStartValue(WMorphs.MultBreastsSSH)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultBigBelly
		SetSliderDialogStartValue(WMorphs.MultBigBelly)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultBigTorso
		SetSliderDialogStartValue(WMorphs.MultBigTorso)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultButtShape2
		SetSliderDialogStartValue(WMorphs.MultButtShape2)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultChubbyArms
		SetSliderDialogStartValue(WMorphs.MultChubbyArms)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultChubbyButt
		SetSliderDialogStartValue(WMorphs.MultChubbyButt)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultChubbyLegs
		SetSliderDialogStartValue(WMorphs.MultChubbyLegs)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultWaist
		SetSliderDialogStartValue(WMorphs.MultWaist)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultWideWaistLine
		SetSliderDialogStartValue(WMorphs.MultWideWaistLine)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultCalfSize
		SetSliderDialogStartValue(WMorphs.MultCalfSize)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultSamuel
		SetSliderDialogStartValue(WMorphs.MultSamuel)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultSamson
		SetSliderDialogStartValue(WMorphs.MultSamson)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-1.0, 1.0)
		SetSliderDialogInterval(0.1)
		
	ElseIf a_option == _myMultBreasts
		SetSliderDialogStartValue(WMorphs.MultBreasts)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultBreastsSmall
		SetSliderDialogStartValue(WMorphs.MultBreastsSmall)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultBreastsSH
		SetSliderDialogStartValue(WMorphs.MultBreastsSH)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultBreastsFantasy
		SetSliderDialogStartValue(WMorphs.MultBreastsFantasy)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultDoubleMelon
		SetSliderDialogStartValue(WMorphs.MultDoubleMelon)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultBreastCleavage
		SetSliderDialogStartValue(WMorphs.MultBreastCleavage)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultBreastFlatness
		SetSliderDialogStartValue(WMorphs.MultBreastFlatness)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultBreastGravity
		SetSliderDialogStartValue(WMorphs.MultBreastGravity)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultPushUp
		SetSliderDialogStartValue(WMorphs.MultPushUp)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultBreastHeight
		SetSliderDialogStartValue(WMorphs.MultBreastHeight)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultBreastPerkiness
		SetSliderDialogStartValue(WMorphs.MultBreastPerkiness)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultBreastWidth
		SetSliderDialogStartValue(WMorphs.MultBreastWidth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultNippleDistance
		SetSliderDialogStartValue(WMorphs.MultNippleDistance)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultNipplePerkiness
		SetSliderDialogStartValue(WMorphs.MultNipplePerkiness)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultNippleLength
		SetSliderDialogStartValue(WMorphs.MultNippleLength)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultNippleSize
		SetSliderDialogStartValue(WMorphs.MultNippleSize)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultNippleAreola
		SetSliderDialogStartValue(WMorphs.MultNippleAreola)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultNippleUp
		SetSliderDialogStartValue(WMorphs.MultNippleUp)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultNippleDown
		SetSliderDialogStartValue(WMorphs.MultNippleDown)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultNippleTip
		SetSliderDialogStartValue(WMorphs.MultNippleTip)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultArms
		SetSliderDialogStartValue(WMorphs.MultArms)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultShoulderSmooth
		SetSliderDialogStartValue(WMorphs.MultShoulderSmooth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultShoulderWidth
		SetSliderDialogStartValue(WMorphs.MultShoulderWidth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultBelly
		SetSliderDialogStartValue(WMorphs.MultBelly)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultPregnancyBelly
		SetSliderDialogStartValue(WMorphs.MultPregnancyBelly)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultTummyTuck
		SetSliderDialogStartValue(WMorphs.MultTummyTuck)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultBack
		SetSliderDialogStartValue(WMorphs.MultBack)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultHipbone
		SetSliderDialogStartValue(WMorphs.MultHipbone)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultHips
		SetSliderDialogStartValue(WMorphs.MultHips)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultButtCrack
		SetSliderDialogStartValue(WMorphs.MultButtCrack)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultButt
		SetSliderDialogStartValue(WMorphs.MultButt)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultBigButt
		SetSliderDialogStartValue(WMorphs.MultBigButt)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultAppleCheeks
		SetSliderDialogStartValue(WMorphs.MultAppleCheeks)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultRoundAss
		SetSliderDialogStartValue(WMorphs.MultRoundAss)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultSlimThighs
		SetSliderDialogStartValue(WMorphs.MultSlimThighs)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultThighs
		SetSliderDialogStartValue(WMorphs.MultThighs)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultLegs
		SetSliderDialogStartValue(WMorphs.MultLegs)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultKneeHeight
		SetSliderDialogStartValue(WMorphs.MultKneeHeight)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == _myMultCalfSmooth
		SetSliderDialogStartValue(WMorphs.MultCalfSmooth)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(-2.0, 2.0)
		SetSliderDialogInterval(0.1)
	EndIf
EndEvent

Event OnOptionSliderAccept(Int a_option, Float a_value)
	If a_option == _myMultLoss
		WMorphs.MultLoss = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLoss, "{2}")
	ElseIf a_option == _myMultGainLight
		WMorphs.MultGainLight = a_value
		SetSliderOptionValue(a_option, WMorphs.MultGainLight, "{2}")
	ElseIf a_option == _myMultGainMedium
		WMorphs.MultGainMedium = a_value
		SetSliderOptionValue(a_option, WMorphs.MultGainMedium, "{2}")
	ElseIf a_option == _myMultGainHeavy
		WMorphs.MultGainHeavy = a_value
		SetSliderOptionValue(a_option, WMorphs.MultGainHeavy, "{2}")
	ElseIf a_option == _myMultGainDevourment
		WMorphs.MultGainDevourment = a_value
		SetSliderOptionValue(a_option, WMorphs.MultGainDevourment, "{2}")
	ElseIf a_option == _myMinWeight
		WMorphs.MinWeight = a_value
		SetSliderOptionValue(a_option, WMorphs.MinWeight, "{2}")
	ElseIf a_option == _myMaxWeight
		WMorphs.MaxWeight = a_value
		SetSliderOptionValue(a_option, WMorphs.MaxWeight, "{2}")
	ElseIf a_option == _myMultBreastsSSH
		WMorphs.MultBreastsSSH = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastsSSH, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBigBelly
		WMorphs.MultBigBelly = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBigBelly, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBigTorso
		WMorphs.MultBigTorso = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBigTorso, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultButtShape2
		WMorphs.MultButtShape2 = a_value
		SetSliderOptionValue(a_option, WMorphs.MultButtShape2, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultChubbyArms
		WMorphs.MultChubbyArms = a_value
		SetSliderOptionValue(a_option, WMorphs.MultChubbyArms, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultChubbyButt
		WMorphs.MultChubbyButt = a_value
		SetSliderOptionValue(a_option, WMorphs.MultChubbyButt, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultChubbyLegs
		WMorphs.MultChubbyLegs = a_value
		SetSliderOptionValue(a_option, WMorphs.MultChubbyLegs, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultWaist
		WMorphs.MultWaist = a_value
		SetSliderOptionValue(a_option, WMorphs.MultWaist, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultWideWaistLine
		WMorphs.MultWideWaistLine = a_value
		SetSliderOptionValue(a_option, WMorphs.MultWideWaistLine, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultCalfSize
		WMorphs.MultCalfSize = a_value
		SetSliderOptionValue(a_option, WMorphs.MultCalfSize, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultSamuel
		WMorphs.MultSamuel = a_value
		SetSliderOptionValue(a_option, WMorphs.MultSamuel, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultSamson
		WMorphs.MultSamson = a_value
		SetSliderOptionValue(a_option, WMorphs.MultSamson, "{2}")
		WMorphs.UpdateWeight()
		
	ElseIf a_option == _myMultBreasts
		WMorphs.MultBreasts = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreasts, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastsSmall
		WMorphs.MultBreastsSmall = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastsSmall, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastsSH
		WMorphs.MultBreastsSH = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastsSH, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastsFantasy
		WMorphs.MultBreastsFantasy = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastsFantasy, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultDoubleMelon
		WMorphs.MultDoubleMelon = a_value
		SetSliderOptionValue(a_option, WMorphs.MultDoubleMelon, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastCleavage
		WMorphs.MultBreastCleavage = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastCleavage, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastFlatness
		WMorphs.MultBreastFlatness = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastFlatness, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastGravity
		WMorphs.MultBreastGravity = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastGravity, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultPushUp
		WMorphs.MultPushUp = a_value
		SetSliderOptionValue(a_option, WMorphs.MultPushUp, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastHeight
		WMorphs.MultBreastHeight = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastHeight, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastPerkiness
		WMorphs.MultBreastPerkiness = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastPerkiness, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBreastWidth
		WMorphs.MultBreastWidth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBreastWidth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNippleDistance
		WMorphs.MultNippleDistance = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNippleDistance, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNipplePerkiness
		WMorphs.MultNipplePerkiness = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNipplePerkiness, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNippleLength
		WMorphs.MultNippleLength = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNippleLength, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNippleSize
		WMorphs.MultNippleSize = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNippleSize, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNippleAreola
		WMorphs.MultNippleAreola = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNippleAreola, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNippleUp
		WMorphs.MultNippleUp = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNippleUp, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNippleDown
		WMorphs.MultNippleDown = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNippleDown, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultNippleTip
		WMorphs.MultNippleTip = a_value
		SetSliderOptionValue(a_option, WMorphs.MultNippleTip, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultArms
		WMorphs.MultArms = a_value
		SetSliderOptionValue(a_option, WMorphs.MultArms, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultShoulderSmooth
		WMorphs.MultShoulderSmooth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultShoulderSmooth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultShoulderWidth
		WMorphs.MultShoulderWidth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultShoulderWidth, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBelly
		WMorphs.MultBelly = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBelly, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultPregnancyBelly
		WMorphs.MultPregnancyBelly = a_value
		SetSliderOptionValue(a_option, WMorphs.MultPregnancyBelly, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultTummyTuck
		WMorphs.MultTummyTuck = a_value
		SetSliderOptionValue(a_option, WMorphs.MultTummyTuck, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBack
		WMorphs.MultBack = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBack, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultHipbone
		WMorphs.MultHipbone = a_value
		SetSliderOptionValue(a_option, WMorphs.MultHipbone, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultHips
		WMorphs.MultHips = a_value
		SetSliderOptionValue(a_option, WMorphs.MultHips, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultButtCrack
		WMorphs.MultButtCrack = a_value
		SetSliderOptionValue(a_option, WMorphs.MultButtCrack, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultButt
		WMorphs.MultButt = a_value
		SetSliderOptionValue(a_option, WMorphs.MultButt, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultBigButt
		WMorphs.MultBigButt = a_value
		SetSliderOptionValue(a_option, WMorphs.MultBigButt, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultAppleCheeks
		WMorphs.MultAppleCheeks = a_value
		SetSliderOptionValue(a_option, WMorphs.MultAppleCheeks, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultRoundAss
		WMorphs.MultRoundAss = a_value
		SetSliderOptionValue(a_option, WMorphs.MultRoundAss, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultSlimThighs
		WMorphs.MultSlimThighs = a_value
		SetSliderOptionValue(a_option, WMorphs.MultSlimThighs, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultThighs
		WMorphs.MultThighs = a_value
		SetSliderOptionValue(a_option, WMorphs.MultThighs, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultLegs
		WMorphs.MultLegs = a_value
		SetSliderOptionValue(a_option, WMorphs.MultLegs, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultKneeHeight
		WMorphs.MultKneeHeight = a_value
		SetSliderOptionValue(a_option, WMorphs.MultKneeHeight, "{2}")
		WMorphs.UpdateWeight()
	ElseIf a_option == _myMultCalfSmooth
		WMorphs.MultCalfSmooth = a_value
		SetSliderOptionValue(a_option, WMorphs.MultCalfSmooth, "{2}")
		WMorphs.UpdateWeight()
	EndIf
EndEvent


Function EnableScan(Bool enabled = True)
	If enabled
		SetOptionFlags(_myEnabled, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myScanFood, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myCustomFood, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myIngredients, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myPotions, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myMultLoss, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myMultGainLight, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myMultGainMedium, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myMultGainHeavy, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myMultGainDevourment, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myMinWeight, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myMaxWeight, OPTION_FLAG_NONE, True)
		SetOptionFlags(_myWeight, OPTION_FLAG_NONE, True)
		SetTextOptionValue(_myScanFood, "$WEIGHTMORPHS_SCANFOOD")
	Else
		SetOptionFlags(_myEnabled, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myScanFood, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myCustomFood, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myIngredients, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myPotions, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myMultLoss, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myMultGainLight, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myMultGainMedium, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myMultGainHeavy, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myMultGainDevourment, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myMinWeight, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myMaxWeight, OPTION_FLAG_DISABLED, True)
		SetOptionFlags(_myWeight, OPTION_FLAG_DISABLED, True)
		SetTextOptionValue(_myScanFood, "$WEIGHTMORPHS_SCANNING")
	EndIf
EndFunction

String Function GetSKSEVersion()
	Return SKSE.GetVersion() as String + "." + SKSE.GetVersionMinor() as String  + "." + SKSE.GetVersionBeta() as String
EndFunction

Int Function CheckSKSEVersion(Int major, Int minor, Int beta)
	Int skseMajor = SKSE.GetVersion()
	Int skseMinor = SKSE.GetVersionMinor()
	Int skseBeta  = SKSE.GetVersionBeta()

	If skseMajor == major
		If skseMinor == minor
			If skseBeta == beta
				Return 0
			ElseIf skseBeta > beta
				Return 1
			Else
				Return -1
			EndIf
		ElseIf skseMinor > minor
			Return 1
		Else
			Return -1
		EndIf
	ElseIf skseMajor > major
		Return 1
	Else
		Return -1
	EndIf
EndFunction
